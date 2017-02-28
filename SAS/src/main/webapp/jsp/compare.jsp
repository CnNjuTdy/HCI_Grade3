<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SAS股票分析系统</title> 
	<link href="../css/base.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/Other.js"></script>
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
 	<script src="../js/layer/layer.js"></script>
	<style>
/*  		body {  */
/*  			background-image: url("../img/test1.jpg");  */
/*  			background-size:100% 100%;  */
/*      		background-repeat:no-repeat;  */
/*  		}  */
		.location{
    		width:100%;
            height:300px;
		}
		#container1{
  			padding-top:70px; 
  			padding-bottom:70px;
			margin-top:116px;;
 			height:50px;
/*  			border:3px solid red; */
 			background-color:#eae2cb;
		}
		#container2{
  			padding-top:70px; 
  			padding-bottom:70px;
 			height:600px;
/*   			border:3px solid red;  */
  			text-align:center;
/*   			background-color:#ebfae5;  */
		}
		
		#container3{
  			padding-top:70px; 
  			padding-bottom:50px;
 			height:500px;
/*    			border:3px solid red;   */
  			text-align:center;
     		background-color:#c3f6d6; 
		}
		
		#input1{
		    width:210px;
    		margin-left:550px;
    	    z-index:10;
/*      	    border:3px solid red;  */
		}
		#s_vs{
			margin-left:850px;
    		margin-top:-50px;
    		z-index:10;
		}
		#input2{
		    width:210px;
    		margin-left:1050px;
    		margin-top:-58px;
    	    z-index:10;
/*     	    border:3px solid red; */
		}
		
		#confirm{
			position:relative;
    		margin-left:1400px;
    		margin-top:-50px;
    		z-index:10;
		}
		
		#s_info{
			width:1200px;
    		height:600px;
    		margin-left:auto;
    		margin-right:auto;
    		background:url(../img/info.jpg);
/*     		border:3px solid red;   */
       		border-radius:20px;
		}
		#s_info1{
    		width:500px;
    		height:600px;
    		float:left;
/*     		background:url(../img/info1.jpg); */
/*      		border:3px solid red;  */
		}
		#center{
			width:250px;
			height:600px;
			margin-left:465px;
/* 			border:3px solid red; */
		}
		#s_info2{
    		width:500px;
    		height:600px;
    		float:right;
    		margin-top:-600px;
/*     		background:url(../img/info2.jpg); */
/*      		border:3px solid red;  */
		}
		#style4{
/* 			background-color:white;  */
		    height:500px;
		    width:800px;
    		margin-left: auto;
			margin-right: auto;
    	    border-radius:20px;
    	    z-index:2;
/*      	     border:3px solid red;  */
		}
		#text{
			float:right;
		}
		h2{
 			font-size: 25px;
 			font-weight: bold;
 			letter-spacing:5px;
 		}
		input[type="text"] {
   		    border: 2px solid #ccc;
   			padding: 2px;
    		font-size: 1.5em;
    		color: #444;
    		width:200px;
    		height:50px;
    
    		padding-left:5px;
   		 border-radius:10px;
		}
