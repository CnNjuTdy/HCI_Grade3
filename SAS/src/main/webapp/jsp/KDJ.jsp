<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="entity.KDJ" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%
	List<KDJ> list = (List<KDJ>)request.getAttribute("list");	
	DecimalFormat df = new DecimalFormat("0.00");
	ArrayList<String> result=(ArrayList<String>)request.getAttribute("analyseResult");
%>

<html>
	<meta http-equiv="Content-Type" content="text/html" charset=utf-8">
	<title>lineChart</title>
<head>
<style type="text/css">
	h2 {color: red;}
</style>
</head>
<body>
<div id="kdj" style="height:400px;"></div>
<div style="positon:relative;margin-left:15%">
	<h2>股票分析：</h2>
	<%for(int i=0;i<result.size();i++){
    %>
        <h3><%=result.get(i)%></h3>
    <%
} %>
</div>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
      <script type="text/javascript">
      var dates = new Array();
	  var kValue = new Array(); 
	  var dValue = new Array();
	  var jValue = new Array();
	 <%int num=list.size();
	 System.out.print(num);
	 for(int i=0;i<num;i++){
	   %>
	   dates[<%=i%>]="<%=list.get(i).getDate()%>";
	   kValue[<%=i%>]=<%=df.format(list.get(i).getKvalue())%>;
	   dValue[<%=i%>]=<%=df.format(list.get(i).getDvalue())%>;
	   jValue[<%=i%>]=<%=df.format(list.get(i).getJvalue())%>;
	   <%
	 }
	 %>
 

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
                var myChart = ec.init(document.getElementById('kdj')); 
                var option = 
                {
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	        data:['k值','d值','j值']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
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
                	            show : true
                	        },
                	        {
                	            type : 'value',
                	            axisLabel : {
                	                formatter: '{value} '
                	            },
                	            show : true
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'k值',
                	            type:'line',
                	            
                	            data:kValue,
                	            
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
                	            name:'d值',
                	            type:'line',
                	            data:dValue,
                	            itemStyle:{
                	            	normal:{
                	            		color:'#8f1ce0'
                       	            	}
                	            },

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
                	        },
                	        {
                	            name:'j值',
                	            type:'line',               	            
                	            data:jValue,
                	            markLine : {
                	                data : [
                	                    {type : 'average', name: '平均值'}
                	                ]
                	            }
                	        },
                	    ]
                }; 
                myChart.setOption(option); 
            }
        );
    </script>
	
</body>
</html>