<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%@page import="com.schoolmanage.domain.Train"%>
<%@page import="com.schoolmanage.domain.Rcplan"%>
<%@page import="com.schoolmanage.domain.Scheck"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校人事管理系统——教师提交审核培训信息</title>
    
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
		function deal(){
		    document.forms[0].action="${pageContext.request.contextPath}/teachers.do?flag=dealScheck";
		    document.forms[0].submit();	
		 }
		
	</script>
  </head>
  
  <body>
		<div class="page_title">
			处理提交信息&gt; 处理提交信息管理 &gt;处理提交的信息 
		</div>
		<div class="button_bar">
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
		
			<button class="common_button" onClick="back();">
				返回
			</button>
			<button class="common_button" onClick="deal();">
				处理此项信息
			</button>
		</div>
		<br />
		<div class="page_title">
			基本信息:
		</div>
		<%
			Scheck scheck=(Scheck)request.getAttribute("scheck");
			
		 %>
		<form id="addStrain" name="update" action="" method="post">
			<input type="hidden" name="sc_id" value="<%=scheck.getId()%>" id="sc_id" />
			<table class="query_form_table">
				<tr>
					<th>
						申请人
					</th>
					<td>
						<%=scheck.getEmp().getEmpname() %>
					</td>
					<th>
						申请培训计划
					</th>
					<td>
						<%=scheck.getTrain().getTrno() %>
						
					</td>
				</tr>
				<tr>
					<th>
						申请计划标题
					</th>
					<td>
					<%=scheck.getTrain().getTitle() %>
						
					</td>
					<th>
						申请计划的内容
					</th>
					<td>
						<textarea name="context" cols="40" rows="5" id="context" readonly="readonly"><%=scheck.getTrain().getContext() %></textarea>
						
					</td>
				
				</tr>
				<tr>
					<th>
						审核处理内容
					</th>
					<td>
						<textarea name="scontext" cols="40" rows="5" id="scontext"  readonly="readonly"><%=scheck.getScontext() %></textarea>
					</td>	
					<th>
						处理提交信息备注
					</th>
					<td>
						<textarea name="isdeal" cols="40" rows="5" id="isdeal"><%=scheck.getIsdeal()%></textarea>
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
