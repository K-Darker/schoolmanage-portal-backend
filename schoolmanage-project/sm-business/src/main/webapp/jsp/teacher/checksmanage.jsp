<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%@page import="com.schoolmanage.domain.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校人事管理系统——教师考核管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" type="text/css"></link><!-- 因为这边是通过action跳转是webroot下../../css/style.css-->
	<script src="js/common.js"></script>
	<script type="text/javascript">
			function submitgo(){//分页GO
				var pageNow=document.getElementById("pageNow").value;
				if(pageNow>${pageCount}){
					pageNow=${pageCount};
				}
				else if(pageNow<1){
					pageNow=1;
				}
		    	document.forms[0].action="${pageContext.request.contextPath}/teachers.do?flag=teacherManage&pageNow="+pageNow;
		    	document.forms[0].submit();
		  	}
		 
	</script>
  </head>
  
  <body>
		<!-- 提示现在操作的选项 -->
		<div class="page_title">
			教师管理 &gt; 教师培训管理
		</div>
		<div class="button_bar">
			
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
		</div>
	
		
		<br />
		<table class="data_list_table">
			<tr>
				<th>
					序号
				</th>
				<th>
					员工编号
				</th>
				<th>
					员工姓名
				</th>
				<th>
					培训标题
				</th>
				<th>
					培训分数
				</th>
				<th>
					是否合格
				</th>
				<th>
					操作
				</th>
				<% 
					int i=0;
					//取出request的信息
					List<Checks> checks=(List)request.getAttribute("checks");
					if(checks!=null&&checks.size()>0){
							for(Checks check:checks){
							%>
					<tr>
						
								<td class="list_data_number">
									<%=++i %>
								</td>
		
								<td class="list_data_text">
									<%=check.getEmp().getEmpno() %>   
								</td>
						
								<td class="list_data_text">
									<%=check.getEmp().getEmpname()%>
								<br /></td>
								<td class="list_data_text">
									<%=check.getTrain().getTitle()%>								
									<br /></td>
								<td class="list_data_text">
									<%=check.getScore()%>		
								</td>
								<td class="list_data_text">	
									<%
										if(check.isIsqualify()==true){
									 %>
									 合格
									<%}else{%>
									 不合格
									<%} %>									
								</td>
						
						<td class="list_data_op">
							<%
								Employee user=(Employee)request.getSession().getAttribute("user");
								if(user.getAuthority()>2){
							 %>
							<img
								onClick="to('${pageContext.request.contextPath}/teachers.do?flag=editChecks&id=<%= check.getId()%>');"
								title="编辑考核信息" src="${pageContext.request.contextPath}/images/bt_edit.gif" class="op_button" />
							<%} %>
							<img
								onClick="to('${pageContext.request.contextPath}/teachers.do?flag=queryChecks&id=<%=check.getId() %>');"
								title="查询考核信息" src="${pageContext.request.contextPath}/images/bt_detail.gif" class="op_button" />
						
						</td>

					</tr>
					<%
						}
					}
					%>
					<tr>
					<td colspan="100" class="pager">
						<!-- 分页 -->
						<form method="post" >
							<%
								//从session取出当前页数
								//int pageNow=(Integer)request.getAttribute("pageNow");
							 %>
								<div class="pager">
									共
									${rowCount}
									条记录 每页显示
									<input type="text" name="pageSize" size="2" value="${pageSize}" id="pageSize"/>
									条第
									<input type="text" name="pageNow" id="pageNow" size="2" value="${pageNow}" id="pageNow"/>
									页/共
									${pageCount}
									页
									<!-- 取出每页显示条数值，设置到变量 -->
									
									<!-- 如果不是首页 -->
									<c:if test="${pageNow!=1}">
										<img src="${pageContext.request.contextPath}/images/first.gif"
											onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=checksManage&pageNow=1'"
											style="cursor: pointer" />
										<img src="${pageContext.request.contextPath}/images/back.gif"
											onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=checksManage&pageNow=${pageNow-1}'"
											style="cursor: pointer" />
									</c:if>
									<!-- 如果不是尾页 -->
									<c:if test="${pageNow!=pageCount}">
										<img src="${pageContext.request.contextPath}/images/next.gif" onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=checksManage&pageNow=${pageNow+1}'" style="cursor:pointer"/>
										<img src="${pageContext.request.contextPath}/images/last.gif" onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=checksManage&pageNow=${pageCount}'" style="cursor:pointer"/>
									</c:if>	
									<img src="${pageContext.request.contextPath}/images/go.gif" onClick="submitgo()" alt="跳转" style="cursor:pointer"/>
								</div>				
						</form>
					</td>
				</tr>
		</table>
	</body>
</html>
