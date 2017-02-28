<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="../css/jquery.searchableSelect.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/jquery.searchableSelect.js"></script>
</head>
<body>
<select name="select1">
      <option value="中国联通">中国联通</option>
      <option value="东方航空">东方航空</option>
      <option value="五粮液">五粮液</option>
      <option value="光明乳业">光明乳业</option>
      <option value="招商银行">招商银行</option>
      <option value="星新材料">星新材料</option>
      <option value="福田汽车">福田汽车</option>
      <option value="方正科技">方正科技</option>
      <option value="美的电器">美的电器</option>
    </select>
    <script type="text/javascript">
    	jQuery.noConflict();
		jQuery(function($){
			$('select').searchableSelect();
		});
    </script>
</body>
</html>