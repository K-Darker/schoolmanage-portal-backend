<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%@page import="com.schoolmanage.domain.Train"%>
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
	<script language="javascript" type="text/javascript">
		function changTrain(obj){
			//处理下拉菜单
			document.getElementById("tr_id").value=obj.options[obj.selectedIndex].innerHTML;
		
		}
		function check(){
		  	alert("保存2");
		    document.forms[0].action="${pageContext.request.contextPath}/teachers.do?flag=updateTeacher";
		    document.forms[0].submit();	
		 }
	</script>
  </head>
  
  <body>
		<div class="page_title">
			教师管理 &gt; 教师培训管理 &gt;添加培训信息
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
			Checks check=(Checks)request.getAttribute("check");
			List<Train> trains=(List<Train>)request.getAttribute("trains");
			
		 %>
		<form id="updateJob" name="update" action="" method="post">
			<table class="query_form_table">
				<tr>
					<th>
						培训编号
					</th>
					<td>
						<%=check.getEmp().getEmpno() %>
					</td>
					<th>
						培训内容
					</th>
					<td>
						<input type="text" name="context" size="20" value=""
							id="context"/>
					</td>
				</tr>
				<tr>
					<th>
						培训目标
					</th>
					<td>
						<input type="text" name="goal" size="20" value=""
							id="goal"/>
					</td>
					<th>
						培训要求
					</th>
					<td>
						<input type="text" name="require" size="20" value=""
							id="require"/>				
					</td>
				
				</tr>
				<tr>
					<th>
						培训类型
					</th>
					<td>
							<input type="text" name="type" size="20" value=""
							id="type"/>
					</td>	
					<th>
						是否结束	
					</th>
					<td>
						<select name="isend" id="isend">
								<option value="true">结束了</option>
							     <option value="false">没结束</option>
						</select>
						
					</td>
				</tr>
				<tr>
					<th>
						培训标题
					</th>
					<td>
						<input type="text" name="title" size="20" value=""
							id="title"/>	
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
