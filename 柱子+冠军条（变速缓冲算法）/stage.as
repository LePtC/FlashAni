stop();
var fp: int = 2; // 几帧过一个数据
stage.frameRate = 60;
stage.quality = "best";

import flash.display.*;
import flash.text.*;
import flash.events.*;
import flash.net.*;

var i: int;
var j: int;

var t: int = 0;
var T: int = 1; // 数据从第3行开始
var tres: int = 0;

include "data.as";


var Num: int = da[1].length - 1; // 计算条目数


var RKcon: Sprite = new Sprite(); // Rank 容器
RKcon.x = 100;
RKcon.y = 220;
addChildAt(RKcon,1);

var rk: rankBar;
for(i = 0; i < Num; i++) {
	rk = new rankBar();
	rk.initialize(i + 1, da[0][i + 1], da[1][i + 1]);
	RKcon.addChildAt(rk, i);
}

var bar1: rankBar;
var bar2: rankBar;

var po: Number; // population

var maxr:Number; // 计算缩放率用

var Tcon: Sprite = new Sprite(); // 冠军条容器
addChildAt(Tcon, 3);

var rect: Sprite = new Sprite();
Tcon.addChild(rect);

var lastid:String; // 更新冠军头像
var Icon: Sprite = new Sprite(); // 冠军头像容器
addChildAt(Icon, 4);



var BKcon: Sprite = new Sprite(); // 背景线容器
BKcon.x=RKcon.x+60;
BKcon.y=190;
addChildAt(BKcon, 0);

var bkList: Array = [1,2,5,10,20,50,100,200,500,1000,2000,3000,5000];

var bk:bkgL;
for(i = 0; i < bkList.length; i++) {
  bk = new bkgL();
  bk.initialize(bkList[i]);
  BKcon.addChild(bk);
}



stage.addEventListener(Event.ENTER_FRAME, movie);

function movie(event: Event): void {


  if(t==1){maxr=1;lastid="2"} // 解决某个 as 的 bug

	if(t < da.length * fp) {
		t++;
	} else {
		stage.removeEventListener(Event.ENTER_FRAME, movie);
	}

	tres = t % fp;
	if(tres == 0) {
		T++;
		if(T < da.length) {
			yeart.text = da[T][0];
		}
	}
	for(i = 0; i < RKcon.numChildren; i++) {
		rk = RKcon.getChildAt(i) as rankBar;
		j = rk.n;
		if(T < da.length - 1) {
			po = (da[T][j] * (fp - tres) + da[T + 1][j] * tres) / fp; // 线性补间

			rk.update(po);

			//rk.updatev(da[T][0]);

		}
	}

	// 冒泡排序法
	for(i = 1; i < RKcon.numChildren; i++) {
		bar1 = RKcon.getChildAt(i) as rankBar;

		for(j = i - 1; j >= 0; j--) {
			var bar2: rankBar = RKcon.getChildAt(j) as rankBar;
			if(bar1.fan > bar2.fan) {
				bar1.rank = j;
			}
		}
		RKcon.setChildIndex(bar1, bar1.rank);
	}


  bar1 = RKcon.getChildAt(0) as rankBar;
  kuangmo.text="投稿狂魔："+bar1.cn;
  uid.text="uid: "+bar1.id;
  shichang.text="稿件总时长："+bar1.day+"天"+bar1.hou+"小时";

if(bar1.id!=lastid){
  trace(bar1.id);
  var icon: Loader = new Loader();
  icon.contentLoaderInfo.addEventListener(Event.COMPLETE, iconLoaded);
  icon.load(new URLRequest(bar1.id+".png"));
  lastid=bar1.id;
}

  //maxr = 26/bar1.fan; // 缩放最长条到 26*20 宽
  maxr += (26/bar1.fan-maxr)/20; // 加点缓冲

	for(i = 0; i < RKcon.numChildren; i++) {
		bar1 = RKcon.getChildAt(i) as rankBar;
		bar1.rank = i;
		bar1.updatey(i,maxr); //bkggrid.scaleX
	}


  for(i = 0; i < BKcon.numChildren; i++) {
    bk = BKcon.getChildAt(i) as bkgL;
    bk.updatex(maxr);
  }


  // 冠军条
  yeart.x += 0.2;
  current.x = yeart.x + 450;
  if(t % 2 == 0) {
    bar1 = RKcon.getChildAt(0) as rankBar;
    rect.graphics.beginFill(bar1.col);
    rect.graphics.drawRect(yeart.x + 450 - 0.4, 88, 0.4, 15);
    rect.graphics.endFill();
  }
  if(t % fp == 0 && da[T][0].slice(5, 10) == "01月01") {
    var ye: yearL = new yearL();
    ye.te.text = da[T][0].slice(0, 4);
    ye.x = current.x;
    ye.y = current.y + 80;
    Tcon.addChildAt(ye, 0);
  }


}



function iconLoaded(e: Event): void {

  var image: Bitmap = new Bitmap(e.target.content.bitmapData);
  image.width = 300;
  image.height = 300;
  image.x = 1400;
  image.y = 700;
  if(Icon.numChildren>0){
    Icon.removeChildAt(0);
  }
    Icon.addChild(image);

}
