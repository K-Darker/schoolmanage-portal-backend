<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
   
    <title>高校人事管理系统</title>
   <link rel="stylesheet" href="css/login.css" type="text/css"></link>
   <!-- 引入js来对表单进行验证 -->
   <meta http-equiv=Content-Type content="text/html; charset=gb2312"/>
		<script type="text/javascript">
			var reg=/^(?:[\u4e00-\u9fa5]*\w*\s*)+$/;
			
			//用户名
			function checkUserName()
			{
				var user=document.getElementById("empname");
				
				if(user.value=="")
				{
					alert("用户名不能为空!");
					user.focus();
					user.select();
					return false;
				}
				else if(!reg.test(user.value))
				{
					alert("用户名不能是特殊字符！");
					user.focus();
					user.select();
					return false;
				}
				return true;		
			}
			
			/*
				密码验证
			*/
			function checkPwd()
			{
				var password=document.getElementById("pwd");
				if(password.value=="")
				{
					alert("密码不能为空!");
					password.focus();
					password.select();
					return false;
				}else if(!reg.test(password.value)){
				    alert("密码不能包含特殊字符!");
					password.focus();
					password.select();
					return false;
				}
				return true;
			}
			
			
			
			function clear1(){
				document.getElementById("empname").value="";
				document.getElementById("pwd").value="";
			}
			
			function check()
			{
			   if(checkUserName()&&checkPwd()){
					document.forms[0].submit();
				}
			}
			
			function keydown(){//键盘事件
			  if(event.keyCode==13){//回车
			     check();
			  }
			}
		</script>
		<script type="text/javascript">
			function ChangeCode(obj){
				obj.src=obj.src+"?temp=" + (new Date().getTime().toString(36));;
			}
		</script>
		
   </head>
  
 <body>
    <div id="login">
	
	     <div id="top">
		      <div id="top_left"><img src="${pageContext.request.contextPath}/images/login_03.gif" /></div>
			  <div id="top_center"></div>
		 </div>
		 
		 <div id="center">
		 	<form action="${pageContext.request.contextPath}/login.do?flag=login" method="post">
		      <div id="center_left"></div>
			  <div id="center_middle">
			       <div id="user" >用 户
			         <input type="text" name="empname" id="empname"/>
			       </div>
				   <div id="password">密   码
				     <input type="password" name="password" id="pwd"/>
				   </div>
				   <div id="btn"><a href="#" onclick="check();">登录</a><a href="#" onclick="clear1();">清空</a></div>
			  	  
			  </div>
			 </form>
			  <div id="center_right"></div>		 
		 </div>
		 <div id="down">
		      <div id="down_left">
			      <div id="inf">
                       <span class="inf_text">版本信息</span>
					   <span class="copyright">管理信息系统 2013 v5.0</span>
			      </div>
			  </div>
			  <div id="down_center"></div>		 
		 </div>

	</div>
</body>
</html>
