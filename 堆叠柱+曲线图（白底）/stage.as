stop();
var fp: int = 10; // 几帧过一个数据
stage.frameRate = 60;
stage.quality = "best";

import flash.display.*;
import flash.text.*;
import flash.events.*;
import flash.net.*;
import flash.geom.PerspectiveProjection;
import flash.sampler.StackFrame;

var i: int;
var j: int;
var N: int;

var t: int = 0;
var T: int = 0;
var tres: int = 0;


var shrinkTo: Number;


include "data.as";


var Num: int = (da[1].length - 1) / 2; // 计算条目数，堆叠2个


var RKcon: Sprite = new Sprite(); // Rank 容器
RKcon.x = 165;
RKcon.y = 565;
addChildAt(RKcon, 3);

var rk: rankBar;
for(i = 0; i < Num; i++) {
	rk = new rankBar();
	rk.initialize(2 * i + 1, da[0][2 * i + 1]);
	RKcon.addChildAt(rk, i);
}

var bar1: rankBar;
var bar2: rankBar;


var Tcon: Sprite = new Sprite(); // 冠军条容器
addChildAt(Tcon, 4);
var vr: Number = 0.45; // 折线图向右速度
Tcon.y = 420; // 折线图0线位置

var bkList: Array = [0, 50, 100, 200, 300]; // 折线图背景水平线
var hl: HL;
for(i = 0; i < bkList.length; i++) {
	hl = new HL();
	hl.initialize(bkList[i]);
	Tcon.addChild(hl);
}



include "color.as";
var dot: Dot;
for(i = 0; i < Num; i++) {
	dot = new Dot();
	dot.name = i.toString();
	dot.initialize(Co[2 * i]);
	Tcon.addChild(dot);
}


var rect: Sprite = new Sprite();
Tcon.addChild(rect);

var po: Number; // population
var po2: Number;

stage.addEventListener(Event.ENTER_FRAME, movie);

function movie(event: Event): void {


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
		} else {
			T--
		}

	}

	for(i = 0; i < RKcon.numChildren; i++) {
		rk = RKcon.getChildAt(i) as rankBar;
		j = rk.n;
		if(T < da.length - 1) {
			po = (da[T][j] * (fp - tres) + da[T + 1][j] * tres) / fp; // 线性补间
			po2 = (da[T][j + 1] * (fp - tres) + da[T + 1][j + 1] * tres) / fp;

			rk.update(po, po2);

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

	for(i = 0; i < RKcon.numChildren; i++) {
		bar1 = RKcon.getChildAt(i) as rankBar;
		bar1.rank = i;
		bar1.updatey(i, 1);
	}

	/*if(t % 20 == 0) {
    checkDiff();
    if(Pecon.numChildren > 10) {
      Pecon.removeChildAt(0);
    }
  }*/


	yeart.x += vr;
	current.x = yeart.x + 450;

	/*bar1 = RKcon.getChildAt(0) as rankBar;
    rect.graphics.beginFill(bar1.col);
    rect.graphics.drawRect(yeart.x + 450 - 0.3, 88, 0.3, 15);
    rect.graphics.endFill();*/


	if(t % fp == 0 && T > 1 && T < da.length - 1) {
		drawN(1, 3);
		drawN(3, 3);
		drawN(5, 3);
		drawN(7, 3);
	}


	for(N = 0; N < Num; N++) {
		dot = Tcon.getChildByName(N.toString()) as Dot;
		dot.x=current.x;
		dot.y=-(da[T + 1][2*N+1] + da[T + 1][2*N + 2]) / rat; // TODO 线性补间…
		Tcon.setChildIndex(dot,Tcon.numChildren-1);
	}

	if(t % (fp * 10) == 1) {

		var ye: yearL = new yearL();
		ye.te.text = da[T + 1][0].slice(8, 10);
		ye.x = current.x;
		ye.y = 35;
		addChildAt(ye, 4);
	}

}



var rat: Number = 1000;
function drawN(N: int, thick: Number): void {
	var myShape: Shape = new Shape();
	myShape.graphics.lineStyle(thick, Co[N - 1], 1);
	myShape.graphics.moveTo(current.x - vr * fp, -(da[T][N] + da[T][N + 1]) / rat);
	myShape.graphics.lineTo(current.x, -(da[T + 1][N] + da[T + 1][N + 1]) / rat);
	myShape.graphics.endFill();
	Tcon.addChild(myShape);
}

function checkYO(daS: String, puS: String): void {
	if(t % fp == 0 && da[T][0] == daS) {
		var yeo: yearLO = new yearLO();
		yeo.te.text = puS;
		yeo.x = current.x;
		yeo.y = 35;
		Tcon.addChildAt(yeo, 1);
	}
}