<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery Easy Accordion Plugin</title>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/card/jquery.easyAccordion.js"></script>
<script type="text/javascript" src="../js/card/utility.js"></script>
<script src="../js/layer/layer.js"></script>
<style type="text/css">
html{font-size:62.5%}
body{font-size:1.2em;color:#294f88}
.sample{margin:30px;border:1px solid #92cdec;background:#d7e7ff;padding:40px}
h1{margin:0 0 20px 0;padding:0;font-size:2em;}
h2{margin:40px 0 20px 0;padding:0;font-size:1.6em;}
.easy-accordion h2{margin:0px 0 20px 0;padding:0;font-size:1.6em;}
p{font-size:1.2em;line-height:170%;margin-bottom:20px}
	  
/* 公共 */
.easy-accordion{display:block;position:relative;overflow:hidden;padding:0;margin:0}
.easy-accordion dt,.easy-accordion dd{margin:0;padding:0}
.easy-accordion dt,.easy-accordion dd{position:absolute}
.easy-accordion dt{margin-bottom:0;margin-left:0;z-index:5;/* Safari */ -webkit-transform: rotate(-90deg); /* Firefox */ -moz-transform: rotate(-90deg);-moz-transform-origin: 20px 0px;  /* Internet Explorer */ filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);cursor:pointer;}
.easy-accordion dd{z-index:1;opacity:0;overflow:hidden}
.easy-accordion dd p{line-height:120%}
.easy-accordion dd.active{opacity:1;}
.easy-accordion dd.no-more-active{z-index:2;opacity:1}
.easy-accordion dd.active{z-index:3}
.easy-accordion dd.plus{z-index:4}
.easy-accordion .slide-number{position:absolute;bottom:0;left:10px;font-weight:normal;font-size:1.1em;/* Safari */ -webkit-transform: rotate(90deg); /* Firefox */ -moz-transform: rotate(90deg);  /* Internet Explorer */ filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1);}

/* 演示一 */
#accordion-1{width:950px;height:245px;padding:30px;background:#fff}
#accordion-1 dl{width:950px;height:245px}	
#accordion-1 dt{height:46px;line-height:44px;text-align:right;padding:0 15px 0 0;font-size:1.1em;font-weight:bold;font-family: Tahoma, Geneva, sans-serif;text-transform:uppercase;letter-spacing:1px;background:#fff url(../img/slide-title-inactive-1.jpg) 0 0 no-repeat;color:#26526c}
#accordion-1 dt.active{cursor:pointer;color:#fff;background:#fff url(../img/slide-title-active-1.jpg) 0 0 no-repeat}
#accordion-1 dt.hover{color:#68889b;}
#accordion-1 dt.active.hover{color:#fff}
#accordion-1 dd{padding:25px;background:url(../img/slide.jpg) bottom left repeat-x;border:1px solid #dbe9ea;border-left:0;margin-right:3px}
#accordion-1 .slide-number{color:#68889b;left:10px;font-weight:bold}
#accordion-1 .active .slide-number{color:#fff;}
#accordion-1 a{color:#68889b}
#accordion-1 dd img{float:right;margin:0 0 0 30px;}
#accordion-1 h2{font-size:2.5em;margin-top:10px}
#accordion-1 .more{padding-top:10px;display:block}

</style>

</head>
<body>

<div id="accordion-1">
<dl>
	<dt>MACD</dt>
	<dd><h2 align="center">MACD</h2>
	<p>MACD称为指数平滑异同平均线，是从双指数移动平均线发展而来的，由快的指数移动平均线（EMA12）减去慢的指数移动平均线（EMA26）得到快线DIF，再用2×（快线DIF-DIF的9日加权移动均线DEA）得到MACD柱。MACD的意义和双移动平均线基本相同，即由快、慢均线的离散、聚合表征当前的多空状态和股价可能的发展变化趋势，但阅读起来更方便。当MACD从负数转向正数，是买的信号。当MACD从正数转向负数，是卖的信号。
	当MACD以大角度变化，表示快的移动平均线和慢的移动平均线的差距非常迅速的拉开，代表了一个市场大趋势的转变。<br />
	<a href="#" class="more" id="r1">Read more</a></p></dd>
	<dt>KDJ</dt>
	<dd><h2 align="center">KDJ</h2><p>KDJ指标又叫随机指标，是一种相当新颖、实用的技术分析指标，它起先用于期货市场的分析，后被广泛用于股市的中短期趋势分析，是期货和股票市场上最常用的技术分析工具。
        随机指标KDJ一般是用于股票分析的统计体系，根据统计学原理，通过一个特定的周期（常为9日、9周等）内出现过的最高价、最低价及最后一个计算周期的收盘价及这三者之间的比例关系，来计算最后一个计算周期的未成熟随机值RSV，然后根据平滑移动平均线的方法来计算K值、D值与J值，并绘成曲线图来研判股票走势。<br />
    <a href="#" class="more" id="r2">Read more</a></p></dd>
	<dt>RSI</dt>
	<dd><h2 align="center">RSI</h2>
	<p>RSI (Relative Strength Index) 强弱指标是由威尔斯.威尔德（Welles Wilder)最早应用于期货买卖，后来人们发现在众多的图表技术分析中，强弱指标的理论和实践极其适合于股票市场的短线投资，于是被用于股票升跌的测量和分析中。<br />
	<a href="#" class="more" id="r3">Read more</a></p></dd>
	<dt>Another slide</dt>
	<dd><h2 align="center">Another slide to go here</h2><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, enim.<br /><a href="#" class="more">Read more</a></p></dd>
	<dt>Wow one more</dt>
	<dd><h2 align="center">Unbilievable one more slide here</h2><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, enim.<br /><a href="#" class="more">Read more</a></p></dd>
	<dt>Last one</dt>
	<dd><h2 align="center">This is definitely the last one</h2><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, enim.<br /><a href="#" class="more">Read more</a></p></dd>
</dl>
</div>

<script>
$('#r1').on('click', function(){
    layer.open({
        type: 2,
        title: 'MACD图',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area : ['800px' , '520px'],
        content: '../servlet_MACD'
    });
});
$('#r2').on('click', function(){
    layer.open({
        type: 2,
        title: 'KDJ图',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area : ['800px' , '520px'],
        content: '../servlet_KDJ'
    });
});
$('#r3').on('click', function(){
    layer.open({
        type: 2,
        title: 'RSI图',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area : ['800px' , '520px'],
        content: '../servlet_RSI'
    });
});
</script>
</body>
</html>
