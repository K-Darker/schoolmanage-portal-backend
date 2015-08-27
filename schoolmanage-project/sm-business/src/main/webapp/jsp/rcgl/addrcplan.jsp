<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%@page import="com.schoolmanage.domain.Train"%>
<%@page import="com.schoolmanage.domain.Rcplan"%>
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
	<script language="JavaScript" type="text/javascript" charset="utf-8"
		src="js/WebCalendar.js"></script>
	<script language="javascript" type="text/javascript">
		function changTrain(obj){
			//处理下拉菜单
			document.getElementById("tr_id").value=obj.options[obj.selectedIndex].innerHTML;
		
		}
		function check(){
		  	alert("保存2");
		    document.forms[0].action="${pageContext.request.contextPath}/rcgls.do?flag=saveAddRcplan";
		    document.forms[0].submit();	
		 }
	</script>
  </head>
  
  <body>
		<div class="page_title">
			人才管理 &gt; 人才计划管理 &gt; 添加人才计划信息
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
		
		<form id="addRcplan" name="update" action="" method="post">
			<table class="query_form_table">
				<tr>
					<th>
						人才类型
					</th>
					<td>
						<input type="text" name="rctype" size="20" value=""
							id="rctype" />
							<span class="red_star">*</span>
						
					</td>
					<th>
						人才计划题目
					</th>
					<td>
						<input type="text" name="rctitle" size="20" value=""
							id="rctitle" />
							<span class="red_star">*</span>
						
					</td>
				</tr>
				<tr>
					<th>
						计划时间
					</th>
					<td>
					<input type="text" name="rctime" size="20" value=""
							id="rctime" onclick="new Calendar().show(this);"/>
							<span class="red_star">*</span>
						
					</td>
					<th>
						人才计划内容
					</th>
					<td>
						<textarea name="context" cols="40" rows="5" id="require"></textarea>
						
					</td>
				
				</tr>
				<tr>
					<th>
						描述
					</th>
					<td>
						<textarea name="description" cols="40" rows="5" id="require"></textarea>
					</td>	
					<th>
						要达到的要求
					</th>
					<td>
						<input type="text" name="require" size="20" value=""
							id="require" onchange="checkScore(this);"/>
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
