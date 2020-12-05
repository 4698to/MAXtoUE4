# 3dsMAX to Unreal Tools 1.0.1

## 0. 这个是干啥的

[B站视频-3dsMAX 发送到UE4](https://www.bilibili.com/video/BV1T5411b7jW/)

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1600739755429.png)

在3ds MAX 中把模型和动画直接一键发送到 ue4 引擎中，原理也很简单，就是利用unreal.python操作导入FBX。


### 使用步骤

1.  设置FBX文件名，Get 按钮是快捷将 Max 文件名设置为FBX文件名，
2.  设置虚幻项目中的资源路径
3.  发送


*    FBX文件名 ： 发送到UE4之后的资源名称
*    导入设置- 材质 ： 是否发送模型材质
*    导入设置- 原点导出 ： 发送静态模型时是否归原点
*    Mesh Folder ： 发送保存 模型 的编辑器路径
*    Animation Folder ： 发送保存 动画 的编辑器路径
*    Skeleton asset： 接受动画的骨架文件 Skeleton ssset 编辑器路径
*    导出保存文件夹 FBX ： 3dsMAX 导出FBX的临时路径

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/008-1603177073524.png)

---

##   安装

*   3dsMax 2018 为界分两个版本
    +   2015-2016
    +   2018-2019-2020



### 1    -  将下载的zip解压，然后把和你使用的3dsMAX 对应版本的MaxSendUnreal 文件夹复制到 D:\Program Files\Autodesk\3ds Max 2015\scripts  路径下（注意你自己的MAX安装路径），如下图

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599098593595.png)

### 2   -   将 3dsMaxSendUnreal_menu_v1.ms 直接拖进MAX中运行

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599098740582.png)

----

##  虚幻引擎设置

一定要如下设置，否则无法使用，还会让3ds MAX 崩溃掉。

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599099100745.png)

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599099155765.png)

如上设置后需要重启 UE4 。

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599099256516.png)

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599099287756.png)


----

## 3. 使用


![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1600739884397.png)



![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599100023419.png)

## 1.0.1 更新

*   添加发送静态模型时的 原点导出选选项，将选中模型自动设置到原点发送
*   添加FBX文件名选项, 可以手动输入,避免旧版中固定文件名问题
*   Get 按钮，根据MAX文件名自动设置FBX文件夹名,提取第一 个 “-”减号前面 的字符为FBX文件名
    (目前不排除中文，请手动避免FBX文件夹出现中文)
*   修复路径输入光标问题，添加历史记录(只保存6条历史输入)

## 注意事项

*   发送 骨架模型 要选择蒙皮模型和骨骼； 发送 动画 只选择骨骼（先指定骨架文件）

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1600742087966.png)

*   导入动画 需要填上 骨架 文件路径，如下图中

在UE4编辑器中选中你的骨架文件 Skeletal asset，右键菜单中 选择复制引用 Copy Reference ，然后黏贴进来即可 ；没有指定骨架，无法发送动画。

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1599100232981.png)

*   如果MAX文件没有保存，没有文件名，无法导出FBX和发送。也可以自行修改 FbxExporter_struat.ms 中的导出文件名相关函数。

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1600740221629.png)

*   发送骨架模型和发送动画，注意MAX文件名，如果在同一个文件里导出骨架模型和动画，最后一次发送将会覆盖上一次发送的结果。

初版设计的导出FBX发送规则是 按MAX 文件名来的，栗子：
* MAX文件名：0001_1000_00-待机_计算.max
* 导出FBX文件名将会是：0001_1000_00.FBX 提取文件名中的减号前段字符。
* 发送模型骨架UE4中的结果：模型文件  0001_1000_00 ，骨架 0001_1000_00_Skeleton
* 发送动画UE4中的结果： 动画文件 0001_1000_00

发送骨架也是这个文件名的FBX，发送动画同样也是， 这样后面发送的动画将会覆盖前面发送的模型。
![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1600741643574.png)

看上图虽然文件名是一样的，但是并没有覆盖，因为我设置了单独保存动画的 Animation 文件夹，
但是动画FBX文件还是覆盖了模型FBX，如果你模型文件夹和动画文件夹设置的是同一路径，那不止是FBX被覆盖，连UE4中的模型文件同样也被动画文件覆盖。

这个重名FBX发送问题，在不同版本MAX中有不同表现，至少我在MAX2019 中测试，骨架模型和动画重名的FBX，后操作的无法发送成功，在 MAX2015 中则可以发送。

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/003/03/02-1600741868846.png)

# 下载

1.0.1 - 2015_2016

链接：https://pan.baidu.com/s/1CZY8BmlWE1aY8G0KLbGDXA
提取码：mcs7

1.0.1 - 2018_2020
链接：https://pan.baidu.com/s/18jnbSZ0qVadHou_V0tiZOw
提取码：vo91

----
1.0.0 - 2015_2016 2018_2020

链接：https://pan.baidu.com/s/1eVLwMM2GdUGAC1sr9FTjZg
提取码：sce6

密码：nd123456


反馈交流群号：109185941
点击链接加入群聊【天晴工具组】：https://jq.qq.com/?_wv=1027&k=YJSgv3fe

如果觉的工具好用，欢迎捐赠以示支持，让洒家有动力更新啊

![](https://github.com/4698to/Biped-Key-Tool/raw/master/img/1516971249924.jpg)


