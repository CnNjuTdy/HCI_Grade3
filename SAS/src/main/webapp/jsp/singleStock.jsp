<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="entity.Stock" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat" %>
<%
    String id = (String) request.getAttribute("id");
    Stock stock = (Stock) request.getAttribute("stock");
    String analysis = (String) request.getAttribute("analysis");
    int flag = -1;
    if (stock.getChg() > 0) {
        flag = 0;
    } else if (stock.getChg() < 0) {
        flag = 1;
    }
    DecimalFormat df = new DecimalFormat("0.00");
    double d = 123.9078;
    String zt = df.format(stock.getClose_yday() * 1.1);
    String dt = df.format(stock.getClose_yday() * 0.9);
    String db = df.format(stock.getChg() * 100) + "%";
    String cjl = df.format(stock.getVolume() / 1000000);
    String cje = df.format(stock.getVolume() * stock.getClose() / 100000000);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/Other.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/card/jquery.easyAccordion.js"></script>
    <script type="text/javascript" src="js/card/utility.js"></script>
    <script src="js/layer/layer.js"></script>

    <title>singleStock</title>
    <style type="text/css">
        #container {
            margin-top: 116px;
            padding-top: 50px;
            margin-left: auto;
            margin-right: auto;
            /*       		border:3px solid red;   */
        }

        #s1 {
            margin-top: -70px;
            padding-top: 80px;
            padding-bottom: 120px;
            background-color: #32425c;
            /*  			border:3px solid red;   */
        }

        #s2 {
            height: 600px;
            margin-top: -30px;
            background-color: #eae2cb;
            padding-top: 30px;
        }

        #s_top {
            width: 1040px;
            height: 100px;
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 20px;
            background-color: white;
            /*  			border:3px solid red;  */
        }

        #s_table {
            width: 1040px;
            height: 480px;
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            border-radius: 20px;
            background-color: white;
            /* 			border:3px solid red; */
        }

        #s_card {
            width: 1040px;
            height: 300px;
            margin-top: 70px;
            margin-bottom: 70px;
            left: 16%;
            margin-left: auto;
            margin-right: auto;
            border-radius: 20px;
            background-color: none;
            /* 			border:3px solid red; */
        }

        .f1 {
            font-size: 50px;
            font-weight: bold;
            color: white;
            letter-spacing: 8px;
        }

        .f2 {
            font-size: 60px;
            font-weight: bold;
        }

        .f3 {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            line-height: 20px
        }

        a:link {
            color: #FF0000;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            color: #FF00FF;
            font-size: 20px;
            font-weight: bold;
            text-decoration: underline;
        }

        /* 公共 */
        .easy-accordion {
            display: block;
            position: relative;
            overflow: hidden;
            padding: 0;
            margin: 0
        }

        .easy-accordion dt, .easy-accordion dd {
            margin: 0;
            padding: 0
        }

        .easy-accordion dt, .easy-accordion dd {
            position: absolute
        }

        .easy-accordion dt {
            margin-bottom: 0;
            margin-left: 0;
            z-index: 5; /* Safari */
            -webkit-transform: rotate(-90deg); /* Firefox */
            -moz-transform: rotate(-90deg);
            -moz-transform-origin: 20px 0px; /* Internet Explorer */
            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
            cursor: pointer;
        }

        .easy-accordion dd {
            z-index: 1;
            opacity: 0;
            overflow: hidden
        }

        .easy-accordion dd p {
            line-height: 120%
        }

        .easy-accordion dd.active {
            opacity: 1;
        }

        .easy-accordion dd.no-more-active {
            z-index: 2;
            opacity: 1
        }

        .easy-accordion dd.active {
            z-index: 3
        }

        .easy-accordion dd.plus {
            z-index: 4
        }

        .easy-accordion .slide-number {
            position: absolute;
            bottom: 0;
            left: 10px;
            font-weight: normal;
            font-size: 1.1em; /* Safari */
            -webkit-transform: rotate(90deg); /* Firefox */
            -moz-transform: rotate(90deg); /* Internet Explorer */
            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1);
        }

        #accordion-1 {
            width: 970px;
            height: 245px;
            padding: 30px;
            background: #fff;
            border-radius: 20px;
        }

        #accordion-1 dl {
            width: 970px;
            height: 245px
        }

        #accordion-1 dt {
            height: 46px;
            line-height: 44px;
            text-align: right;
            padding: 0 15px 0 0;
            font-size: 1.1em;
            font-weight: bold;
            font-family: Tahoma, Geneva, sans-serif，Microsoft Yahei;
            text-transform: uppercase;
            letter-spacing: 1px;
            background: #fff url(img/slide-title-inactive-1.jpg) 0 0 no-repeat;
            color: #26526c
        }

        #accordion-1 dt.active {
            cursor: pointer;
            color: #fff;
            background: #fff url(img/slide-title-active-1.jpg) 0 0 no-repeat
        }

        #accordion-1 dt.hover {
            color: #68889b;
        }

        #accordion-1 dt.active.hover {
            color: #fff
        }

        #accordion-1 dd {
            padding: 25px;
            background: url(img/slide.jpg) bottom left repeat-x;
            border: 1px solid #dbe9ea;
            border-left: 0;
            margin-right: 3px
        }

        #accordion-1 .slide-number {
            color: #68889b;
            left: 10px;
            font-weight: bold
        }

        #accordion-1 .active .slide-number {
            color: #fff;
        }

        #accordion-1 a {
            color: #68889b
        }

        #accordion-1 dd img {
            float: right;
            margin: 0 0 0 30px;
        }

        #accordion-1 h2 {
            font-size: 2.5em;
            margin-top: 10px
        }

        #accordion-1 .more {
            padding-top: 10px;
            display: block
        }
    </style>
