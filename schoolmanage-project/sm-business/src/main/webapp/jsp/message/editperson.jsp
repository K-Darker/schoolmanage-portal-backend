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
		function checkPwd(){//密码合法验证
		    var pwderror = document.getElementById("pwderror");//获取显示密码错误信息的层  
		    var pwd=document.getElementById("pwd");
		    if(pwd.value!=""){
		      if(pwd.value.length<6){
			      pwderror.innerHTML="<font color='#FF0000'>密码长度必须在6至12个字符内!</font>";
			      pwd.focus();
			      return false;
		      }
		      if(!reg.test(pwd.value)){
				    pwderror.innerHTML="<font color='#FF0000'>不能包含特殊字符!</font>";
					pwd.focus();
					return false;
			  }
			  if(pwd.value.match(/\s/g, " ")){
			     pwderror.innerHTML="<font color='#FF0000'>不能包含空格!</font>";
				 pwd.focus();
				 return false;
			  }
			  pwderror.innerHTML="(可以为字母、数字)";
		    } 
		    return true;
		  }
		  
		  function check(){
		  	var pwd=document.getElementById("password").value;
		  	alert("密码修改为:"+pwd);
		    document.forms[0].action="${pageContext.request.contextPath}/messages.do?flag=saveEmp";
		    document.forms[0].submit();	
		  }
	</script>
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
			<button class="common_button" onClick="check();">
				保存
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
		<form id="updateEmp" name="update" action="" method="post">
			<input type="hidden" name="id" value="<%=emp.getId()%>" id="id" />
			<input type="hidden" name="pr_id" value="<%=pr.getId()%>"
				id="pr_id" />
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
						<input type="text" name="empname"  size="20" value="<%=emp.getEmpname()%>" id="empname" />
						<span class="red_star">*</span>
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
						<input type="password" name="password"  id="password" size="20" value="<%=emp.getPassword()%>"
							id="password" />
						<span id="pwderror">(可以为字母、数字)</span>
					</td>
				</tr>
				<tr>
					<th>
						员工等级编辑(原等级:<%
										//取出判断权限
										int authority=emp.getAuthority();
										switch(authority){
											case 0:%>干事或普通教师<%break;
											case 1:%>出纳<%break;
											case 2:%>办公室主任<%break;
											case 3:%>教研室主任<%break;
											case 4:%>校长或校党支部书记<%break;
											
										}
									 %>		)
					</th>
					<td>
						<select name="authority" id="authority">
							<option value="4">
								校长或校党支部书记
							</option>
							<option value="3">
								教研室主任
							</option>
							<option value="2">
								办公室主任
							</option>
							<option value="1">
								出纳
							</option>
							<option value="0">
								干事或普通教师
							</option>
						</select>

						<span class="red_star">*</span>
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
						岗位编辑(原工作:<%=emp.getJob().getJobname() %>)
					</th>
					<td>
						<select name="job" id="job">
							<option value="1">
								校长
							</option>
							<option value="2">
								校党支部书记
							</option>
							<option value="3">
								教研室主任
							</option>
							<option value="4">
								办公室主任
							</option>
							<option value="5">
								出纳
							</option>
							<option value="6">
								干事
							</option>
							<option value="7">
								普通教师
							</option>
						</select>
						<span class="red_star">*</span>
					</td>
					<th>
						在职
					</th>
					<td>
						<select name="isretire" id="isretire">
						
							<option value="1" 
							<%if(emp.isIsretire()==true){ %>
							 selected="selected" >
							 
								是
							</option>
							<option value="0" >
 								否
 							</option>
							<%
 							}else{
 							%>
 							<option value="0" selected="selected">
 								否
 							</option>
 							<option value="1">
 								是
 							</option>
 						 	<%}%>
						</select>
 						
					</td>
				</tr>
			</table>
			<br />
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
							<input type="hidden" name="photo" value="<%=pr.getPhoto()%>" id=""photo"" />
						</div>
						
					</td>
					<th>
						电话
					</th>
					<td>
						<input type="text" name="tel" size="20" value="<%=pr.getTel() %>"
							id="tel" />
						<span class="red_star">*</span>	
					</td>
				</tr>
				<tr>
					<th>
						邮箱(email)
					</th>
					<td>
						<input type="text" name="email" size="20" id="email" value="<%=pr.getEmail()%>"/>						
						<span class="red_star">*</span>	
					</td>
					<th>
						地址
					</th>
					<td>
						<input type="text" name="address" size="20" id="address" value="<%=pr.getAddress()%>" />
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						学历
					</th>
					<td>
						<input type="text" name="edu_level" size="20" id="edu_level" value="<%=pr.getEdu_level()%>"  />
						<span class="red_star">*</span>
					</td>
					<th>
						工资
					</th>
					<td>
						<input type="text" name="salary" size="20" id="salary" value="<%=pr.getSalary()%>" />
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						奖金
					</th>
					<td>
						<input type="text" name="comm" size="20" value="<%=pr.getComm()%>" 
							id="comm" />
						<span class="red_star">*</span>	
					</td>
					<th>
						特长
					</th>
					<td>
						<input type="text" name="specialty" size="20" value="<%=pr.getSpecialty()%>" 
							id="specialty" />
						<span class="red_star">*</span>	
					</td>
				</tr>
				<tr>
					<th>
						雇佣日期
					</th>
					<td>
						<input type="text" name="hiredate" size="20" id="hiredate" value="<%=pr.getHiredate()%>" 
							readonly="readonly" onclick="new Calendar().show(this);" />
						<span class="red_star">*</span>	
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
