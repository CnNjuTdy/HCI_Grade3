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
    		font-size: 25px; 
    		color:white;
    		font-weight: bold;
    		}    	
    </style>
  </head>
  
  <body>
	<input type="button" class="button1">
	<input type="button" class="button2">
	<input type="button" class="button3">
	<input type="button" class="button4">
	
	<div style='position:absolute; left:490px; top:50px'>
 		<img src='img/title.png'>

    </div>
    
    <div style='position:absolute; left:680px; top:200px'>
    	<p>More  Convenience , More  Sufficiency</p>
    </div>
    
    <div style='position:absolute; left:1600px; top:800px'>
    	<p><a href="jsp/aboutOurs.jsp">About ours</a></p>
    </div>
  </body>
  
</html>
