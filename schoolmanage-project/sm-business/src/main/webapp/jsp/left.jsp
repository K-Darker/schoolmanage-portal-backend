<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.schoolmanage.domain.Employee"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>高校人事管理系统--菜单</title>
		<link href="${pageContext.request.contextPath}/css/left_css.css"
			rel="stylesheet" type="text/css">
	</head>
	<%
		//取出信息 0 1    2   3 4
		Employee emp=(Employee)request.getSession().getAttribute("user");
		int authority=emp.getAuthority();
	 %>
	<body bgcolor="#BCCBE5">
		<table width="98%" border="0" cellpadding="0" cellspacing="0"
			background="${pageContext.request.contextPath}/images/tablemde.jpg">
			<tr>
				<td height="5" background="${pageContext.request.contextPath}/images/tableline_top.jpg"
					bgcolor="#16ACFF"></td>
			</tr>
			
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class="leftframetable">
						<!-- 先是固定的 然后从数据库中循环开始 -->
					
						<tbody>
							<TR>
								<TD height="25"
									style="background: url(${pageContext.request.contextPath}/images/left_tt.gif) no-repeat">
									<!-- 菜单标题 -->
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class="STYLE1" style="CURSOR: hand" height=25>
												信息管理<!-- 要改变的 -->
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu cellSpacing=0 cellPadding=0
										width="100%" border=0 style="display: block">
										<!-- 此处循环子节点开始 -->
										
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/messages.do?flag=personManage&type=query" target="main">人事档案管理</a>
												</TD>
											</TR>
										</TBODY>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/messages.do?flag=jobManage&type=jobmanage" target="main">岗位设置管理</a>
												</TD>
											</TR>
										</TBODY>
										
									</TABLE>
								</TD>
							</TR>	
						</tbody>
						
						<tbody>
							<TR>
								<TD height="25"
									style="background: url(${pageContext.request.contextPath}/images/left_tt.gif) no-repeat">
									<!-- 菜单标题 -->
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class="STYLE1" style="CURSOR: hand" height=25>
												教师管理<!-- 要改变的 -->
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu cellSpacing=0 cellPadding=0
										width="100%" border=0 style="display: block">
										<!-- 此处循环子节点开始 -->
										<%if(emp.getAuthority()<4){ %>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/teachers.do?flag=strainManage" target="main">教师培训提交</a>
												</TD>
											</TR>
										</TBODY>
										<%} %>
										<%if(emp.getAuthority()>3){ %>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/teachers.do?flag=dealStrainManage" target="main">处理提交信息</a>
												</TD>
											</TR>
										</TBODY>
										<%} %>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/teachers.do?flag=teacherManage" target="main">教师培训管理</a>
												</TD>
											</TR>
										</TBODY>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/teachers.do?flag=checksManage" target="main">教师考核管理</a>											
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							
						</tbody>
						
						<%if(authority>=3){ %>
						<tbody>
							<TR>
								<TD height="25"
									style="background: url(${pageContext.request.contextPath}/images/left_tt.gif) no-repeat">
									<!-- 菜单标题 -->
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class="STYLE1" style="CURSOR: hand" height=25>
												退休管理<!-- 要改变的 -->
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu cellSpacing=0 cellPadding=0
										width="100%" border=0 style="display: block">
										<!-- 此处循环子节点开始 -->
										
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/retires.do?flag=retireManage" target="main">教师退休管理</a>														
												</TD>
											</TR>
										</TBODY>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/retires.do?flag=wealManage" target="main">工资福利管理</a>
													
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</tbody>
						<%} %>
						<% if(authority>1){%>
						<tbody>
							<TR>
								<TD height="25"
									style="background: url(${pageContext.request.contextPath}/images/left_tt.gif) no-repeat">
									<!-- 菜单标题 -->
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class="STYLE1" style="CURSOR: hand" height=25>
												人才管理<!-- 要改变的 -->
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu cellSpacing=0 cellPadding=0
										width="100%" border=0 style="display: block">
										<!-- 此处循环子节点开始 -->
										
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/rcgls.do?flag=rcplanManage" target="main">人才计划管理</a>
													
												</TD>
											</TR>
										</TBODY>
										<!-- 管理员做人才管理的 添加，弄另一个身份对添加的进行审核 -->
										<%
											Employee user=(Employee)request.getSession().getAttribute("user");
											if(user.getAuthority()==4){
										 %>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/rcgls.do?flag=rcmessManage" target="main">人才信息管理</a>
													
												</TD>
											</TR>
										</TBODY>
										<%} %>
										<%
											if(user.getAuthority()==3||user.getAuthority()==2){
										 %>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/rcgls.do?flag=rcheckManage" target="main">人才资格审查</a>
													
												</TD>
											</TR>
										</TBODY>
										<%} %>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="${pageContext.request.contextPath}/images/closed.gif">
												</TD>
												<TD height=23 class="STYLE2">
													<a href="${pageContext.request.contextPath}/rcgls.do?flag=rcjobManage" target="main">人才岗位安排</a>
													
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</tbody>
						<%} %>	
						<tbody>
							<TR>
								<TD height="25"
									style="background: url(${pageContext.request.contextPath}/images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class="STYLE1" style="CURSOR: hand" height=25>
												系统信息
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<span class="STYLE2"> <IMG src="${pageContext.request.contextPath}/images/closed.gif">开发人员：姜广栋									
										<br>
										<IMG src="${pageContext.request.contextPath}/images/closed.gif">指导老师：张成彬
										<br> <IMG src="${pageContext.request.contextPath}/images/closed.gif">帮助中心:<a
										href="../help.html" target="main">80379310@qq.com</a>
									<br> <IMG src="${pageContext.request.contextPath}/images/closed.gif">系统版本:5.0 </span>
								</TD>
							</TR>
						</tbody>
					</TABLE>
				</td>
			</tr>
			<tr>
				<td height="5" background="${pageContext.request.contextPath}/images/tableline_bottom.jpg"></td>
			</tr>
		</table>

	</body>
</html>
