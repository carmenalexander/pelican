# -*- coding: utf-8 -*-
"""
    Article Thumbnail Plugin for Pelican
    =======================================

    Will Hart [github: @will-hart]

    A plugin to generate thumbnail image for an article provided
    in the article's meta data. Requires Python Imaging Library (PIL)
    which you can get by typing ``pip install pil`` into the command
    line.

    You may also want to have a look around for PIL installation
    instructions as its not always simple... for instance
    ``http://jj.isgeek.net/2011/09/install-pil-with-jpeg-support-on-ubuntu-oneiric-64bits/``_

    Settings
    -----------

    To enable, add

        from pelican.plugins import article_thumbnail
        PLUGINS = [article_thumbnail]

    to your settings.py.  You can optionally customise the thumbnails in
    your settings file.  The settings and their defaults are shown below::

        THUMBNAIL_PATH = 'static/thumbs'
        THUMBNAIL_WIDTH = 100
        THUMBNAIL_HEIGHT = 100
        THUMBNAIL_PREFIX = 'thumb_'
        THUMBNAIL_DEFAULT = 'images/thumb_default.png'

    ``THUMBNAIL_DEFAULT`` is used if no thumbnail path is provided
    in the metadata.  No default image is provided - this is up to you!

    Usage
    ---------

    In your article metadata you will need (rst example)::

        :thumbnail: imagename.png

    The image path should be relative to the 'content' directory.

    To use the thumbnail in a template::

        {% if article.has_thumb %}
        <img src="{{article.thumbnail_url}}">
        {% endif %}

"""

from pelican import signals
from pelican import settings

import Image
import logging
import os
import shutil

# defaults
thumb_settings = {}

# set up logging
logger = logging.getLogger(__name__)


def generate_thumbnail_settings(pelican):
    """
    parse the settings or use defaults
    """
    thumb_settings['path'] = \
        pelican.settings.get('THUMBNAIL_PATH', 'static/thumbs')
    thumb_settings['width'] = \
        pelican.settings.get('THUMBNAIL_WIDTH', 100)
    thumb_settings['height'] = \
        pelican.settings.get('THUMBNAIL_HEIGHT', 100)
    thumb_settings['prefix'] = \
        pelican.settings.get('THUMBNAIL_PREFIX', 'thumb_')
    thumb_settings['default_path'] = os.path.abspath(os.path.join(
        'content',
        pelican.settings.get('THUMBNAIL_DEFAULT', 'images/thumb_default.png')
    ))
    thumb_settings['default_thumb'] = os.path.split(
        thumb_settings['default_path'])[-1]
    thumb_settings['base_url'] = pelican.settings['SITEURL']

    # create the 'output/{{thumbs_path}}' directory
    output_dir = os.path.join('output', thumb_settings['path'])
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # copy the default file to the output directory
    # only copy if the thumbnail exists.
    if os.path.exists(thumb_settings['default_path']):
        shutil.copy(thumb_settings['default_path'], output_dir)
    else:
        logger.warning(u'Could not find default thumbnail at %s' % 
            thumb_settings['default_path'])


def generate_article_thumb(generator, metadata):
    """
    Generates a thumbnail for the given article if a thumbnail
    path is given
    """
    if 'thumbnail' not in metadata:
        # no thumbnail given, set default
        metadata['thumbnail_url'] = os.path.join(
            thumb_settings['base_url'],
            thumb_settings['path'],
            thumb_settings['default_thumb']
        )
        metadata['has_thumb'] = False

    else:
        # get the output path
        image_name = os.path.split(metadata['thumbnail'])[-1]
        out_path = os.path.abspath(os.path.join(
            'output',
            thumb_settings['path'],
            thumb_settings['prefix'] + image_name
        ))

        # generate the thumbnail
        im = Image.open(os.path.join('content', metadata['thumbnail']))
        im.thumbnail(
            (thumb_settings['width'], thumb_settings['height']),
            Image.ANTIALIAS
        )
        im.save(out_path)

        # set the metadata
        metadata['thumbnail_url'] = os.path.join(
            thumb_settings['base_url'],
            thumb_settings['path'],
            thumb_settings['prefix'] + image_name
        )
        metadata['has_thumb'] = True


def register():
    """
    Register the plugin
    """
    signals.initialized.connect(generate_thumbnail_settings)
    signals.article_generate_context.connect(generate_article_thumb)
