<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校人事管理系统——岗位部门查询</title>
    
	<script language="javascript" type="text/javascript"
			src="js/common.js"></script>
	<link rel="stylesheet" href="css/style.css" type="text/css"></link>

  </head>
  
  <body>
		<div class="page_title">
			信息管理 &gt; 人事档案管理 &gt; 编辑员工信息
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
			Job job=(Job)request.getAttribute("job");
			List<Department> depts=(List<Department>)request.getAttribute("depts");
		 %>
		<form id="updateJob" name="update"
			action="" method="post">
			
			<table class="query_form_table">
				<tr>
					<th>
						岗位名称
					</th>
					<td>
						<%=job.getJobname() %>
					</td>
					<th>
						已有的人数
					</th>
					<td>
						<%=job.getHasnum()%>
					</td>
				</tr>
				<tr>
					<th>
						需要的人数
					</th>
					<td>
						<%=job.getNeednum()%>
					</td>
					<th>
						所属部门
					</th>
					<td>
						<%=job.getDept().getDeptname() %>
					</td>
				
				</tr>
				<tr>
					<th>
						岗位要求
					</th>
					<td>
						<textarea name="require" cols="40" rows="5" id="require" readonly="readonly"><%=job.getRequire() %></textarea>
					</td>	
					<th>	
					</th>
					<td>
						
					</td>
				</tr>
				
			</table>
			<br />
			<div class="page_title">
				部门信息:
			</div>
			<table class="query_form_table" id="table2">
				<tr>
					<th>
						部门编号
					</th>
					<td>
						<%=job.getDept().getDeptno() %>
						
					</td>
					<th>
						部门名称
					</th>
					<td>
						<%=job.getDept().getDeptname()%>
					</td>
				</tr>
				<tr>
					<th>
						部门描述
					</th>
					<td>
						<textarea name="description" cols="40" rows="5" id="description" readonly="readonly"><%=job.getDept().getDescription()%></textarea>		
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
