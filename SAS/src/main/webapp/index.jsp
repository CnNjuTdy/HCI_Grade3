<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <link rel="stylesheet" type="text/css" href="css/Button.css">
 
    <style type="text/css">
    	body 
    	{
    		background-image:url("img/test1.jpg");
    		background-size:100% 100%;
    		background-repeat:no-repeat;
    		}
    	p {
    		color:white;
    		font-size: 30px; 
    		font-weight: bold;
    		}   
    		
    	a:link { 
			font-size: 30px; 
			font-weight: bold;
			text-decoration:none; 
			} 
 		a:hover {  
			font-size: 30px; 
			font-weight: bold;
			text-decoration:underline; 
			} 
    </style>
  </head>
  
  <body>
	<input type="button" class="button1" onclick="location.href='jsp/stocks.jsp'" />
	<input type="button" class="button2" onclick="location.href='jsp/market.jsp'">
	<input type="button" class="button3" onclick="location.href='jsp/analysis.jsp'">
	<input type="button" class="button4" onclick="location.href='jsp/compare.jsp'">
	
	<div style='position:absolute; left:490px; top:50px'>
 		<img src='img/title.png'>

    </div>
    
    <div style='position:absolute; left:680px; top:200px'>
    	<p>More  Convenience , More  Sufficiency</p>
    </div>
    
    <div style='position:absolute; left:1600px; top:800px'>
    	<a href="jsp/aboutOurs.jsp">About ours</a>

    </div>
  </body>
  
</html>
