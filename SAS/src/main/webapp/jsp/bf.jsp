<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SAS股票分析系统</title> 
	<link href="../css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/Other.js"></script>
<style>
/*  		body {  */
/*  			background-image: url("../img/test1.jpg");  */
/*  			background-size:100% 100%;  */
/*      		background-repeat:no-repeat;  */
/*  		}  */
		#s_card{
 			width:1040px;
 			height:400px;
 			position:absolute;
 			top:25%;
 			left:16%; 
 			border-radius:20px;
			background-color: white;
 		}
		</style>
</head>
<body>
<div class="top">
    <div class="w t_cen">
        <div class="t_c_logo"><a href="../index.jsp"><img src="../img/logo.png" /></a></div>
        <div class="t_c_lr t_c_left"></div>
        <div class="t_c_cen">
            <div class="t_c_top">
            </div>
            <div class="t_c_bottom">
                <ul>
                    <li>
                        <a href="../index.jsp"><em>官方首页</em></a>
                    </li>
                    <li class="thisli">
                        <a href="stocks.jsp"><em>股票列表</em></a>
                        <div class="Nodes">
                            <img src="../img/menu_top.png" />
                            <ul>
                                <li><a href="../stockInfo?id=sh600166">福田汽车</a></li>
                                <li><a href="../stockInfo?id=sh600050">中国联通</a></li>
                                <li><a href="../stockInfo?id=sh600597">光明乳业</a></li>
                                <li><a href="../stockInfo?id=sh600115">东方航空</a></li>
                                <li><a href="../stockInfo?id=sh600036">招商银行</a></li>
                                <li><a href="../stockInfo?id=sh600601">方正科技</a></li>
                            </ul>
                            <img src="../img/menu_bottom.png" />
                        </div>
                    </li>
                    <li>
                        <a href="market.jsp"><em>大盘数据</em></a>
                    </li>
                    <li class="thisli">
                        <a href="analysis.jsp"><em>股票分析</em></a>
                    </li>
                    <li>
                        <a href="compare.jsp"><em>股票对比</em></a>
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

<div id="s_card">
	<iframe src= "card.jsp" width="1000px" height= "400px" 
	frameborder="0" scrolling="no"></iframe>
</div>

</body>
</html>