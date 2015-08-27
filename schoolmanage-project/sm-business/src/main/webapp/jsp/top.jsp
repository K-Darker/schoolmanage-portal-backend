<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>高校人事管理系统--头部</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script language="javascript" type="text/javascript">
		function reloop(){
			var time=new Date();
			var year=time.getYear();
			var month=time.getMonth()+1;
			var date=time.getDate();
			var day=time.getDay();
			var hour=time.getHours();
			var minutes=time.getMinutes();
			var seconds=time.getSeconds();
			
			var xingqi;
			switch(day){
			  case 0:
			     xingqi="日";
			  break;
			  case 1:
			     xingqi="一";
			  break;
			  case 2:
			     xingqi="二";
			  break;
			  case 3:
			     xingqi="三";
			  break;
			  case 4:
			     xingqi="四";
			  break;
			  case 5:
			     xingqi="五";
			  break;
			  case 6:
			     xingqi="六";
			  break;
			}
		    if(hour>12)
			{
			    hour=hour-12;
			    if(seconds<10)
			    {
					document.myform.tt.value=year+"年"+month+"月"+date+"号"+" 星期"+xingqi+" "+hour+":"+minutes+":0"+seconds+" PM";
				}
				if(minutes<10)
				{
				     document.myform.tt.value=year+"年"+month+"月"+date+"号"+" 星期"+xingqi+" "+hour+":0"+minutes+":"+seconds+" PM";
				}
				else if(seconds<10&&minutes<10)
				{
				    document.myform.tt.value=year+"年"+month+"月"+date+"号"+" 星期"+xingqi+" "+hour+":0"+minutes+":0"+seconds+" PM";
				}
		        else
				{
					document.myform.tt.value=year+"年"+month+"月"+date+"号"+" 星期"+xingqi+" "+hour+":"+minutes+":"+seconds+" PM";
				}
			}
			else
			{
				if(seconds<10)
				{
					document.myform.tt.value=year+"年"+month+"月"+date+"号"+" 星期"+xingqi+" "+hour+":"+minutes+":0"+seconds+" AM";
				}
				if(minutes<10)
				{
				    document.myform.tt.value=year+"年"+month+"月"+date+"号"+" 星期"+xingqi+" "+hour+":0"+minutes+":"+seconds+" AM";
				}
				if(seconds<10&&minutes<10)
				{
				     document.myform.tt.value=year+"年"+month+"月"+date+"号"+" 星期"+xingqi+" "+hour+":0"+minutes+":0"+seconds+" AM";
				}
				else
				{
				     document.myform.tt.value=year+"年"+month+"月" +date+"号"+" 星期"+xingqi+" "+hour+":"+minutes+":"+seconds+" AM";
				}
			}
			//定时刷新
			setTimeout("reloop()",1000);
		}
	</script>
	</head>
	<body bgcolor="#9AB2D8" onLoad="reloop();">
		<form name="myform">
			<table width="100%" style="margin:0px;" cellspacing="0">
				<tr>
					<td rowspan="2" width="400">
						<img alt="高校人事管理系统" src="../images/lg.gif">
					</td>
					<td align="left">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="right"
						style="color: #FFFFFF; font-size: 12px;width:auto;">
						<input id="tt"
							style="font-size: 12px; color: #FFFFFF; border-style: none; border-color: #9AB2D8; background-color: #9AB2D8"
							size="38" />
						&nbsp;&nbsp;
						欢迎您:
						<font  color=#ffffff size=3><B>${user.empname}</B></font>
						<a href="welcome.jsp" target="main" style="color:#FFFFFF;text-decoration:none">[首页]</a>&nbsp;
						<a href="${pageContext.request.contextPath }/help.html" target="main" style="color:#FFFFFF;text-decoration:none">[帮助]</a>
						&nbsp;
						<a onclick="return window.confirm('您确定要注销登录\n并且回到登录页面?');"
							href="${pageContext.request.contextPath }/index.jsp"
							target="_parent" style="color:#FFFFFF;text-decoration:none">[注销]</a>&nbsp;
						<a href="#" onClick="switchBar(this)" style="color:#FFFFFF;text-decoration:none" id="menu">[关闭左边]</a>
					</td>
				</tr>
			</table>
		</form>
		
		<script language="javascript">
			var displayBar=true;
			function switchBar(obj){
				if (displayBar){
					parent.frame.cols="0,*";
					displayBar=false;
					obj.title="打开左边管理菜单";
					document.getElementById('menu').innerText="[打开左边]";
				}
				else{
					parent.frame.cols="195,*";
					displayBar=true;
					obj.title="关闭左边管理菜单";
					document.getElementById('menu').innerText="[关闭左边]";
				}
			}
		</script>
	</body>
</html>
