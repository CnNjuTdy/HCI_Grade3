<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="entity.Stock" %>
<%@page import="java.util.*" %>
<%  String amount_red = (String)request.getAttribute("amount_red");
	String turnover_red = (String)request.getAttribute("turnover_red");
	String change_red = (String)request.getAttribute("change_red");
	String amount_black = (String)request.getAttribute("amount_black");
	String turnover_black = (String)request.getAttribute("turnover_black");
	String change_black = (String)request.getAttribute("change_black");
	System.out.println(amount_red);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="">
<!--     <meta name="viewport" content="width=device-width"> -->
	<title>SAS股票分析系统</title> 
	<link href="css/base.css" rel="stylesheet" type="text/css" />
	 <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
	 <link rel="stylesheet" href="css/fakeLoader.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/Other.js"></script>
	<script type="text/javascript" src="js/tablecloth.js"></script>

	<style type="text/css">
		#container1{
			margin-top:116px;
			height:500px;
			background:url(img/red.jpg);
		}
		#container2{
			height:500px;
			background:url(img/black.jpg);
		}
		#table1{
			width:1800px;
			height:400px;
			padding-top:50px;
			margin-left:auto;
			margin-right:auto;
/*   			border:3px solid grey;   */
		}
		#table2{
			width:1800px;
			height:400px;
			padding-top:50px;			
			margin-left:auto;
			margin-right:auto;
/*  			border:3px solid grey;  */
		}
		#t1{
			position:absolute;
			width:100px;
			height:150px;
			margin-left:50px;
			margin-top:100px;
			text-align:center;
/* 			border:3px solid grey; */
		}
		#t2{
			position:absolute;
			width:100px;
			height:150px;
			margin-left:50px;
			margin-top:100px;
			text-align:center;
/* 			border:3px solid grey; */
		}
		#s1{
			width:400px;
			margin-left:250px;
            text-align:center;
/* 			border:3px solid grey; */
		}
		#s2{
			width:350px;
			margin-left:750px;
			margin-top:-336px;
			text-align:center;
/* 			border:3px solid grey; */
		}
		#s3{
			width:350px;
		    margin-left:1250px;
		    margin-top:-336px;
		    text-align:center;
/* 			border:3px solid grey; */
		}
		#s4{
			width:400px;
			margin-left:250px;
			text-align:center;
/* 			border:3px solid grey; */
		}
		#s5{
			width:350px;
			margin-left:750px;
		    margin-top:-336px;
		    text-align:center;
/* 			border:3px solid grey; */
		}
		#s6{
			width:350px;
		    margin-left:1250px;
		    margin-top:-336px;
		    text-align:center;
/* 			border:3px solid grey; */
		}
		.f1{
 			font-size: 30px;
 			font-weight: bold;
 			color:white;
 			letter-spacing:20px;
 		}
 		.f2{
 			font-size: 50px;
 			font-weight: bold;
 			color:white;
 			letter-spacing:20px;
 		}
/*  		td.down, tr.even td.down, tr.odd td.down{background:#bbd9e0;color:#fff;cursor:pointer;} */
	</style>
	
</head>
<body>
<div class="top">
    <div class="w t_cen">
        <div class="t_c_logo"><a href="jsp/stocks.jsp"><img src="img/logo.png" /></a></div>
        <div class="t_c_lr t_c_left"></div>
        <div class="t_c_cen">
            <div class="t_c_top">
            </div>
            <div class="t_c_bottom">
                <ul>
                    <li>
                        <a href="jsp/stocks.jsp"><em>股票列表</em></a>
                    </li>
                    <li>
                        <a href="marketInfo"><em>大盘数据</em></a>
                    </li>
                    <li class="thisli">
                        <a href="rank"><em>红黑榜单</em></a>
                    </li>
                    <li>
                        <a href="jsp/aboutOurs.jsp"><em>关于我们</em></a>
                    </li>
                </ul>
                <div class="thisMenu" id="thisMenu">
                </div>
            </div>
        </div>
        <div class="t_c_lr t_c_right"></div>
    </div>
</div>

<div class="fakeLoader"></div>
        
