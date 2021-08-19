# 1、flutter_widgets_example flutter_web分支创建目的
最近把Flutter版本升级到2.0之后，代码稍微修改了一下，据说2.0之后支持桌面和web，所以暂时开始尝试看看能不能编译到web，新开分支flutter_web作为web版本；

不一定能尝试成功，但不尝试一定失败！


# 2、工程修改过程
## 2.1、<2021-08-17>尝试了确实失败了！

主要原因：按照部分谷歌到的不步骤对项目进行更改，但是一直运行不起来。

项目中很多库不支持web，还有众多的版本兼容问题；暂时搁置。。。

体验flutter_web应该会新启一个工程；

    新启项目链接：https://github.com/KeepStudyingAce/flutter_web_app

引入了一个轮播图库flutter_swiper运行起来了,简单记录过程。


## 2.2、<2021-08-18>
通过直接创建flutter_web新工程有的思路，可能是更新版本的问题。

1、现在不需要更改flutter为flutter_web；

2、不需要添加web文件夹；直接运行

    flutter run --no-sound-null-safety -d chrome


需要注意的是部分库在flutter_web环境下是不支持的，项目中遇到不支持的第一个就是 'dart:io';

# 3、初步总结：
    
    1、其实当项目在web上面运行起来的时候还是很开心的，虽然过程并不困难，但是不去做的话始终想不到这么快就能跑起来。当然，跑起来和最后项目能正常运行还有很大的差距，因为很多库还需要做平台兼容，不过至少成功了第一步。

   

# 4、关于打包成web包的补充

 1、打包：打包的时候如果没有web文件夹的话是会报错的，所以还是需要添加web文件夹，里面有index.html和manifest.json文件，应该是打包成web发布需要的文件：

创建web文件夹，输入下面的命令创建web文件

    flutter create .
然后就会创建一系列web相关的文件 ,如下图, 目录结构也会多一个web的文件夹.
    
2、关于打包的几种方式：


    flutter build web --web-renderer html

    flutter build web 

    flutter build web --web-renderer canvaskit

经过测试,上面三种方式都可以打包web版本, 其中第一种是针对移动端的打包方式, 第二种是一般的打包方式, 第三种是针对pc端的打包方式.

那这3种方式打包出来,运行起来有什么不同呢

    flutter build web --web-renderer html 打开速度最快,兼容性好(是指ie,chrome,safari等浏览器兼容)

    flutter build web 打开速度一般,兼容性好

    flutter build web --web-renderer canvaskit 打开速度最慢,兼容性好

结论

就是使用第一种打包方式会比较好

3、打包成功后遇到的问题：
找到了index.html,用浏览器打开一片空白

这个属于正常的, 这个不像前端web ,html css js那套,点击index.html就能访问的. 在flutter里面是不能直接访问的,一定要放到容器里面去才能访问，如:tomcat等

4、已经放到tomcat了,用浏览器打开还是一片空白

那是因为文件路径引用不对.解决办法有2种
方法1:
用编辑器打开index.html,能看到源文件,把最前面的< base href="/">,改成< base href="">

方法2:
用编辑器打开index.html,能看到源文件,把< base href="/">,改成你服务器的路径比喻说:
< base href="http://192.168.1.80:3350/web/">

5、本地安装好tomcat后将打包好的web文件夹放在tomcat目录下的webapps下，具体路径和访问路径一致就行，我的是
        
    webapps/flutter_app/web
    
然后将index.html文件的
        
    < base href="/">
改为
    
    < base href="http://localhost:8080/flutter_app/web/">

本地打开地址：
    
    http://localhost:8080/flutter_app/web

即能看到。