</head>
<body onload="changeColor1(<%=flag%>)">
<div class="top">
    <div class="w t_cen">
        <div class="t_c_logo"><img src="img/logo.png"/></a></div>
        <div class="t_c_lr t_c_left"></div>
        <div class="t_c_cen">
            <div class="t_c_top">
            </div>
            <div class="t_c_bottom">
                <ul>
                    <li class="thisli">
                        <a href="jsp/stocks.jsp"><em>股票列表</em></a>
                    </li>
                    <li>
                        <a href="marketInfo"><em>大盘数据</em></a>
                    </li>
                    <li>
                        <a href="rank"><em>红黑榜单</em></a>
                    </li>
                    <li>
                        <a href="aboutOurs.jsp"><em>关于我们</em></a>
                    </li>
                </ul>
                <div class="thisMenu" id="thisMenu"></div>
            </div>
        </div>
        <div class="t_c_lr t_c_right"></div>
    </div>
</div>

<div id="container">
    <div id="s1">
        <div style="position:relative;left:35%">
            <span class="f1"><%=stock.getName()%>(<%=id%>)</span>
        </div>
        <div id="s_top">
            <div id="color" style="position:relative;top:10px;left:1.5%">
                <span class="f2"><%=db%></span>
            </div>
            <div style="position:relative;top:-70px;left:22%">
                <pre><h2>今开：<%=stock.getOpen()%>	最高价：<%=stock.getHigh()%>	涨停：<%=zt%>	换手率：<%=stock.getTurnover()%>	成交量：<%=cjl%>万手</h2></pre>
                <pre><h2>昨收：<%=stock.getClose_yday()%>	最低价：<%=stock.getLow()%>	跌停：<%=dt%>	市净：<%=stock.getPb()%>	成交额：<%=cje%>亿</h2></pre>
            </div>
        </div>
    </div>
    <div id="s2">
        <div id="s_table">
            <div>
                <h2><%=stock.getName()%>近30天数据</h2>
            </div>

            <iframe src="stock_table?id=<%=id%>" width="1000px" height=400px"
                    id="win" name="win" frameborder="0" scrolling="no"
                    style="margin-top:20px;margin-left:15px;margin-right:10px">
            </iframe>
        </div>
    </div>

    <div id="s_card">
        <div id="accordion-1">
            <dl>
                <dt>成交量/成交金额</dt>
                <dd><h2 align="center">成交量/成交金额</h2>
                    <p style="line-height:20px"></br>
                        成交量是一种供需的表现，指一个时间单位内对某项交易成交的数量。成交量指当天成交的股票总手数（1手=100股）。需要注意的是，通常人们说的大盘成交量指的是成交金额。说明市场的活跃度和资金规模。成交量与成交金额用下列公式表示：
                        成交数量（成交量）*成交价格=成交金额(成交额)。<br/>
                        <a href="#" class="more" id="v">Read more</a></p></dd>
                <dt>k线图</dt>
                <dd><h2 align="center">k线图</h2>
                    <p style="line-height:20px"></br>K线图（Candlestick
                        Charts）又称蜡烛图、日本线、阴阳线、棒线、红黑线等，常用说法是“K线”。它是以每个分析周期的开盘价、最高价、最低价和收盘价绘制而成。
                        图形态可分为反转形态、整理形态及缺口和趋向线等。后K线图因其细腻独到的标画方式而被引入到股市及期货市场。股市及期货市场中的K线图的画法包含四个数据，即开盘价、最高价、最低价、收盘价，所有的k线都是围绕这四个数据展开，反映大势的状况和价格信息。<br/>
                        <a href="#" class="more" id="k">Read more</a></p></dd>
                <dt>MACD</dt>
                <dd><h2 align="center">MACD</h2>
                    <p style="line-height:20px"></br>
                        MACD称为指数平滑异同平均线，是从双指数移动平均线发展而来的，由快的指数移动平均线（EMA12）减去慢的指数移动平均线（EMA26）得到快线DIF，再用2×（快线DIF-DIF的9日加权移动均线DEA）得到MACD柱。当MACD从负数转向正数，是买的信号。当MACD从正数转向负数，是卖的信号。
                        当MACD以大角度变化，表示快的移动平均线和慢的移动平均线的差距非常迅速的拉开，代表了一个市场大趋势的转变。<br/>
                        <a href="#" class="more" id="r1">Read more</a></p></dd>
                <dt>KDJ</dt>
                <dd><h2 align="center">KDJ</h2>
                    <p style="line-height:20px"></br>
                        KDJ指标又叫随机指标，是一种相当新颖、实用的技术分析指标，它起先用于期货市场的分析，后被广泛用于股市的中短期趋势分析，是期货和股票市场上最常用的技术分析工具。
                        随机指标KDJ一般是用于股票分析的统计体系，根据统计学原理，通过一个特定的周期（常为9日、9周等）内出现过的最高价、最低价及最后一个计算周期的收盘价及这三者之间的比例关系，来计算最后一个计算周期的未成熟随机值RSV，然后根据平滑移动平均线的方法来计算K值、D值与J值，并绘成曲线图来研判股票走势。<br/>
                        <a href="#" class="more" id="r2">Read more</a></p></dd>
                <dt>RSI</dt>
                <dd><h2 align="center">RSI</h2>
                    <p style="line-height:20px"></br>RSI (Relative Strength Index) 强弱指标是由威尔斯.威尔德（Welles
                        Wilder)最早应用于期货买卖，后来人们发现在众多的图表技术分析中，强弱指标的理论和实践极其适合于股票市场的短线投资，于是被用于股票升跌的测量和分析中。<br/>
                        <a href="#" class="more" id="r3">Read more</a></p></dd>
                <dt>未来趋势预测</dt>
                <dd><h2 align="center">未来趋势预测</h2>
                    <p class="f3" style="line-height:20px"></br></br><%=analysis%><br/></p></dd>
            </dl>
        </div>
    </div>

    <script type="text/javascript">
        function changeColor1(flag) {
            x = document.getElementById("color");
            if (flag = 0)
                x.style.color = "Red";
            if (flag = 1)
                x.style.color = "Green";
        }
        <%-- window.onload=changeColor1(<%=flag%>); --%>

    </script>
    <script>
        $('#r1').on('click', function () {
            layer.open({
                type: 2,
                title: 'MACD图',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['800px', '600px'],
                content: 'servlet_MACD?id=<%=id%>'
            });
        });
        $('#r2').on('click', function () {
            layer.open({
                type: 2,
                title: 'KDJ图',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['800px', '600px'],
                content: 'servlet_KDJ?id=<%=id%>'
            });
        });

        $('#r3').on('click', function () {
            layer.open({
                type: 2,
                title: 'RSI图',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['800px', '600px'],
                content: 'servlet_RSI?id=<%=id%>'
            });
        });
        $('#r4').on('click', function () {
            layer.open({
                type: 2,
                title: 'ROLL图',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['800px', '600px'],
                content: 'servlet_ROLL?id=<%=id%>'
            });
        });
        $('#v').on('click', function () {
            var index = parent.layer.getFrameIndex();
            layer.open({
                type: 2,
                title: '成交量/成交金额',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['800px', '500px'],
                content: 'lineChart?id=<%=id%>',
            });
        });
        $('#k').on('click', function () {
            var index = parent.layer.getFrameIndex();
            layer.open({
                type: 2,
                title: 'k线图',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['800px', '500px'],
                content: 'candlestick?id=<%=id%>',
            });
        });
    </script>
</body>
</html>