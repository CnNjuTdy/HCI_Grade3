<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="entity.ROLL" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%
	List<ROLL> list = (List<ROLL>)request.getAttribute("list");	
	DecimalFormat df = new DecimalFormat("0.00");
	ArrayList<String> result=(ArrayList<String>)request.getAttribute("analyseResult");
%>

<html>
	<meta http-equiv="Content-Type" content="text/html" charset=utf-8">
<head>
<style type="text/css">
	h2 {color: red;}
</style>
</head>
<body>
<div id="roll" style="height:400px;"></div>
<div style="positon:relative;margin-left:20%">
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
	  var up = new Array(); 
	  var dn = new Array();
	  var mb = new Array();
	 <%int num=list.size();
	 for(int i=0;i<num;i++){
	   %>
	   dates[<%=i%>]="<%=list.get(i).getDate()%>";
	   up[<%=i%>]=<%=df.format(list.get(i).getUP())%>;
	   dn[<%=i%>]=<%=df.format(list.get(i).getDN())%>;
	   mb[<%=i%>]=<%=df.format(list.get(i).getMB())%>;
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
                var myChart = ec.init(document.getElementById('roll')); 
                var option = 
                {
                		title : {
                	        text: 'ROLL',
              
                	    },
                	 
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	        data:['up值','dn值','mb值']
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
                	            name:'up值',
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
                	            name:'dn值',
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
                	            name:'mb值',
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