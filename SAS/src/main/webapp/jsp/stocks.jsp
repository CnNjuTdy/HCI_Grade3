<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@page import="java.util.*" %>
<%@page import="dao.StockDAO" %>
<%@page import="org.json.JSONArray" %>
<%@page import="org.json.JSONException" %>
<html lang="en">
<head>
<link rel="shortcut icon" href="../img/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>SAS股票列表</title>
	<link rel="stylesheet" href="../css/theme1215.css" type="text/css" media="screen" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
 	<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
 	<link href="../css/layer.css" rel="stylesheet" type="text/css" />
	<!--[if IE]>
  	<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
	<style type="text/css">
		#wrapper{
			padding-top:100px;
			padding-bottom:100px;
			font-family:Arial, Helvetica, sans-serif;
			border:3px solid #eae2cb; 
			background:#eae2cb;    
		}
		#s_search{
			margin-top:116px;
/* 			width:850px; */
			text-align:center;
			padding-bottom:100px;
 			border:3px solid #32425c;   
  			background:#32425c;  
		}
		#text{
			height:250px;
			text-align:center;
			border:3px solid white; 
			background:white;
		}
		.button {
   			width:45px;
   			height:45px;
   			background:url(../img/Search.png);
   			cursor: pointer;
		}
		.button:hover {
    		background:url(../img/Search_hover.png);
		}
/* 		body .demo-class .layui-layer-msg { */
/* 			min-width: 180px; */
/* 			border: 1px solid #D3D4D3; */
/* 			box-shadow: none; */
/* 			font-size:30px; */
/* 		} */
		
	input[type="text"] {
    border: 2px solid #ccc;
    padding: 2px;
    font-size: 1.5em;
    color: #444;
    width:800px;
    height:50px;
    
    padding-left:50px;
    border-radius:30px;
}
	input:focus{/*IE8+*/  
   	 	border-color:#78BAED;  
	}
	#b1{ color:rgb(255, 255, 255);font-size:19px;padding-top:15px;padding-bottom:15px;padding-left:52px;padding-right:52px;border-width:1px;border-color:rgb(227, 227, 227);border-style:solid;border-radius:0px;background-color:rgb(72, 190, 216);}#b1:hover{color:#ffffff;background-color:#60c7db;border-color:48bed8;}
	.font {
		font-family: "微软雅黑";
	}
	</style>
	
</head>

<body>

<div class="top">
    <div class="w t_cen">
        <div class="t_c_logo"><a href="#"><img src="../img/logo.png" /></a></div>
        <div class="t_c_lr t_c_left"></div>
        <div class="t_c_cen">
            <div class="t_c_top">
            </div>
            <div class="t_c_bottom">
                <ul>
                    <li class="thisli">
                        <a href="#"><em>股票列表</em></a>
                    </li>
                    <li>
                        <a href="../marketInfo"><em>大盘数据</em></a>
                    </li>
                    <li>
                        <a href="../rank"><em>红黑榜单</em></a>
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
<!--引用JQuery-->
<script type="text/javascript" src="../js/jquery.js"></script>
<!--其他样式-->
<script type="text/javascript" src="../js/Other.js"></script>
	
	<div id="s_search" >	
			<div style="position:relative;margin-top:100px;">
				<input type="text" placeholder="请输入股票代码或名称" name="inputtt"/>
			</div>
			<div style="position:relative;margin-left:798px;margin-top:-53px;z-index:10">
				<input type="button" class="button" id="search" onclick = "search()"/>
			</div>
	</div>
<!-- 	<div id="text"> -->
<!-- 		<h1 style="margin-top:100px;">推荐股票</h1> -->
<!-- 	</div> -->
    <div id="wrapper">    
		<div class="slider-wrapper theme-theme1215">
			<div class="indent">
				<div class="container">
					<div class="ribbon"></div>
					<div id="slider" class="nivoSlider">
						<img src="../img/logo/futianqiche.jpg" alt="" title="#sliderCaption1" />
						<img src="../img/logo/zhongguoliantong.jpg" alt="" title="#sliderCaption2" />
						<img src="../img/logo/guangmingruye.jpg" alt="" title="#sliderCaption3" /> 
						<img src="../img/logo/dongfanghangkong2.jpg" alt="" title="#sliderCaption4" /> 
						<img src="../img/logo/zhaoshangyinhang.jpg" alt="" title="#sliderCaption5" /> 
						<img src="../img/logo/fangzhengkeji.jpg" alt="" title="#sliderCaption6" /> 

