# 狸子的 Flash 可视化动画模版

有问题建议在 GitHub 上开 issue 问，或者加QQ群：[869200702](http://qm.qq.com/cgi-bin/qm/qr?k=hgiuHM_boX1FmYgsztfpt1Bmw8r7TOcE
) （尽量不要发私信了，搞得我老是重复回答相同的问题 (シ\_ \_)シ


# 柱子+粒子游走模版

（适用于有增有减的数据，单增的数据可使用“柱子+冠军条（变速缓冲算法）”模版）

<table>
  <tr>
    <td>视频教程</td>
    <td><a href="https://www.bilibili.com/video/av29577482">狸子教你用Flash做柱图可视化</a></td>
  </tr>
  <tr>
    <td>成品展示</td>
    <td><a href="https://www.bilibili.com/video/av29475242">【可视化】手机端哪个浏览器用户最多？</a></td>
  </tr>
  <tr>
    <td>其它使用此模版的作品</td>
    <td><a href="http://www.bilibili.com/video/av28473191/">【可视化】哪个浏览器的用户最多？（2009~2018）</a></td>
  </tr>
  <tr>
    <td></td>
    <td><a href="http://www.bilibili.com/video/av28715222/">【可视化】国内各大社交网站的兴衰（2004~2018）</a></td>
  </tr>
  <tr>
    <td></td>
    <td><a href="http://www.bilibili.com/video/av28888596/">【可视化】国内即时通讯软件的兴衰（2004~2018）</a></td>
  </tr>
  <tr>
    <td></td>
    <td><a href="http://www.bilibili.com/video/av29062055//">【可视化】全球即时通讯软件的兴衰（2004~2018）</a></td>
  </tr>
</table>

教程一共用到了以下工具/素材：

- Adobe Flash (Animate) 本体 （不是 Flash Player）
- Adobe Photoshop 把图标处理成 png
- Sublime Text 多点编辑调整数据格式
- Just Color Picker 采集颜色
- 思源黑体 SourceHanSansSC-Medium （如果用模版的字体的话）

# 柱子+曲线图模版

输入数据和准备图片的格式同上，就不再做教程了，成品展示：[av29816713](https://www.bilibili.com/video/av29816713)

<table>
  <tr>
    <td>成品展示</td>
    <td><a href="http://www.bilibili.com/video/av30002425/">【可视化】国内各大直播网站日访问量变迁（2017~2018）</a></td>
  </tr>
  <tr>
    <td>其它使用此模版的作品</td>
    <td><a href="http://www.bilibili.com/video/av29816713/">【可视化】国内各大视频网站日访问量变迁（2017~2018）</a></td>
  </tr>
  <tr>
    <td></td>
    <td><a href="http://www.bilibili.com/video/av30001723/">【可视化】国内各大电商网站日访问量变迁（2017~2018）</a></td>
  </tr>
</table>


### MMA 获取数据

- 获取 Alexa 的网站日访问量数据（目前只能查顶级域名，期限为过去一年）



## 柱子+曲线图模版（白底）

做了期白色背景的，方便懒得做png图标的小伙伴使用 （￣▽￣）

<table>
  <tr>
    <td>成品展示</td>
    <td><a href="https://www.bilibili.com/video/av30826479/">【可视化】哪家快递你用的最多？国内快递网站日访问量变迁（2017~2018）</a></td>
  </tr>
</table>



# 柱子+冠军条（变速缓冲算法）

稿件时长的数据特点是跳跃性强，柱长和排名一下子能跳很多，对这种特点的数据我设计了新的变速运动算法，即“固定比例赶往目标值”算法，数据为单增的小伙伴可以用这个模版


<table>
  <tr>
    <td>成品展示（片尾有简短教程）</td>
    <td><a href="https://www.bilibili.com/video/av30745010/">【可视化】B站投稿狂魔是谁？UP主稿件总时长排行（2010~2018）</a></td>
  </tr>
</table>



### MMA 获取数据

- 爬取B站UP主头像程序


