<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Employee"%>
<%@page import="com.schoolmanage.domain.PersonRecord"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />

		<title>高校人事管理系统——员工信息</title>

		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<!--
			<link rel="stylesheet" type="text/css" href="styles.css">
		-->
		<script language="javascript" type="text/javascript"
			src="js/common.js"></script>

		<link rel="stylesheet" href="css/style.css" type="text/css"></link>
	</head>
	<script language="JavaScript" type="text/javascript" charset="utf-8"
		src="js/WebCalendar.js"></script>

	<script language="JavaScript" type="text/javascript">
		//var calendar_cn = new Calendar(2000, 2010, 0);
		var calendar_en = new Calendar(1990, 2050, 1, "dd-MM-yy");
	</script>
	<body>
		<div class="page_title">
			信息管理 &gt; 人事档案管理 &gt; 查询员工档案
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
			//取出员工信息
			Employee emp=(Employee)request.getAttribute("emp");
			PersonRecord pr=(PersonRecord)request.getAttribute("pr");
		 %>
		<form id="cust_customer_doEdit_action" name="update"
			action="/crm/cust_customer_doEdit.action" method="post">
			<input type="hidden" name="empid" value="<%=emp.getId()%>"
				id="cust_customer_doEdit_action_customer_custNo" />
			<table class="query_form_table">
				<tr>
					<th>
						员工编号
					</th>
					<td>
						<%=emp.getEmpno() %>
					</td>
					<th>
						员工姓名
					</th>
					<td>
						<%=emp.getEmpname()%>
					</td>
				</tr>
				<tr>
					<th>
						性别
					</th>
					<td>
						<%=emp.getSex() %>  
					</td>
					<th>
						员工密码
					</th>
					<td>
						<%=emp.getPassword()%>
					</td>
				</tr>
				<tr>
					<th>
						员工等级
					</th>
					<td>
						<%
										//取出判断权限
										int authority=emp.getAuthority();
										switch(authority){
											case 0:%>干事或普通教师<%break;
											case 1:%>出纳<%break;
											case 2:%>办公室主任<%break;
											case 3:%>教研室主任<%break;
											case 4:%>校长或校党支部书记<%break;
											
										}
									 %>		

					</td>
					<th>
						年龄
					</th>
					<td>
						<%=emp.getAge() %>
					</td>
				</tr>
				<tr>
					<th>
						工作
					</th>
					<td>
						<%=emp.getJob().getJobname() %>
					</td>
					<th>
					</th>
					<td>
 
					</td>
				</tr>
			</table>
			<div class="page_title">
				档案信息:
			</div>
			<table class="query_form_table" id="table2">
				<tr>
					<th>
						照片
					</th>
					<td>
						<div style="width: 90px;height: 100px;">
							<img src="photo/<%=pr.getPhoto()%>" alt="照片" />
						</div>
						
					</td>
					<th>
						电话
					</th>
					<td>
						<%=pr.getTel() %>
					</td>
				</tr>
				<tr>
					<th>
						邮箱(email)
					</th>
					<td>
						<%=pr.getEmail()%>
					</td>
					<th>
						地址
					</th>
					<td>
						<%=pr.getAddress()%>
					</td>
				</tr>
				<tr>
					<th>
						学历
					</th>
					<td>
						<%=pr.getEdu_level()%>
					</td>
					<th>
						工资
					</th>
					<td>
						<%=pr.getSalary()%>
					</td>
				</tr>
				<tr>
					<th>
						奖金
					</th>
					<td>
						<%=pr.getComm()%>
					</td>
					<th>
						特长
					</th>
					<td>
						<%=pr.getSpecialty()%>
					</td>
				</tr>
				<tr>
					<th>
						雇佣日期
					</th>
					<td>
						<%=pr.getHiredate()%>
					</td>
					<th>
						身份证
					</th>
					<td>
						<%=pr.getIdcard()%>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
