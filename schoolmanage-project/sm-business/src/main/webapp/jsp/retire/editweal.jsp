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
    
    <title>高校人事管理系统——教师退休信息编辑</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" type="text/css"></link><!-- 因为这边是通过action跳转是webroot下../../css/style.css-->
	<script src="js/common.js"></script>
	<script language="javascript" type="text/javascript">
		
		function check(){
		  	alert("保存2");
		    document.forms[0].action="${pageContext.request.contextPath}/retires.do?flag=updateWeal";
		    document.forms[0].submit();	
		 }
	</script>
  </head>
  
  <body>
		<div class="page_title">
			退休管理 &gt; 工资福利管理 &gt; 编辑福利信息
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
			//取出退休信息
			Weal weal=(Weal)request.getAttribute("weal");
			PersonRecord pr=(PersonRecord)request.getAttribute("pr");
			
		 %>
		<form id="updateJob" name="update" action="" method="post">
			<input type="hidden" name="we_id" value="<%=weal.getId()%>" id="we_id"/>
			<input type="hidden" name="pr_id" value="<%=pr.getId()%>" id="pr_id"/>
			<table class="query_form_table">
				<tr>
					<th>
						员工编号
					</th>
					<td>
						<%=weal.getEmp().getEmpno() %>
					</td>
					<th>
						员工姓名
					</th>
					<td>
						<%=weal.getEmp().getEmpname() %>
					</td>
				</tr>
				<tr>
					<th>
						员工工资
					</th>
					<td>
						<input type="text" name="salary" size="20" value="<%=pr.getSalary() %>"
							id="salary" />
						<span class="red_star">*</span>
						
					</td>
					<th>
						奖金
					</th>
					<td>						
						<input type="text" name="comm" size="20" value="<%=pr.getComm() %>"
							id="comm" />
						<span class="red_star">*</span>
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
