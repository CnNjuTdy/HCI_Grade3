<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="../css/htmleaf-demo.css">
	<style type="text/css">
		.card {
		    background: #fff;
		    display: inline-block;
		    margin: 4em;
		    box-shadow: .5em 0 1.25em #ccc;
		    border-radius: .3em;
		    overflow: hidden;
		    max-width: 20em;
		}
		.card img{
			display: block;
		}
		.style1{
			background:url("../img/27.jpg");
			width:300px;
			height:300px;
		}
	</style>
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="htmleaf-container">
		<div class="htmleaf-content">
			<div class="card style1">
		        <h2 align="center">团队成员</h2>
		        <h4 align="center">周倜</h4>
		        <h4 align="center">叶秀丹</h4>
		        <h4 align="center">汪盼</h4>
		        <h4 align="center">朱俊文</h4>
		        
		    </div>
		    <div class="card style1">
		        <h2 align="center">团队及项目介绍</h2>
		        <h4><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们团队由南京大学软件学院的四名大二同学组成，本项目为大二第二学期软件工程大作业，历时数月昏天黑地的工作最终完成。</p></h4>
		         <h4><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虽然我们项目还有很多要改进的地方，但是这是我们第一次参与web程序的制作，请给出你们宝贵的建议。</p></h4>
		    </div>
		    <div class="card style1">
		        <h2 align="center">联系我们</h2>
		        <h4 align="center">邮箱：xx14@software.nju.deu.cn</h4>
		        <h4 align="center">QQ：123456789</h4>
		        <h4 align="center">微信：123245657</h4>
		        <h4 align="center">新浪微博：123245657</h4>
		    </div>
		    <div class="card style1">
		        <h2 align="center">友情链接</h2>
		        <a href="http://www.eastmoney.com/" style="display:block;text-align:center;">东方财富网</a>
		        <h4 align="center">东方财富网</h4>
		        <h4 align="center">东方财富网</h4>
		    </div>
		</div>
	</div>
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="../js/jquery-1.7.1.min.js"><\/script>')</script>
	<script type="text/javascript" src="../js/jQuery-face-cursor.js"></script>
	<script>
		$(".card").faceCursor();
	</script>
</body>
</html>