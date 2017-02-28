<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="entity.Stock" %>
<%@page import="java.util.*" %>
<%
	List<Stock> list = (List<Stock>)request.getAttribute("list");	
%>

<html>
	<meta http-equiv="Content-Type" content="text/html"; charset=utf-8">
	<title>lineChart</title>
</head>
<body>

<div id="main" style="height:400px;"></div>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
      <script type="text/javascript">
      var dates = new Array();
	  var volumes=new Array(); 
	  var prices = new Array(); 
	 <%int num=list.size();
	 System.out.print(num);
	 for(int i=0;i<num;i++){
	   %>
	   dates[<%=i%>]="<%=list.get(i).getDate()%>";
	   volumes[<%=i%>]=<%=list.get(i).getVolume()%>;
	   prices[<%=i%>]=<%=(long)(list.get(i).getClose() * list.get(i).getVolume())%>;
	   <%
	 }
	 %>
 
	 
	  
    //  var str=['周一','周二','周三','周四','周五','周六','周日'];
        require.config({
            paths: {
                echarts: 'js/echarts'
            }
        });
        // 使用
        require
        (
            [
                'echarts',
                'echarts/chart/line',
                'echarts/chart/bar'// 使用柱状图就加载bar模块，按需加载

            ],
            function (ec) 
            {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                var option = 
                {
                		title : {
                	        text: '成交量/成交金额',
              
                	    },
                	 
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	        data:['成交量','成交金额']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
//                 	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'category',
                	            boundaryGap : false,
                	            data : dates,
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value',
                	            axisLabel : {
                	                formatter: '{value} '
                	            },
                	            show : true,
                  	            position: "left"
                	        },
                	        {
                	            type : 'value',
                	            axisLabel : {
                	                formatter: '{value} '
                	            },
                	            show : true,
                	            position: "right"
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'成交量',
                	            type:'line',
                	            
                	            data:volumes,
                	            
//                 	            markPoint : {
//                 	                data : [
//                 	                    {type : 'max', name: '最大值'},
//                 	                    {type : 'min', name: '最小值'}
//                 	                ]
//                 	            },
                	            markLine : {
                	                data : [
                	                    {type : 'average', name: '平均值'}
                	                ]
                	            }
                	        },
                	        {
                	            name:'成交金额',
                	            type:'line',
                	            //symbol:'none',
                	            data:prices,
                	            yAxisIndex: 1,
                	            itemStyle:{
                	            	normal:{
                	            		color:'#8f1ce0'
                       	            	}
                	            },
//                 	            markPoint : {
//                 	                data : [
//                 	                    {type : 'max', name: '最大值'},
//                 	                    {type : 'min', name: '最小值'}
//                 	                ],
//                 	            	itemStyle:{
//                 	            		normal:{
//                 	            			color:'#8f1ce0'
//                 	            		}
//                 	            	}
//                 	            },
                	            markLine : {
                	                data : [
                	                    {type : 'average', name : '平均值'}
                	                ],
                	                itemStyle:{
                	            		normal:{
                	            			lineStyle:{
                	            				color:'#8f1ce0'
                	            			}
                	            		}
                	            	}
                	            }
                	        }
                	    ]
                }; 
                myChart.setOption(option); 
            }
        );
    </script>
	
</body>
</html>