Pelican |build-status| |coverage-status|
========================================

Pelican is a static site generator, written in Python_.

* Write content in reStructuredText_ or Markdown_ using your editor of choice.
* Includes a simple command line tool to (re)generate site files.
* Easy to interface with version control systems and web hooks.
* Completely static output is simple to host anywhere.


Features
--------

Pelican currently supports:

* Blog articles and static pages
* Integration with external services (ex. Google Analytics and Disqus)
* Site themes (created using Jinja2_ templates)
* Publication of articles in multiple languages
* Generation of Atom and RSS feeds
* Syntax highlighting via Pygments_
* Importing existing content from WordPress, Dotclear, and more services
* Fast rebuild times due to content caching and selective output writing

Check out `Pelican's documentation`_ for further information.


Frequently Asked Questions
--------------------------

    Why the name *Pelican*?

"Pelican" is an anagram of *calepin*, which means "notebook" in French.

    How does Pelican work under the hood?

Pelican's source code is `hosted on GitHub`_. If you're feeling hackish,
take a look at `Pelican's internals`_.

    How can I get help, contribute, or provide feedback?

See our `contribution submission and feedback guidelines <CONTRIBUTING.rst>`_.


.. Links

.. _Python: http://www.python.org/
.. _reStructuredText: http://docutils.sourceforge.net/rst.html
.. _Markdown: http://daringfireball.net/projects/markdown/
.. _Jinja2: http://jinja.pocoo.org/
.. _Pygments: http://pygments.org/
.. _`Pelican's documentation`: http://docs.getpelican.com/
.. _`Pelican's internals`: http://docs.getpelican.com/en/latest/internals.html
.. _`hosted on GitHub`: https://github.com/getpelican/pelican

.. |build-status| image:: https://img.shields.io/travis/getpelican/pelican/master.svg
   :target: https://travis-ci.org/getpelican/pelican
   :alt: Travis CI: continuous integration status
.. |coverage-status| image:: https://img.shields.io/coveralls/getpelican/pelican.svg
   :target: https://coveralls.io/r/getpelican/pelican
   :alt: Coveralls: code coverage status

