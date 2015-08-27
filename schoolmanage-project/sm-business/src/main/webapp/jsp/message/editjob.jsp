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
    
    <title>高校人事管理系统——岗位设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" type="text/javascript"
			src="js/common.js"></script>
	<script language="javascript" type="text/javascript">
		function changeDept(obj){
			//处理下拉菜单dept
			document.getElementById("deptname").value=obj.options[obj.selectedIndex].innerHTML;
		
		}
		function check(){
		  	alert("保存1");
		    document.forms[0].action="${pageContext.request.contextPath}/messages.do?flag=saveJob";
		    document.forms[0].submit();	
		 }
	</script>
	<link rel="stylesheet" href="css/style.css" type="text/css"></link>
	
  </head>
  
  <body>
		<div class="page_title">
			信息管理 &gt; 岗位设置管理 &gt; 编辑岗位信息
		</div>
		<div class="button_bar">
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
		
			<button class="common_button" onClick="back();">
				返回
			</button>
			<button class="common_button" onClick="check();">
				保存
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
		<form id="updateJob" name="update" action="" method="post">
			<input type="hidden" name="job_id" value="<%=job.getId()%>" id="job_id"/>
			<input type="hidden" name="dept_id" value="<%=job.getDept().getId() %> id="dept_id"/>
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
						<input type="text" name="hasnum" size="20" value="<%=job.getHasnum()%>" id="hasnum" />
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						需要的人数
					</th>
					<td>
						<input type="text" name="neednum" size="20" value="<%=job.getNeednum()%>" id="neednum" />
						<span class="red_star">*</span>
					</td>
					<th>
						所属部门(原部门:<%=job.getDept().getDeptname() %>)
					</th>
					<td>
						
						<select name="dept" id="dept" onchange="changeDept(this);">
							<%
								//部门的显示
								for(Department dept:depts){
							 %>
							<option value="<%=dept.getId() %>" 
								<%
									if(job.getDept().getId()==dept.getId()){
								 %>
								selected="selected"
								<%} %>
								>
								<%=dept.getDeptname() %>
							</option>
							<%} %>
						</select>
					</td>
				
				</tr>
				<tr>
					<th>
						岗位要求
					</th>
					<td>
						<textarea name="require" cols="40" rows="5" id="require"><%=job.getRequire() %></textarea>
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
						<input type="text" name="deptname" size="20" value="<%=job.getDept().getDeptname()%>"
							id="deptname" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<th>
						部门描述
					</th>
					<td>
						<textarea name="description" cols="40" rows="5" id="description"><%=job.getDept().getDescription()%></textarea>		
					</td>
					<th>
						
					</th>
					<td>
						
					</td>
				</tr>
				
			</table>
		</form>
		
		<table width="100%">
			<tr>
				<td align="right">
					带
					<span class="red_star">*</span>号的为必填项
				</td>
			</tr>
		</table>
	</body>
</html>