.b1{
  line-height:40px;
  height:40px;
  width:91px;
  color:#ffffff;
  background-color:#ededed;
  font-size:22px;
  font-weight:normal;
  font-family:Microsoft YaHei;
  background:-webkit-gradient(linear, left top, left bottom, color-start(0.05, #48bed8), color-stop(1, #86cad9));
  background:-moz-linear-gradient(top, #48bed8 5%, #86cad9 100%);
  background:-o-linear-gradient(top, #48bed8 5%, #86cad9 100%);
  background:-ms-linear-gradient(top, #48bed8 5%, #86cad9 100%);
  background:linear-gradient(to bottom, #48bed8 5%, #86cad9 100%);
  background:-webkit-linear-gradient(top, #48bed8 5%, #86cad9 100%);
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#48bed8', endColorstr='#86cad9',GradientType=0);
  border:0px solid #dcdcdc;
  -webkit-border-top-left-radius:9px;
  -moz-border-radius-topleft:9px;
  border-top-left-radius:9px;
  -webkit-border-top-right-radius:9px;
  -moz-border-radius-topright:9px;
  border-top-right-radius:9px;
  -webkit-border-bottom-left-radius:9px;
  -moz-border-radius-bottomleft:9px;
  border-bottom-left-radius:9px;
  -webkit-border-bottom-right-radius:9px;
  -moz-border-radius-bottomright:9px;
  border-bottom-right-radius:9px;
  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
  box-shadow: inset 0px 0px 0px 0px #ffffff;
  text-align:center;
  display:inline-block;
  text-decoration:none;
}
.b1:hover{
  background-color:#f5f5f5;
  background:-webkit-gradient(linear, left top, left bottom, color-start(0.05, #86cad9), color-stop(1, #48bed8));
  background:-moz-linear-gradient(top, #86cad9 5%, #48bed8 100%);
  background:-o-linear-gradient(top, #86cad9 5%, #48bed8 100%);
  background:-ms-linear-gradient(top, #86cad9 5%, #48bed8 100%);
  background:linear-gradient(to bottom, #86cad9 5%, #48bed8 100%);
  background:-webkit-linear-gradient(top, #86cad9 5%, #48bed8 100%);
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#86cad9', endColorstr='#48bed8',GradientType=0);
}
	</style>
	   
</head>
<body>
<div class="top">
    <div class="w t_cen">
        <div class="t_c_logo"><a href="stocks.jsp"><img src="../img/logo.png" /></a></div>
        <div class="t_c_lr t_c_left"></div>
        <div class="t_c_cen">
            <div class="t_c_top">
            </div>
            <div class="t_c_bottom">
                <ul>
                    <li class="thisli">
                        <a href="stocks.jsp"><em>股票列表</em></a>
                    </li>
                    <li>
                        <a href="../marketInfo"><em>大盘数据</em></a>
                    </li>
                    <li>
                        <a href="../rank"><em>红黑榜单</em></a>
                    </li>
                    <li class="thisli">
                        <a href="compare.jsp"><em>股票对比</em></a>
                    </li>
                    <li>
                        <a href="aboutOurs.jsp"><em>关于我们</em></a>
                    </li>
                </ul>
                <div class="thisMenu" id="thisMenu"></div>
            </div>
        </div>
        <div class="t_c_lr t_c_right"></div>
    </div>
</div>
<div id="container1">
	<div id="input1">
		<input type="text" placeholder="请输入股票代码或名称" name="stock1"/>
	</div>
	
	<div id="s_vs">
    	<img src='../img/PK.png'>
    </div>
    
	<div id="input2">
		<input type="text" placeholder="请输入股票代码或名称" name="stock2"/>
	</div>
	
	<input type="button" class="b1" id="confirm" value="确 认" onclick="commit()" />
</div>

<div id="container2">	
	<div id="s_info">
		<div id="s_info1">

			<br><br><br><br>
			<h2 id="11" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="12" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="13" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="14" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="15" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="16" style="text-align:center"></h2>
		</div>
		<div id="center">
			<br><br><br><br>
			<h2 style="text-align:center">开盘价(元)</h2>
			<br><br><br>
			<h2 style="text-align:center">收盘价(元)</h2>
			<br><br><br>
			<h2 style="text-align:center">成交量(手)</h2>
			<br><br><br>
			<h2 style="text-align:center">成交金额(亿元)</h2>
			<br><br><br>
			<h2 style="text-align:center">换手</h2>
			<br><br><br>
			<h2 style="text-align:center">市净</h2>
		</div>
		<div id="s_info2">
			<br><br><br><br>
			<h2 id="21" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="22" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="23" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="24" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="25" style="text-align:center"></h2>
			<br><br><br>
			<h2 id="26" style="text-align:center"></h2>
		</div>
	</div>
</div>

 <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>

      <script type="text/javascript">
      require.config({
          paths: {
              echarts: 'http://echarts.baidu.com/build/dist'
          }
      });
      // 使用
      require(
          [
              'echarts',
              'echarts/chart/radar',// 使用柱状图就加载bar模块，按需加载
          ],
          DrawEChart
          );
      
      var myChart;
      function DrawEChart(ec){
    	  myChart = ec.init(document.getElementById('main'));
//     	  myChart.showLoading({text: "图表数据正在努力加载..."});
    	 var option = {
          	    tooltip : {
          	        trigger: 'axis'
          	    },
          	    legend: {
          	        orient : 'vertical',
          	        x : 'right',
          	        y : 'bottom',
          	        data:[]
          	    },
          	    toolbox: {
          	        show : true,
          	        feature : {
          	            mark : {show: true},
          	            dataView : {show: true, readOnly: false},
          	            restore : {show: true},
          	            saveAsImage : {show: true}
          	        }
          	    },
          	    polar : [
          	       {
          	           indicator : [
          	               { text: '开盘价（Open）', max: 50},
          	               { text: '收盘价（Close）',   max: 50},
          	               { text: '成交量（Volume）',  max: 1000000},
          	               { text: '成交金额（Price）',  max: 10},
          	               { text: '换手率（Turnover）',  max: 2},
          	               { text: '市净率（Pb）',  max: 5}
          	            ],
          	          name : {
                        
                          textStyle: {
                        	  fontSize: 18,
                        	  fontWeight:'bold'	}
                      },
          	        }
          	    ],
          	    calculable : true,
          	    series : [
          	        {
          	            type: 'radar',
          	            data : [
          	                {
          	                    value : [],
          	                },
          	                 {
          	                    value : [],
          	                }
          	            ]
          	        }
          	    ]
          	};     
                	                    
            myChart.setOption(option); 
            getChartData();
            }
      
      function getChartData(){
    	  var legend=[];
    	  var a=[];
    	  var b=[];
    	  var c=[];
    	  var one=document.getElementsByName("stock1")[0].value;
		  var two=document.getElementsByName("stock2")[0].value;
    	  var options = myChart.getOption();
    	  $.ajax({
    		  type : "post",
    		  async : true,
    		  url : "../compare",
    		  data : {name1:one,name2:two},
    		  dataType : "text",
    		  success : function(result){
    			  if(result){
    				  var obj = eval(result);
    				  legend.push(obj[0].name);
    				  legend.push(obj[1].name);
//     				  alert(legend[0]);
    				  options.legend.data = legend; 
                      a.push(obj[0].open);
                      a.push(obj[0].close);
                      a.push(obj[0].volume);
                      a.push(obj[0].amo);
                      a.push(obj[0].turnover);
                      a.push(obj[0].pb);
                      b.push(obj[1].open);
                      b.push(obj[1].close);
                      b.push(obj[1].volume);
                      b.push(obj[1].amo);
                      b.push(obj[1].turnover);
                      b.push(obj[1].pb);
//                       c.push(a);
//                       c.push(b);
                     
                      options.series[0].data[0].value = a; 
                      options.series[0].data[0].name = obj[0].name; 
                      options.series[0].data[1].value = b; 
                      options.series[0].data[1].name = obj[1].name; 
                      myChart.hideLoading();  
                      myChart.setOption(options); 
    			  } 
    		  },
   		      error : function(errorMsg) {
    	    	  alert(errorMsg);
                  alert("不好意思，大爷，图表请求数据失败啦!");  
                  myChart.hideLoading();  
              }   		  
    	  });
      }
    </script>
    
 <script type="text/javascript">
 		function commit(){
 			 $.ajax({
 	             url: "../compare",
 	             async : true,
 	             data: {name1:document.getElementsByName("stock1")[0].value,name2:document.getElementsByName("stock2")[0].value},
 	             type: "post",
 	             datatype: "text",
 	             success: function(data){
 	                if(data=="error"){       	                	
 	                	layer.msg('输入的股票信息有误',{
// 	                 		area : ['600px' , '180px'],
 	                		time: 2000, //2秒后自动关闭
 	                		});
 	                }else{
 	                	var obj = eval(data);
 	                	document.getElementById("11").innerHTML= obj[0].open;
 						document.getElementById("12").innerHTML= obj[0].close;
 						document.getElementById("13").innerHTML= obj[0].volume;
 						document.getElementById("14").innerHTML= obj[0].amo
 						document.getElementById("15").innerHTML= obj[0].turnover;
 						document.getElementById("16").innerHTML= obj[0].pb;
 						document.getElementById("21").innerHTML= obj[1].open;
 						document.getElementById("22").innerHTML= obj[1].close;
 						document.getElementById("23").innerHTML= obj[1].volume;
 						document.getElementById("24").innerHTML= obj[1].amo;
 						document.getElementById("25").innerHTML= obj[1].turnover;
 						document.getElementById("26").innerHTML= obj[1].pb;	
 						getChartData();
 	                }
 	                
 	             },
 	             error:function(errorMsg){
 	            	alert(">>>") ;
 	             }
 	         });
 		}
 		
 	</script>
	
<div id="container3">	
	<div id="style4">
		<div id="main" style="height:500px;"></div>
	</div>
	
	<div id="text">
		<h2>注：数据均采用近20天数据的平均值</h2>
	</div>
</div>
	



</body>
</html>