# -*- coding: utf-8 -*-
from __future__ import print_function, unicode_literals

import argparse
import logging
import os
import posixpath
import ssl
import sys

try:
    from magic import from_file as magic_from_file
except ImportError:
    magic_from_file = None

from six.moves import BaseHTTPServer
from six.moves import SimpleHTTPServer as srvmod
from six.moves import urllib


def parse_arguments():
    parser = argparse.ArgumentParser(
        description='Pelican Development Server',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument("port", default=8000, type=int, nargs="?",
                        help="Port to Listen On")
    parser.add_argument("server", default="", nargs="?",
                        help="Interface to Listen On")
    parser.add_argument('--ssl', action="store_true",
                        help='Activate SSL listener')
    parser.add_argument('--cert', default="./cert.pem", nargs="?",
                        help='Path to certificate file. ' +
                        'Relative to current directory')
    parser.add_argument('--key', default="./key.pem", nargs="?",
                        help='Path to certificate key file. ' +
                        'Relative to current directory')
    parser.add_argument('path', default=".",
                        help='Path to pelican source directory to serve. ' +
                        'Relative to current directory')
    return parser.parse_args()


class ComplexHTTPRequestHandler(srvmod.SimpleHTTPRequestHandler):
    SUFFIXES = ['', '.html', '/index.html']
    RSTRIP_PATTERNS = ['', '/']

    def translate_path(self, path):
        # abandon query parameters
        path = path.split('?', 1)[0]
        path = path.split('#', 1)[0]
        # Don't forget explicit trailing slash when normalizing. Issue17324
        trailing_slash = path.rstrip().endswith('/')
        path = urllib.parse.unquote(path)
        path = posixpath.normpath(path)
        words = path.split('/')
        words = filter(None, words)
        path = self.base_path
        for word in words:
            if os.path.dirname(word) or word in (os.curdir, os.pardir):
                # Ignore components that are not a simple file/directory name
                continue
            path = os.path.join(path, word)
        if trailing_slash:
            path += '/'
        return path

    def do_GET(self):
        # cut off a query string
        if '?' in self.path:
            self.path, _ = self.path.split('?', 1)

        found = False
        # Try to detect file by applying various suffixes and stripping
        # patterns.
        for rstrip_pattern in self.RSTRIP_PATTERNS:
            if found:
                break
            for suffix in self.SUFFIXES:
                if not hasattr(self, 'original_path'):
                    self.original_path = self.path

                self.path = self.original_path.rstrip(rstrip_pattern) + suffix
                path = self.translate_path(self.path)

                if os.path.exists(path):
                    srvmod.SimpleHTTPRequestHandler.do_GET(self)
                    logging.info("Found `%s`.", self.path)
                    found = True
                    break

                logging.info("Tried to find `%s`, but it doesn't exist.", path)

        if not found:
            # Fallback if there were no matches
            logging.warning("Unable to find `%s` or variations.",
                            self.original_path)

    def guess_type(self, path):
        """Guess at the mime type for the specified file.
        """
        mimetype = srvmod.SimpleHTTPRequestHandler.guess_type(self, path)

        # If the default guess is too generic, try the python-magic library
        if mimetype == 'application/octet-stream' and magic_from_file:
            mimetype = magic_from_file(path, mime=True)

        return mimetype


class RootedHTTPServer(BaseHTTPServer.HTTPServer):
    def __init__(self, base_path, *args, **kwargs):
        BaseHTTPServer.HTTPServer.__init__(self, *args, **kwargs)
        self.RequestHandlerClass.base_path = base_path


if __name__ == '__main__':
    args = parse_arguments()
    RootedHTTPServer.allow_reuse_address = True
    try:
        httpd = RootedHTTPServer(
            (args.server, args.port),
            ComplexHTTPRequestHandler)
        if args.ssl:
            httpd.socket = ssl.wrap_socket(
                httpd.socket, keyfile=args.key,
                certfile=args.cert, server_side=True)
    except ssl.SSLError as e:
        logging.error("Couldn't open certificate file %s or key file %s",
                      args.cert, args.key)
        logging.error("Could not listen on port %s, server %s.",
                      args.port, args.server)
        sys.exit(getattr(e, 'exitcode', 1))

    logging.info("Serving at port %s, server %s.",
                 args.port, args.server)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt as e:
        logging.info("Shutting down server.")
        httpd.socket.close()
