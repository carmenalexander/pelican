��    0      �                L     �   j  ;      X   <     �     �  #   �     �     �  �        �      �  �  �     ~     �     �     �     �     �  *   �          &  O   9     �     �  >   �  m   �  �   j	     
     
  ~   4
     �
  �   �
     �  -   �  
   �     �  �   �     �     �  %        )  	   5  M   ?  �   �  G   &  p   n  {  �  Z   [  �   �  T   ]  B   �     �       4   (     ]     d  d   k     �  1   �  �       �  2   �     �     �               (     G     Z  a   g  "   �     �  D   �  v   >  �   �     �  2   �  q   �     C  �   J     	  9   %  
   _  3   j    �     �     �  6   �     	  	     f     �   �  E     n   _   (Tumblr only) api_key can be obtained from https://www.tumblr.com/oauth/apps *BeautifulSoup4* and *lxml*, for WordPress and Dotclear import. Can be installed like any other Python package (``pip install BeautifulSoup4 lxml``). *Feedparser*, for feed import (``pip install feedparser``). *Pandoc*, see the `Pandoc site`_ for installation instructions on your operating system. Blog name used in Tumblr API Blogger XML export Blogger XML export (default: False) Dependencies Description Disable storing slugs from imported posts within output. With this disabled, your Pelican URLs may not be consistent with your original posts. (default: False) Dotclear export Dotclear export (default: False) Download files uploaded to wordpress as attachments. Files will be added to posts as a list in the post header and links to the files within the post will be updated. All files will be downloaded, even if they aren't associated with a post. Files will be downloaded with their original path inside the output directory, e.g. "output/wp-uploads/date/postname/file.jpg". (wordpress import only) (requires an internet connection) Examples Feed to parse (default: False) For Blogger:: For Dotclear:: For Tumblr:: For WordPress:: Import only post from the specified author Importing an existing site Optional arguments Output markup format: ``rst``, ``markdown``, or ``asciidoc`` (default: ``rst``) Output path (default: content) Positional arguments Put files in directories with categories name (default: False) Put files recognised as pages in "pages/" sub- directory (blogger and wordpress import only) (default: False) Put wordpress custom post types in directories. If used with --dir-cat option directories will be created as "/post_type/category/" (wordpress import only) RSS/Atom feed Show this help message and exit Strip raw HTML code that can't be converted to markup such as flash embeds or iframes (wordpress import only) (default: False) Tests The conversion from HTML to reStructuredText or Markdown relies on `Pandoc`_. For Dotclear, if the source posts are written with Markdown syntax, they will not be converted (as Pelican also supports Markdown). The input file to read To test the module, one can use sample files: Tumblr API Tumblr API (default: False) Unlike Pelican, Wordpress supports multiple categories per article. These are imported as a comma-separated string. You have to resolve these manually, or use a plugin such as `More Categories`_ that enables multiple categories per article. Usage WordPress XML export WordPress XML export (default: False) ``api_key`` ``input`` ``pelican-import`` has some dependencies not required by the rest of Pelican: ``pelican-import`` is a command-line tool for converting articles from other software to reStructuredText or Markdown. The supported import formats are: for Dotclear: http://media.dotaddict.org/tda/downloads/lorem-backup.txt for WordPress: https://www.wpbeginner.com/wp-themes/how-to-add-dummy-content-for-theme-development-in-wordpress/ Project-Id-Version: Pelican 4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-11-19 20:08+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.13.0
 （只会在Tumblr中用到）从 https://www.tumblr.com/oauth/apps 中获取到的api_key 为了能够导入WordPress和Dotclear的内容，需要*BeautifulSoup4* 与 *lxml* 。安装方法与其他Python包相同（ ``pip install BeautifulSoup4 lxml`` ） 为了能够导入订阅源，需要 *Feedparser* （ ``pip install feedparser`` ） 还需要 *Pandoc* ，参照 `Pandoc官方网站`_ 进行安装。 Tumblr API中使用的博客名 Blogger XML export 输入是否为Blogger XML格式（默认：False） 依赖 简介 不保存导入帖子的slug，会导致Pelican的URL和原始帖子不一致。（默认：False） Dotclear export 输入是否为Dotclear格式（默认：False） 下载作为附件上传到WordPress的文件。文件会以列表形式添加到帖子的开头，并且到这些文件的链接都会进行更新。另外，即使某些文件没有在任何帖子中用到，也同样会被下载。文件会被下载到输出文件夹下，并保持原始路径，例如  "output/wp-uploads/date/postname/file.jpg" 。（只有在wordpress中有用，且需要互联网连接） 例子 输入是否为订阅源格式（默认：False） 导入Blogger： 导入Dotclear 导入Tumblr 导入WordPress 只导入某个作者的帖子 导入已有站点 可选参数 输出格式，可选值为： ``rst`` 、 ``markdown`` 、 ``asciidoc`` （默认： ``rst`` ） 输出路径（默认：content） 位置参数 将输出文件按分类名放到各文件夹中（默认：False） 将识别为页面的文件放入 "pages/" 子文件夹中（仅在blogger和wordpress中有用）（默认：False） 将wordpress中的自定义类型博文放到对应文件夹中。如果同时还使用了 --dir-cat 选项，输出转换后文件时会创建诸如 "/post_type/category/" 的文件夹。（只在wordpress中有效） RSS/Atom feed 显示此帮助信息并退出 ``pelican-import``  删除无法转换的HTML代码，例如嵌入的flash或iframe（只在wordpress中有效）（默认：False） 测试 从HTML转换到reStructuredText或Markdown是依赖 `Pandoc`_ 完成的。对于Dotclear，若原帖子是由Markdown语法写的，则无需转换（因为Pelican本就支持Markdown）。 需要读取的输入文件 可以使用下面的文件作为样例，来测试模块 Tumblr API 输入是否为Tumblr API格式（默认：False） 和Pelican不同，在Wordpress中可以将一篇文章同时放在多个分类中。在导入时，各个分类会以逗号分隔，你必须自己手动进行处理。或者也可以使用例如 `More Categories`_ 这样的插件，从而可以将文章放在多个分类中。 用法 WordPress XML export 输入是否为WordPress XML格式（默认：False） ``api_key`` ``input`` ``pelican-import`` 需要用到一些其他依赖，这些依赖只会被 ``pelican-import`` 用到： 命令行工具 ``pelican-import`` 用于将其他软件生成的文章转换成reStructuredText或Markdown格式。支持导入下面这些格式 Dotclear： http://media.dotaddict.org/tda/downloads/lorem-backup.txt WordPress： https://www.wpbeginner.com/wp-themes/how-to-add-dummy-content-for-theme-development-in-wordpress/ 