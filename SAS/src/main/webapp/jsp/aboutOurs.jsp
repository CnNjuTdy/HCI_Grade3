<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>SAS股票列表</title>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        #wrapper {
            margin-top: 12%;
            font-family: Arial, Helvetica, sans-serif;
        }

        #s1 {
            position: absolute;
            left: 15%;
            top: 25%;
        }

        #container {
            width: 1200px;
            height: 1000px;
            padding: 10px;
            margin-top: 10%;
            margin-left: auto;
            margin-right: auto;
            /*  			border:3px solid red; */
        }
    </style>

</head>

<body>

<div class="top">
    <div class="w t_cen">
        <div class="t_c_logo"><a href="../index.jsp"><img src="../img/logo.png"/></a></div>
        <div class="t_c_lr t_c_left"></div>
        <div class="t_c_cen">
            <div class="t_c_top">
            </div>
            <div class="t_c_bottom">
                <ul>
                    <li>
                        <a href="stocks.jsp"><em>股票列表</em></a>
                    </li>
                    <li>
                        <a href="../marketInfo"><em>大盘数据</em></a>
                    </li>
                    <li>
                        <a href="../rank"><em>红黑榜单</em></a>
                    </li>
                    <li class="thisli">
                        <a href=#><em>关于我们</em></a>
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

<div id="container">
    <iframe src="aboutOurs_part.jsp" width=1200px height=1000px
            frameborder="0" scrolling="no"></iframe>
</div>

</body>
</html>