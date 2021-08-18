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
    
    其实当项目在web上面运行起来的时候还是很开心的，虽然过程并不困难，但是不去做的话始终想不到这么快就困鞥跑起来。当然，跑起来和最后项目能正常运行还有很大的差距，因为很多库还需要更新；