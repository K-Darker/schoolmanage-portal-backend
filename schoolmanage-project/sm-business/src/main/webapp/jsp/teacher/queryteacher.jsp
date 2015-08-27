<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校人事管理系统——培训信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" type="text/css"></link><!-- 因为这边是通过action跳转是webroot下../../css/style.css-->
	<script src="js/common.js"></script>

  </head>
  
  <body>
		<div class="page_title">
			教师管理 &gt; 教师培训管理 &gt; 查询培训信息
		</div>
		<div class="button_bar">
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
		
			<button class="common_button" onClick="back();">
				返回
			</button>
		</div>
		<br />
		<div class="page_title">
			基本信息:
		</div>
		<%
			//取出岗位信息
			Checks check=(Checks)request.getAttribute("check");
			
		 %>
		<form id="updateJob" name="update" action="" method="post">
			<table class="query_form_table">
				<tr>
					<th>
						员工编号
					</th>
					<td>
						<%=check.getEmp().getEmpno() %>
					</td>
					<th>
						员工姓名
					</th>
					<td>
						<%=check.getEmp().getEmpname() %>
					</td>
				</tr>
				<tr>
					<th>
						培训的编号
					</th>
					<td>
						<%=check.getTrain().getTrno() %>
					</td>
					<th>
						培训主题
					</th>
					<td>
						<%=check.getTrain().getTitle() %>
					</td>
				
				</tr>
				<tr>
					<th>
						培训内容
					</th>
					<td>
						<%=check.getTrain().getContext()%>
					</td>	
					<th>
						是否结束	
					</th>
					<td>
						<%
							if(check.getTrain().isIsend()==true){
								%>
								结束了
						<% 
							}else {							
						 %>
						     没结束
						  <%} %>
					</td>
				</tr>
				<tr>
					<th>
						培训目标
					</th>
					<td>
						<%=check.getTrain().getGoal() %>
					</td>	
					<th>
						培训要求
					</th>
					<td>
						<%=check.getTrain().getRequire()%>
					</td>
				</tr>
				<tr>
					<th>
						培训类型
					</th>
					<td>
						<%=check.getTrain().getType() %>
					</td>	
					<th>
						
					</th>
					<td>
						
					</td>
				</tr>
			</table>
			
		</form>
		
		
	</body>
</html>
