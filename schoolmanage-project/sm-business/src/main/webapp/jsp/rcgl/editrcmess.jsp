<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%@page import="com.schoolmanage.domain.Train"%>
<%@page import="com.schoolmanage.domain.Rcplan"%>
<%@page import="com.schoolmanage.domain.Rcmess"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校人事管理系统——人才信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" type="text/css"></link><!-- 因为这边是通过action跳转是webroot下../../css/style.css-->
	<script src="js/common.js"></script>
	<script language="JavaScript" type="text/javascript" charset="utf-8"
		src="js/WebCalendar.js"></script>
	<script language="javascript" type="text/javascript">
		function changTrain(obj){
			//处理下拉菜单
			document.getElementById("tr_id").value=obj.options[obj.selectedIndex].innerHTML;
		
		}
		function check(){
		    document.forms[0].action="${pageContext.request.contextPath}/rcgls.do?flag=updateRcmess";
		    document.forms[0].submit();	
		 }
	</script>
  </head>
  
  <body>
		<div class="page_title">
			人才管理 &gt; 人才管理 &gt; 编辑人才信息
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
			Rcmess rcmess=(Rcmess)request.getAttribute("rcmess");
			List<Rcplan> rcplans=(List<Rcplan>)request.getAttribute("rcplans");
		 %>
		<form id="updateRcmess" name="update" action="" method="post">
			<input type="hidden" name="rcmess_id" value="<%=rcmess.getId()%>" id="rcmess_id"/>	
			<table class="query_form_table">
				<tr>
					<th>
						人才编号
					</th>
					<td>
						<input type="text" name="rcno" size="20" value="<%=rcmess.getRcno()%>"
							id="rcno" />
							<span class="red_star">*</span>
						
					</td>
					<th>
						人才名称
					</th>
					<td>
						<input type="text" name="rcname" size="20" value="<%=rcmess.getRcname() %>"
							id="rcname" />
							<span class="red_star">*</span>
						
					</td>
				</tr>
				<tr>
					<th>
						年龄
					</th>
					<td>
					<input type="text" name="age" size="20" value="<%=rcmess.getAge() %>"
							id="age" />
							<span class="red_star">*</span>
						
					</td>
					<th>
						性别
					</th>
					<td>
						<input type="text" name="sex" size="20" value="<%=rcmess.getSex() %>"
							id="sex" />
							<span class="red_star">*</span>
					</td>
				
				</tr>
				<tr>
					<th>
						电话
					</th>
					<td>
						<input type="text" name="tel" size="20" value="<%=rcmess.getTel()%>"
							id="tel" />
							<span class="red_star">*</span>
					</td>	
					<th>
						参加的人才计划
					</th>
					<td>
						<select name="rcplan_id" id="rcplan_id">
							<%
								for(Rcplan rcs:rcplans){
							 %>
							<option value="<%=rcs.getId() %>" 
								<%
									if(rcs.getId()==rcmess.getRcplan().getId()){
								 %>
								 	selected="selected"
								 <%} %>
							>
								<%=rcs.getRctype() %>
							</option>
							<%} %>
						</select>
						
					</td>
				</tr>
				</table>
				<br/>
				<div class="page_title">
				详细信息:
				</div>
				<table class="query_form_table" id="table2">
				<tr>
					<th>
						照片
					</th>
					<td>
					<div style="width: 90px;height: 100px;">
							<img src="photo/<%=rcmess.getPhoto()%>" alt="照片" />
							<input type="hidden" name="photo" value="<%=rcmess.getPhoto()%>" id=""photo"" />
						</div>
						
					</td>
					<th>
						地址
					</th>
					<td>
						<textarea name="address" cols="40" rows="5" id="address"><%=rcmess.getAddress() %></textarea>
						
					</td>
				
				</tr>
				<tr>
					<th>
						email
					</th>
					<td>
					<input type="text" name="email" size="20" value="<%=rcmess.getEmail()%>"
							id="email" />
							<span class="red_star">*</span>
						
					</td>
					<th>
						学历
					</th>
					<td>
						<input type="text" name="edu_level" size="20" value="<%=rcmess.getEdu_level() %>"
							id="edu_level" />
						<span class="red_star">*</span>
					</td>
					<tr>
					<th>
						特长
					</th>
					<td>
						<textarea name="specialty" cols="40" rows="5" id="specialty"><%=rcmess.getSpecialty() %></textarea>
						
					</td>
					<th>
						身份证
					</th>
					<td>
							<input type="text" name="idcard" size="20" value="<%=rcmess.getIdcard() %>"
							id="idcard"/>
							<span class="red_star">*</span>
						
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
