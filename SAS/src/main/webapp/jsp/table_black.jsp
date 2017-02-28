<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>操作演示&Bootstrap样式</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link rel="stylesheet" href="css/table/normalize.css">
        <link rel="stylesheet" href="css/table/bootstrap.css">
        <link rel="stylesheet" href="css/table/mmGrid.css">
        <link rel="stylesheet" href="css/table/mmGrid-bootstrap.css">
        <link rel="stylesheet" href="css/table/mmPaginator.css">
        <link rel="stylesheet" href="css/table/mmPaginator-bootstrap.css">
        <style>
            html,
            body{
                font-family: 'Helvetica Neue',helvetica, "Hiragino Sans GB",'Microsoft YaHei', "WenQuanYi Micro Hei", sans-serif;
                font-size: 12px;
                color: #444;                
            }
            .btn{
                font-size: 12px;
            }
            .btnPrice {
                display: block;
                width: 16px;
                height: 16px;
                margin: 0px auto;
                background: url(img/botton_g1.gif) no-repeat;
            }

            .btnPrice:hover {
                background: url(img/botton_g2.gif) no-repeat;
            }
        </style>
        <script src="js/table/html5shiv.js"></script>
        <script src="js/table/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <main>
            <table id="mmg" class="mmg">
                <tr>
                    <th rowspan="" colspan=""></th>
                </tr>
            </table>
            <div id="pg" style="text-align: right;"></div>
        </main>

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/table/plugins.js"></script>
        <script src="js/table/json2.js"></script>
        <script src="js/table/mmGrid.js"></script>
        <script src="js/table/mmPaginator.js"></script>
        <script>
            $(document).ready(function(){
            	var items=<%=(String)request.getAttribute("jsonList")%>;
            	var jsonobj=eval(items);
// 				var items=[{"id":"sh600050", "name":"中国联通", "date":"2016-05-02", "open":4.06, "close":4.04, "low":4.03, "high":4.07, "volume":35993600, "adj_price":4.04, "turnover":0.17, "pb":1.09},{"id":"sh600050", "name":"中国联通", "date":"2016-05-03", "open":4.05, "close":4.12, "low":4.03, "high":4.13, "volume":69226304, "adj_price":4.12, "turnover":0.33, "pb":1.11}];
                var fixed2 = function(val){
                    if(typeof val != 'number'){
                        return '';
                    }
                    return val.toFixed(2);
                }
                var cols = [
//                     {title:'行情',titleHtml: '<span title="下面图片按钮可点击" style="cursor: help;color: #b00;">行情</span>', name:'', width: 30, align: 'center',lockWidth:true,  renderer: function(val,item,rowIndex){
//                         return '<div class="btnPrice"></div>';
//                     }},
// 					{ title:'股票代码', name:'id' ,width:100, align:'center', sortable: true},
// 					{ title:'股票名称', name:'name' ,width:100, align:'center', sortable: true},
                    { title:'日期', name:'date' ,width:100, align:'center', sortable: true},
                    { title:'开盘价', name:'open' ,width:60, align:'center', sortable: true, type: 'number', renderer: fixed2},
                    { title:'收盘价', name:'close' ,width:60, align:'center', sortable: true, type: 'number', renderer: fixed2},
                    { title:'最低价', name:'low' ,width:60, align:'center', sortable: true, type: 'number', renderer: fixed2},
                    { title:'最高价', name:'high' ,width:60, align:'center', sortable: true, type: 'number', renderer: fixed2},
                    { title:'成交量(手)', name:'volume' ,width:100, align:'center', sortable: true, type: 'number', renderer: function(val){
                        return (val / 100).toFixed(2);
                    }},
                    { title:'adj_price', name:'adj_price' ,width:60, align:'center', sortable: true, type: 'number', renderer: fixed2},
                    { title:'换手率', name:'turnover' ,width:60, align:'center', sortable: true, type: 'number', renderer: function(val){
                        return val.toFixed(2)+'%';
                    }},
                    { title:'市净率', name:'pb' ,width:60, align:'center', sortable: true, type: 'number', renderer: fixed2},
//                     { title:'分组二',align: 'center', cols:[
//                         { title:'今收盘', name:'CLOSINGPRICE' ,width:60, align:'right', sortable: true, type: 'number', renderer: fixed2},
//                         { title:'涨跌幅', name:'DAYCHANGERATE' ,width:60, align:'right', sortable: true, type: 'number',renderer: function(val){
//                             if(val > 0){
//                                 return '<span style="color: #b00">' + val.toFixed(2) +'%' + '</span>';
//                             }else if(val < 0){
//                                 return '<span style="color: #0b0">' + val.toFixed(2) +'%' + '</span>';
//                             }
//                             return val.toFixed(2)+'%';
//                         }},
//                         { title:'涨跌额', name:'DAYCHANGE' ,width:60, align:'right', sortable: true, type: 'number', renderer: function(val){
//                             if(val > 0){
//                                 return '<span style="color: #b00">' + val.toFixed(2) + '</span>';
//                             }else if(val < 0){
//                                 return '<span style="color: #0b0">' + val.toFixed(2) + '</span>';
//                             }
//                             return val.toFixed(2);
//                         }},
//                         { title:'振幅', name:'AMPLITUDE' ,width:60, align:'right', sortable: true, type: 'number', renderer: function(val){
//                             return val.toFixed(2)+'%';
//                         }}
//                     ]},
//                     { title:'成交量(手)', name:'TURNOVERVOL' ,width:100, align:'right', sortable: true, type: 'number', renderer: function(val){
//                         return (val / 100).toFixed(2);
//                     }},
//                     { title:'成交额(万)', name:'TURNOVERVAL' ,width:100, align:'right', sortable: true, type: 'number', renderer: function(val){
//                         return (val / 10000).toFixed(2);
//                     }},
//                     {title: '分组三', align: 'center', cols:[
//                         { title:'昨收盘', name:'PREVCLOSINGPRICE' ,width:60, align:'right', sortable: true, type: 'number', renderer: fixed2},
//                         { title:'今开盘', name:'OPENINGPRICE',width:60, align:'right', sortable: true, type: 'number', renderer: fixed2}
//                     ]},
//                     { title:'最高价', name:'HIGHESTPRICE' ,width:60, align:'right', hidden: true, sortable: true, type: 'number', renderer: fixed2},
//                     { title:'最低价', name:'LOWESTPRICE' ,width:60, align:'right', hidden: true, sortable: true, type: 'number', renderer: fixed2},
                ];


                var mmg = $('.mmg').mmGrid({
                    height: 400
                    , cols: cols
                    , method: 'get'
                    , remoteSort:true
// 					, url:'../data_test/stockQuoteMore.json'
					, items: jsonobj
                    , sortName: 'id'
                    , sortStatus: 'asc'
                    , multiSelect: true
                    , checkCol: true
                    , fullWidthRows: true
                    , autoLoad: true
//                     , plugins: [
//                         $('#pg').mmPaginator({})
//                     ]
//                     , params: function(){
//                         //如果这里有验证，在验证失败时返回false则不执行AJAX查询。
//                       return {
//                           secucode: $('#secucode').val()
//                       }
//                     }
                });


                mmg.on('cellSelected', function(e, item, rowIndex, colIndex){
                    console.log('cellSelected!');
                    console.log(this);
                    console.log(e);
                    console.log(item);
                    console.log(rowIndex);
                    console.log(colIndex);
                }).load();
            });
        </script>
    </body>
</html>
