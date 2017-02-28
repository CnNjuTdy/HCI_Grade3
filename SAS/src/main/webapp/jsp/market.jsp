<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="entity.Market" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%
	List<Market> list = (List<Market>)request.getAttribute("list");	
int num=list.size();
double close = list.get(num-1).getClose();
double open = list.get(num-1).getOpen();
double high = list.get(num-1).getHigh();
double low = list.get(num-1).getLow();
long volume1 = list.get(num-1).getVolume();
DecimalFormat df = new DecimalFormat("0.00");
double volume = volume1/1000000;
double amo = volume1*close/100000000;
String vol = df.format(volume);
String am = df.format(amo);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>大盘数据</title> 
	 <link href="css/base.css" rel="stylesheet" type="text/css" />
   	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/Other.js"></script>
   	

<style type="text/css">
	 #s_chart{
 			width:1000px;
 			height:550px;
 			padding:10px;
 			margin-top:10%;
 			margin-left:auto;
 			margin-right:auto;
 			border-radius:20px;
			background-color: white;
 		}
 	#info{
 		float:right;
 		width:300px;
 		padding-top:50px;
 	}
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
                    <li class="thisli">
                        <a href="marketInfo"><em>大盘数据</em></a>
                    </li>
                    <li>
                        <a href="rank"><em>红黑榜单</em></a>
                    </li>
                    <li>
                        <a href="jsp/aboutOurs.jsp"><em>关于我们</em></a>
                    </li>
                </ul>
                <div class="thisMenu" id="thisMenu"></div>
            </div>
        </div>
        <div class="t_c_lr t_c_right"></div>
    </div>
</div>

<div id="s_chart">
	<div id="c2" style="width:700px;height:500px;float:left"></div>
	<div id="info">
		<br><br>
		<h2>开盘价（元）：<%=open%></h2>
		<br><br>
		<h2>收盘价（元）：<%=close%></h2>
		<br><br>
		<h2>最高价（元）：<%=high%></h2>
		<br><br>
		<h2>最低价（元）：<%=low%></h2>
		<br><br>
		<h2>成交量（万手）：<%=vol%></h2>
		<br><br>
		<h2>成交金额（亿元）：<%=am%></h2>
	</div>
</div>

<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
      <script type="text/javascript">
    

      var dates = new Array();
      var dataArr = new Array();
	   
	 <%
	 for(int i=0;i<num;i++){
	   %>
	   var sub=new Array();
	   dates[<%=i%>]="<%=list.get(i).getDate()%>";
	   sub.push(<%=list.get(i).getOpen()%>);
	   sub.push(<%=list.get(i).getClose()%>);
	   sub.push(<%=list.get(i).getLow()%>);
	   sub.push(<%=list.get(i).getHigh()%>);
	   dataArr.push(sub);
	   <%
	 }
	 %>
	  
    //  var str=['周一','周二','周三','周四','周五','周六','周日'];
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        // 使用
        require
        (
            [
                'echarts',
                'echarts/chart/k',
                'echarts/chart/line',
                'echarts/chart/bar'// 使用柱状图就加载bar模块，按需加载

            ],
            function (ec) 
            {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('c2')); 
                var option = {
                	    title : {
                	        text: '大盘指数'
                	    },
                	    tooltip : {
                	        trigger: 'axis',
                	        formatter: function (params) {
                	            var res = params[0].seriesName + ' ' + params[0].name;
                	            res += '<br/>  开盘 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
                	            res += '<br/>  收盘 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
                	            return res;
                	        }
                	    },
                	    legend: {
                	        data:['大盘指数']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataZoom : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    dataZoom : {
                	        show : true,
                	        realtime: true,
                	        start : 50,
                	        end : 100
                	    },
                	    xAxis : [
                	        {
                	            type : 'category',
                	            boundaryGap : true,
                	            axisTick: {onGap:false},
                	            splitLine: {show:false},
                	            data : dates,
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value',
                	            scale:true,
                	            boundaryGap: [0.01, 0.01]
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'大盘指数',
                	            type:'k',
                	            data:dataArr, // 开盘，收盘，最低，最高
                	                
                	        }
                	    ]                    
                }; 
                myChart.setOption(option); 
            }
        );
    </script>
</body>
</html>