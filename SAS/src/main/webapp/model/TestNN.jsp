<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="entity.Stock" %>
<%@page import="java.util.*" %>
<%
	List<Stock> list = (List<Stock>)request.getAttribute("list");	

%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html"; charset=utf-8">
	<title>TestNN</title>
	<style type="text/css">
    	body 
    	{
    		background-image:url("img/back_chart.jpg");
    		background-size:100% 100%;
    		background-repeat:no-repeat;
        }	
         .div1 {
            position: absolute;/*绝对定位，将DIV1外面的大框用绝对定位进行div的固定*/
            margin-left: 15%;/*距左15%的距离*/
            margin-top: 100px;/*距上100px的距离*/
            width: 1000px;/*宽设定1000px*/
            height:600px;
        }
        </style>
</head>
<body>
</body>
</html>