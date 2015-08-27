<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    
    <title>高校人事管理系统——教师退休信息查询</title>
    
	<link rel="stylesheet" href="css/style.css" type="text/css"></link><!-- 因为这边是通过action跳转是webroot下../../css/style.css-->
	<script src="js/common.js"></script>
	
  </head>
  
  <body>
		<div class="page_title">
			退休管理 &gt; 教师退休管理 &gt; 查询退休信息
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
			//取出退休信息
			Retire retire=(Retire)request.getAttribute("retire");
			Weal weal=(Weal)request.getAttribute("weal");
			
		 %>
		<form id="updateJob" name="update" action="" method="post">
			<input type="hidden" name="id" value="<%=retire.getId()%>" id="id"/>
			<table class="query_form_table">
				<tr>
					<th>
						员工编号
					</th>
					<td>
						<%=retire.getEmp().getEmpno() %>
					</td>
					<th>
						员工姓名
					</th>
					<td>
						<%=retire.getEmp().getEmpname() %>
					</td>
				</tr>
				<tr>
					<th>
						退休原因
					</th>
					<td>
						<%=retire.getReason()%>
					</td>
					<th>
						退休时间
					</th>
					<td>						
						<%=retire.getRe_time().toLocaleString()%>
					</td>
				
				</tr>
				
				
			</table>
			<br />
			<div class="page_title">
				退休员工的福利信息:
			</div>
			<table class="query_form_table" id="table2">
				<tr>
					<th>
						员工表现
					</th>
					<td>
						<textarea name="achieve" cols="40" rows="5" id="achieve"><%=weal.getAchieve()%></textarea>
						
					</td>
					<th>
						福利的具体内容
					</th>
					<td>
						<textarea name="wealContext" cols="40" rows="5" id="wealContext"><%=weal.getWealContext()%></textarea>						
					</td>
				</tr>
				<tr>
					<th>
						是否退休了
					</th>
					<td>
						<%
							if(weal.getEmp().isIsretire()==true){ %>
								退休了
						<%}else{ %>
								在职
						<%} %>	
						
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