<!-- 						670,414	 110,104-->
					</div>
					<div class="nivo-html-caption" id="sliderCaption1"><dl class="caption">
						<span class="title">福田汽车:</span> 
						<br />福田汽车（sh600166）是中国品种最全、规模最大的商用车企业。福田汽车	现有资产300多亿元，员工近4万人，产销量位居世界商用车行业第一位。2014年度，福田汽车品牌价值达809.36亿元，位居汽车行业第四位，商用车领域排名第一。<a class="arrow-link" href="../stockInfo?id=sh600166"></a>
					</div>
					<div class="nivo-html-caption" id="sliderCaption2"><dl class="caption">
						<span class="title">中国联通:</span> 
						<br />中国联通（sh600050）在原中国网通和原中国联通的基础上合并组建而成，是中国唯一一家在纽约、香港、上海三地同时上市的电信运营企业，连续多年入选“世界500强企业”。<a class="arrow-link" href="../stockInfo?id=sh600050"></a>
					</div>
					<div class="nivo-html-caption" id="sliderCaption3"><dl class="caption">
						<span class="title">光明乳业:</span> 
						<br />光明乳业（sh600597）业务渊源始于1911年，拥有100多年的历史，逐步确立以牧业、乳制品的开发、生产和销售为主营业务，是中国领先的高端乳品引领者,拥有世界一流的乳品研究院、乳品加工设备以及先进的乳品加工工艺 。<a class="arrow-link" href="../stockInfo?id=sh600597"></a>
					</div>
					<div class="nivo-html-caption" id="sliderCaption4"><dl class="caption">
						<span class="title">东方航空:</span> 
						<br />中国东方航空股份有限公司（sh600115）是在原中国东方航空集团公司的基础上，兼并中国西北航空公司，联合中国云南航空公司重组而成。是中国民航第一家在香港、纽约和上海三地上市的航空公司。<a class="arrow-link" href="../stockInfo?id=sh600115"></a>
					</div>
					<div class="nivo-html-caption" id="sliderCaption5"><dl class="caption">
						<span class="title">招商银行:</span> 
						<br />招商银行（sh600036）于1987 年在中国改革开放的最前沿----深圳经济特区成立，是中国境内第一家完全由企业法人持股的股份制商业银行，也是国家从体制外推动银行业改革的第一家试点银行。<a class="arrow-link" href="../stockInfo?id=sh600036"></a>
					</div>
					<div class="nivo-html-caption" id="sliderCaption6"><dl class="caption">
						<span class="title">方正科技:</span> 
						<br />方正科技集团股份有限公司（sh600601），是北大方正集团旗下的内地上市企业，也是国内最有影响力的高科技上市企业之一,致力打造中国综合实力最强的IT服务提供商。<a class="arrow-link" href="../stockInfo?id=sh600601"></a>
					</div>
				</div><!-- .container -->
			</div><!-- .indent -->
		</div>	
    </div>
    
	<div id="slider-border"></div>
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
    <script src="../js/layer/layer.js"></script>
    <script type="text/javascript">
    $(window).load(function() {	
			// nivoslider init
		$('#slider').nivoSlider({
			effect: 'boxRandom',
			animSpeed:500,
			pauseTime:5000,
			slices:20,
			directionNav:true,
			directionNavHide:false,
			controlNav:true,
			manualAdvance: false,
			controlNavThumbs:true,
			keyboardNav:true,
			pauseOnHover:true,
			captionOpacity:0.7
		}); 
	}); 
    
	function search(){
		 $.ajax({
             url: "../stock_search",
             async : true,
             data: {value:document.getElementsByName("inputtt")[0].value},
             type: "post",
             datatype: "text",
             success: function(data){
            	var str = data+"";
                if(data=="error"){          
                	layer.msg('木有找到这支股票QAQ',{
//                 		area : ['600px' , '180px'],
                		time: 2000, //2秒后自动关闭
                		skin: 'demo-class'
                		});
                }else{
                	window.location.href="../stockInfo?id="+str;
                }
                
             },
             error:function(errorMsg){
            	alert(">>>") ;
             }
         });
	}
    </script>   
</body>
</html>