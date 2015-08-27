<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
	<head>
		<title>高校人事管理系统——人事档案管理</title>
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
		    	document.forms[1].action="${pageContext.request.contextPath}/messages.do?flag=personManage&pageNow="+pageNow;
		    	document.forms[1].submit();
		  	}
		  	function submitsearch(){//查询
		    	document.forms[0].action="${pageContext.request.contextPath}/messages.do?flag=personManage";
		    	document.forms[0].submit();
		  	}
		  	function del(msg,url){
			    var flag=window.confirm(msg);
				if (flag){
					to(url);
				}
			}
		</script>
	</head>

	<body>
		<!-- 提示现在操作的选项 -->
		<div class="page_title">
			信息管理 &gt; 人事档案管理
		</div>
		<div class="button_bar">
			<button class="common_button" onClick="submitsearch();">
				查询
			</button>
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
		</div>
		<form id="empquery" name="messagemanage"
			action="${pageContext.request.contextPath}/messages.do?flag=personManage" method="post">
			<table class="query_form_table">
				<tr>
					<th>
						员工编号
					</th>
					<td>
						<input type="text" name="empno" value="${empno}"
							id="empno" />
					</td>
					<th>
						员工姓名
					</th>
					<td>
						<input type="text" name="empname" value="${empname}"
							id="empname" />
					</td>
					<th>
						岗位
					</th>
					<td>
						<% String job1=(String)request.getAttribute("job"); %>
						${job1}
						<select name="job"
							id="job">
							<option value="-1"
								<%
								if(job1!=null&&job1.equals("-1")){
							 %>
							 	selected="selected"
							 <%} %>
							><!-- 对应数据库的值 -->
								全部
							</option>
							<% 
								List<Job> jobs=(List)request.getAttribute("jobs");
							if(jobs!=null&&jobs.size()>0){
								for(Job job:jobs){
							%>
								<option value="<%=job.getId() %>"
									<%if(job1!=null&&job1.equals(job.getId()+"")){ %>
										selected="selected"
									<%} %>
								>
									<%=job.getJobname() %>
								</option>
							<%}}%>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						年龄
					</th>
					<td>
						<input type="text" name="age" value="${age}"
							id="age" />
					</td>
					<th>
						部门
					</th>
					<td>
						<% String dept1=(String)request.getAttribute("dept"); %>
						<select name="dept"
							id="dept">
							
							<option value="-1"
							<%
								if(dept1!=null&&dept1.equals("-1")){
							 %>
							 	selected="selected"
							 <%} %>
							>
								全部
							</option>
							<% 
								List<Department> depts=(List)request.getAttribute("depts");
							if(depts!=null&&depts.size()>0){
								for(Department dept:depts){
							%>
								<option value="<%=dept.getDeptno() %>"
									<%if(dept1!=null&&dept1.equals(dept.getDeptno())){ %>
										selected="selected"
									<%} %>
								>
									<%=dept.getDeptname() %>
									
								</option>
							<%}}%>
						</select>
					</td>
					<th>
						档案查询权限
					</th>
					<td>
						<label>有</label><!-- 登陆后的提示 -->
					</td>
				</tr>
			</table>
		</form>
		
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
					员工名称
				</th>
				<th>
					性别
				</th>
				<th>
					职位
				</th>
				<th>
					权限等级
				</th>
				<th>
					操作
				</th>
				<% 
					int i=0;
					//取出request的信息
					List<Employee> emps=(List)request.getAttribute("emps");
					if(emps!=null&&emps.size()>0){
							for(Employee e:emps){
							%>
					<tr>
						
								<td class="list_data_number">
									<%=++i %>
								</td>
		
								<td class="list_data_text">
									<%=e.getEmpno() %>   
								</td>
						
						
								<td class="list_data_text">
									<%=e.getEmpname() %>
								</td>
								<td class="list_data_text">
									<%=e.getSex() %>
								</td>
								<td class="list_data_text">
									<%=e.getJob().getJobname() %>
								</td>
								<td class="list_data_text">		
									<%
										//取出判断权限
										int authority=e.getAuthority();
										switch(authority){
											case 0:%>干事或普通教师<%break;
											case 1:%>出纳<%break;
											case 2:%>办公室主任<%break;
											case 3:%>教研室主任<%break;
											case 4:%>校长或校党支部书记<%break;
											
										}
									 %>		
								</td>
						
						<td class="list_data_op">
							<%
								Employee user=(Employee)request.getSession().getAttribute("user");
								if(user.getAuthority()>1||user.getEmpname().equals(e.getEmpname())){
							 %>
							<img
								onClick="to('${pageContext.request.contextPath}/messages.do?flag=editEmp&id=<%=e.getId() %>');"
								title="编辑" src="${pageContext.request.contextPath}/images/bt_edit.gif" class="op_button" />
							<%} %>
							
							
							<img
								onClick="to('${pageContext.request.contextPath}/messages.do?flag=queryEmp&id=<%=e.getId()%>');"
								title="档案查询" src="${pageContext.request.contextPath}/images/bt_detail.gif" class="op_button" />
							
							<%
								if(user.getAuthority()>1){
							 %>	 
								<img
									onClick="del('确定要删除<%=e.getEmpname()%>员工和其档案么','${pageContext.request.contextPath}/messages.do?flag=delEmp&id=<%=e.getId() %>');"
									title="删除" src="${pageContext.request.contextPath}/images/bt_del.gif" class="op_button" />
							<%} %>
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
											onClick="location.href='${pageContext.request.contextPath}/messages.do?flag=personManage&pageNow=1'"
											style="cursor: pointer" />
										<img src="${pageContext.request.contextPath}/images/back.gif"
											onClick="location.href='${pageContext.request.contextPath}/messages.do?flag=personManage&pageNow=${pageNow-1}'"
											style="cursor: pointer" />
									</c:if>
									<!-- 如果不是尾页 -->
									<c:if test="${pageNow!=pageCount}">
										<img src="${pageContext.request.contextPath}/images/next.gif" onClick="location.href='${pageContext.request.contextPath}/messages.do?flag=personManage&pageNow=${pageNow+1}'" style="cursor:pointer"/>
										<img src="${pageContext.request.contextPath}/images/last.gif" onClick="location.href='${pageContext.request.contextPath}/messages.do?flag=personManage&pageNow=${pageCount}'" style="cursor:pointer"/>
									</c:if>	
									<img src="${pageContext.request.contextPath}/images/go.gif" onClick="submitgo()" alt="跳转" style="cursor:pointer"/>
								</div>				
						</form>
					</td>
				</tr>
		</table>
	</body>
</html>