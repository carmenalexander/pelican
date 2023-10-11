��                          �        �  �  �  �   S  �   �  �   n  �   �     �     �  �   �  �   O  �   �  �   �     �	  #   �	  R   �	  b   O
  �   �
  	   Z  �   d    �  Q   
  ]   \  b   �  d     V   �  D   �  I     Y   h  h   �  {  +  e   �       �    y   �  |   +  |   �  |   %     �     �  �   �  �   [  �     �   �  	   �  A   �  U     P   o  �   �     h  p   u  �   �  N   �  X     S   h  O   �  S     ;   `  E   �  e   �  e   H   (Keep in mind that some operating systems will require you to prefix the above command with ``sudo`` in order to install Pelican system-wide.) Dependencies If run inside an activated virtual environment, ``pelican-quickstart`` will look for an associated project path inside ``$VIRTUAL_ENV/.project``. If that file exists and contains a valid directory path, the new Pelican project will be saved at that location. Otherwise, the default is the current working directory. To set the new project path on initial invocation, use: ``pelican-quickstart --path /your/desired/directory`` If you have Git installed and prefer to install the latest bleeding-edge version of Pelican rather than a stable release, use the following command:: If you installed Pelican via distutils or the bleeding-edge method, simply perform the same step to install the most recent version. If you installed a stable Pelican release via Pip_ and wish to upgrade to the latest stable release, you can do so by adding ``--upgrade``:: If you plan on using `Markdown <https://pypi.org/project/Markdown/>`_ as a markup format, you can install Pelican with Markdown support:: Installing Pelican Kickstart your site Once Pelican has been installed, you can create a skeleton project via the ``pelican-quickstart`` command, which begins by asking some questions about your site:: Once Pelican is installed, you can run ``pelican --help`` to see basic usage options. For more detail, refer to the :doc:`Publish<publish>` section. Once the virtual environment has been created and activated, Pelican can be installed via ``python -m pip install pelican`` as noted above. Alternatively, if you have the project source, you can install Pelican using the distutils method:: Once you finish answering all the questions, your project will consist of the following hierarchy (except for *pages* — shown in parentheses below — which you can optionally add yourself if you plan to create non-chronological content):: Optional packages Or, if you plan on using Markdown:: Pelican currently runs best on 3.7+; earlier versions of Python are not supported. The next step is to begin to adding content to the *content* folder that has been created for you. Typographical enhancements can be enabled in your settings file, but first the requisite `Typogrify <https://pypi.org/project/typogrify/>`_ library must be installed:: Upgrading When Pelican is installed, the following dependent Python packages should be automatically installed without any action on your part: While the above is the simplest method, the recommended approach is to create a virtual environment for Pelican via virtualenv_ before installing Pelican. Assuming you have virtualenv_ installed, you can then open a new terminal session and create a new virtual environment for Pelican:: You can install Pelican via several different methods. The simplest is via Pip_:: `MarkupSafe <https://pypi.org/project/MarkupSafe/>`_, for a markup-safe string implementation `blinker <https://pypi.org/project/blinker/>`_, an object-to-object and broadcast signaling system `docutils <https://pypi.org/project/docutils/>`_, for supporting reStructuredText as an input format `feedgenerator <https://pypi.org/project/feedgenerator/>`_, to generate the Atom feeds `jinja2 <https://pypi.org/project/Jinja2/>`_, for templating support `pygments <https://pypi.org/project/Pygments/>`_, for syntax highlighting `python-dateutil <https://pypi.org/project/python-dateutil/>`_, to read the date metadata `unidecode <https://pypi.org/project/Unidecode/>`_, for ASCII transliterations of Unicode text utilities Project-Id-Version: Pelican 4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-10-11 10:44+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.13.0
 （在某些操作系统中，需要在命令前加 ``sudo`` 才能在整个系统上安装Pelican） 依赖 如果是在虚拟环境中执行 ``pelican-quickstart`` ，系统会自动在 ``$VIRTUAL_ENV/.project`` 目录中查找这个命令若这个这个命令存在并且路径是正确的，一个新的Pelican项目就会在目标位置创建。否则，会默认在当前的工作目录下创建这个项目。若要在初始化时指定项目路径，请使用 ``pelican-quickstart --path /your/desired/directory`` 如果安装过Git，并且您希望安装Pelican的最最新版本（而不是稳定版），请使用下面的命令： 对于通过distutils安装的或是通过Git安装的最最新版的Pelican再做一遍和安装时同样的步骤即可。 对于通过 Pip_ 安装的稳定版本的Pelican，可以通过在安装命令中加 ``--upgrade`` 来升级到最新版： 如您希望使用 `Markdown <https://pypi.org/project/Markdown/>`_ 来写作执行下面的命令来安装Markdown支持： 安装Pelican 启动网站 Pelican安装完成后，通过 ``pelican-quickstart`` 命令创建项目的整体框架执行这个命令后，您需要输入一些站点相关的信息： 当您安装了Pelican，可以执行 ``pelican --help`` 命令来查看一些基本的用法。从文档的 :doc:`Publish<publish>` 章节可以了解更多信息。 当创建并激活虚拟环境后，使用之前提到过的命令 ``python -m pip install pelican`` 就可以安装Pelican了。或者，如果您想要从源码安装，可以通过distutils的安装脚本完成： 当您回答完所有问题后，项目就会创建。项目中会包含下述的一些层级结构（除了用括号括起来的 *pages*）如果有一些内容不需要按时间排序，您可以将它们放在（pages）所在的位置： 可选包 如果您需要使用Markdown，请使用下面的命令安装： Pelican需要运行在3.7版本以上的Python，低版本的Python是不支持的。 下一步就可以开始往 *content* 目录中添加自己创建的内容了。 Pelican还支持排版增强，若您需要使用，请先安装 `Typogrify <https://pypi.org/project/typogrify/>`_ 库，稍后您可以在设置文件中启用它。 更新升级 当Pelican安装完成后，下面的所有Python依赖应该都会自动安装，无需另外做任何操作： 尽管上面是最简单的安装方法，但我们推荐使用虚拟环境 virtualenv_ 完成Pelican的安装。当您安装好了 virtualenv_ 后，打开一个新的命令行来为Pelican创建一个虚拟环境： 有几种不同的方法可以安装Pelican，最简单的就是通过 Pip_： `MarkupSafe <https://pypi.org/project/MarkupSafe/>`_，用于转义字符的安全处理 `blinker <https://pypi.org/project/blinker/>`_，对象-对象的信号广播系统 `docutils <https://pypi.org/project/docutils/>`_，用于reStructuredText格式 `feedgenerator <https://pypi.org/project/feedgenerator/>`_，用于生成Atom feeds `jinja2 <https://pypi.org/project/Jinja2/>`_，用于模板 `pygments <https://pypi.org/project/Pygments/>`_，用于语法高亮 `python-dateutil <https://pypi.org/project/python-dateutil/>`_，用于读取日期相关的元数据 `unidecode <https://pypi.org/project/Unidecode/>`_，用于将Unicode文本转为ASCII字符的音译 