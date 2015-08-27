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
    
    <title>高校人事管理系统——人才审核</title>
    
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
		  	alert("保存2");
		    document.forms[0].action="${pageContext.request.contextPath}/rcgls.do?flag=updateRcheck";
		    document.forms[0].submit();	
		 }
	</script>
  </head>
  
  <body>
		<div class="page_title">
			人才管理 &gt; 人才审核管理 &gt; 编辑审核
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
			基本审核信息:
		</div>
		<%
			//取出岗位信息
			Rcmess rcmess=(Rcmess)request.getAttribute("rcmess");
			List<Rcplan> rcplans=(List<Rcplan>)request.getAttribute("rcplans");
		 %>
		<form id="updateRcmess" name="update" action="" method="post">
			<input type="hidden" name="rcheck_id" value="<%=rcmess.getRcheck().getId()%>" id="rcheck_id"/>	
			<table class="query_form_table">
				<tr>
					<th>
						人才编号
					</th>
					<td>
						<%=rcmess.getRcno()%>
						
					</td>
					<th>
						人才名称
					</th>
					<td>
						<%=rcmess.getRcname() %>
						
					</td>
				</tr>
				<tr>
					<th>
						年龄
					</th>
					<td>
						<%=rcmess.getAge() %>
						
					</td>
					<th>
						性别
					</th>
					<td>
						<%=rcmess.getSex() %>
					</td>
				
				</tr>
				<tr>
					<th>
						参加的人才计划
					</th>
					<td>
						<%=rcmess.getRcplan().getRctype()%>
						
					</td>	
					<th>
						是否审核
					</th>
					<td>
						<select name="ischecked" id="ischecked">
							<option value="未审核" 
								<%
									if((rcmess.getRcheck().getIschecked()).equals("未审核")){
								 %>
								 selected="selected"
								 <%} %>
							>
								未审核
							</option>
							<option value="审核未通过"
								<%
									if((rcmess.getRcheck().getIschecked()).equals("审核未通过")){
								 %>
								 selected="selected"
								 <%} %>
							>
								审核未通过
							</option>
							<option value="审核通过"
								<%
									if((rcmess.getRcheck().getIschecked()).equals("审核通过")){
								 %>
								 selected="selected"
								 <%} %>
							>
								审核通过
							</option>
						</select>
						
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