<div id="container1">
<div id="table1">
	<div id="t1">
		<span class="f2">红榜</span>
	</div>
	<div id="s1">
	<span class="f1">成交金额前五</span>
	<table id="1" cellspacing="0" cellpadding="0">
		<tr>
			<th>股票代码</th>
			<th>股票名称</th>
			<th>成交金额</th>
		</tr>																				
		</table>
		</div>
		
		<div id="s2">
		<span class="f1">换手率前五</span>
		<table id="2" cellspacing="0" cellpadding="0">
		<tr>
			<th>股票代码</th>
			<th>股票名称</th>
			<th>换手率</th>
		</tr>																				
		</table>
		</div>
		
		<div id="s3">
		<span class="f1">涨幅前五</span>
		<table id="3" cellspacing="0" cellpadding="0">
		<tr>
			<th>股票代码</th>
			<th>股票名称</th>
			<th>涨幅</th>
		</tr>																			
		</table>
		</div>
	</div>	
	
</div>


<div id="container2">
<div id="table2">
	<div id="t1">
		<span class="f2">黑榜</span>
	</div>
	<div id="s4">
	<span class="f1">成交金额后五</span>
	<table id="4" cellspacing="0" cellpadding="0">
		<tr>
			<th>股票代码</th>
			<th>股票名称</th>
			<th>成交金额</th>
		</tr>																				
		</table>
		</div>
		
		<div id="s5">
		<span class="f1">换手率后五</span>
		<table id="5" cellspacing="0" cellpadding="0">
		<tr>
			<th>股票代码</th>
			<th>股票名称</th>
			<th>换手率</th>
		</tr>																				
		</table>
		</div>
		
		<div id="s6">
		<span class="f1">涨幅后五</span>
		<table id="6" cellspacing="0" cellpadding="0" >
		<tr>
			<th>股票代码</th>
			<th>股票名称</th>
			<th>涨幅</th>
		</tr>																			
		</table>
		</div>
	</div>
</div>
	
<script type="text/javascript">
	var jsn1=eval(<%=(String)request.getAttribute("amount_red")%>);
	var jsn2=eval(<%=turnover_red%>);
	var jsn3=eval(<%=change_red%>);
	var jsn4=eval(<%=amount_black%>);
	var jsn5=eval(<%=turnover_black%>);
	var jsn6=eval(<%=change_black%>);
  
	for(var i in jsn1){
// 		 alert(jsn1[i].id);
  		var a="stockInfo?id="+jsn1[i].id;
		 $("#1").append("<tr><td><a href="+a+">"+jsn1[i].id + "</a></td><td>" + jsn1[i].name + "</td><td>" + jsn1[i].data + "</td></tr>");
	}
	for(var i in jsn2){
		 var b="stockInfo?id="+jsn2[i].id;
		 $("#2").append("<tr><td><a href="+b+">" + jsn2[i].id + "</td><td>" + jsn2[i].name + "</td><td>" + jsn2[i].data + "</td></tr>");
	}
	for(var i in jsn3){
		 var c="stockInfo?id="+jsn3[i].id;
		 $("#3").append("<tr><td><a href="+c+">" + jsn3[i].id + "</td><td>" + jsn3[i].name + "</td><td>" + jsn3[i].data + "</td></tr>");
	}
	for(var i in jsn4){
		 var d="stockInfo?id="+jsn4[i].id;
		 $("#4").append("<tr><td><a href="+d+">" + jsn4[i].id + "</td><td>" + jsn4[i].name + "</td><td>" + jsn4[i].data + "</td></tr>");
	}
	for(var i in jsn5){
		var e="stockInfo?id="+jsn5[i].id;
		 $("#5").append("<tr><td><a href="+e+">" + jsn5[i].id + "</td><td>" + jsn5[i].name + "</td><td>" + jsn5[i].data+ "</td></tr>");
	}
	for(var i in jsn6){
		 var f="stockInfo?id="+jsn6[i].id;
		 $("#6").append("<tr><td><a href="+f+">" + jsn6[i].id + "</td><td>" + jsn6[i].name + "</td><td>" + jsn6[i].data + "</td></tr>");
	}

</script>
      
<script src="http://libs.useso.com/js/jquery/1.11.1/jquery.min.js"></script>
<script src="js/fakeLoader.min.js"></script>
    <script type="text/javascript">   
        $(".fakeloader").fakeLoader({
            timeToHide:1500,
            bgColor:"#9b59b6",
            spinner:"spinner7"
        });
    </script>  
</body>
</html>