<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TestN</title>
<script type="text/javascript">
 		function getXhr(){
 			var xhr = null;
 			if (window.XMLHttpRequest){
 				xhr = new XMLHttpRequest();
 			}else{
 				xhr = new ActiveXObject('Microsoft.XMLHttp');
 			}
 			return xhr;
 		}
 		function commit(){
 			var xhr = getXhr();
 			var name1="中国联通";
 			var name2="方正科技";
 			xhr.open("post","compare?name1="+name1+"&name2="+name2,true);
 			xhr.onreadystatechange=function(){
 				if(xhr.readyState == 4){
 					if(xhr.status == 200){
 						var txt = xhr.responseText;
 						var obj = eval('('+txt+')');
 						alert(txt);
 					}
 					else {
 						alert(xhr.status);
 					}
 				}
 			}
 			xhr.send(null);
 		}
 	</script>
</head>
<body>
 	<form>
 		<input type="button" value = "fedf" onclick ="commit()">
 	</form>
</body>
</html>