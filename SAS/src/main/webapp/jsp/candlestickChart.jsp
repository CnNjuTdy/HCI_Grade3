<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="entity.Stock" %>
<%@page import="java.util.*" %>
<%
	List<Stock> list = (List<Stock>)request.getAttribute("list");	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
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
<div id="c1" style="height:360px;"></div>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
      <script type="text/javascript">
    

      var dates = new Array();
      var dataArr = new Array();
	   
	 <%int num=list.size();
	 System.out.print(num+" ");
	 System.out.print(list.get(0).getOpen()+" ");
	 for(int i=0;i<num;i++){
	   %>
	   var sub=new Array();
	   dates[<%=i%>]="<%=list.get(i).getDate()%>";
	   sub.push(<%=list.get(i).getOpen()%>);
	   <%--System.out.print(list.get(i).getOpen()+" ");--%>
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
            ],
            function (ec) 
            {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('c1')); 
                var option = {
                	 
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
                	        data:['上证指数']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
//                 	            mark : {show: true},
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
                	            name:'上证指数',
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