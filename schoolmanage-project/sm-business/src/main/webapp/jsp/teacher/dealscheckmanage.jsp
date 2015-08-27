<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%@page import="com.schoolmanage.domain.Train"%>
<%@page import="com.schoolmanage.domain.Rcplan"%>
<%@page import="com.schoolmanage.domain.Rcmess"%>
<%@page import="com.schoolmanage.domain.Scheck"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校人事管理系统——管理员处理提交的信息</title>
    
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
		
		
		 function submitgo(){//分页GO
				var pageNow=document.getElementById("pageNow").value;
				if(pageNow>${pageCount}){
					pageNow=${pageCount};
				}
				else if(pageNow<1){
					pageNow=1;
				}
		    	document.forms[0].action="${pageContext.request.contextPath}/teachers.do?flag=dealStrainManage&pageNow="+pageNow;
		    	document.forms[0].submit();
		}
		function del(msg,url){
			    var flag=window.confirm(msg);
				if (flag){
					to(url);
				}
		}
		function godeal(){
		    document.forms[0].action="${pageContext.request.contextPath}/teachers.do?flag=goDealScheck";
		    document.forms[0].submit();	
		 }
	</script>
  </head>
  
  <body>	
	<body>
		<div class="page_title">
			处理提交信息&gt; 处理提交信息管理 
		</div>
		<div class="button_bar">
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
	
		
		<br />
		<table class="data_list_table">
			<tr>
				<th>
					序号
				</th>
				<th>
					参加计划编号   
				</th>
				<th>
					参加计划标题
				</th>
				<th>
					参加计划的内容
				</th>
				<th>
					备注
				</th>
				<th>
					 是否处理
				</th>
				<th>
					 操作
				</th>
				<% 
					int i=0;
					//取出request的信息
					List<Scheck> schecks=(List)request.getAttribute("schecks");
					if(schecks!=null&&schecks.size()>0){
							for(Scheck scheck:schecks){
							%>
					<tr>
						
								<td class="list_data_number">
									<%=++i %>
								</td>
		
								<td class="list_data_text">
									<%=scheck.getTrain().getTrno()%>   
								</td>
						
								<td class="list_data_text">
									<%=scheck.getTrain().getTitle()%>
								<br /></td>
								<td class="list_data_text">
									<%=scheck.getTrain().getContext()%>								
									<br /></td>
								<td class="list_data_text">
									<%=scheck.getScontext()%>		
								</td>
								<td class="list_data_text">		
									<%=scheck.getIsdeal() %>									
								</td>
						
						<td class="list_data_op">
							<img
								onClick="to('${pageContext.request.contextPath}/teachers.do?flag=goDealScheck&id=<%=scheck.getId() %>');"
								title="处理提交的信息" src="${pageContext.request.contextPath}/images/bt_edit.gif" class="op_button" />
							
							<img onClick="del('确定要删除此项审核吗','${pageContext.request.contextPath}/teachers.do?flag=delScheckAny&id=<%=scheck.getId() %>');"
									title="删除" src="${pageContext.request.contextPath}/images/bt_del.gif" class="op_button" />
						
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
											onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=dealStrainManage&pageNow=1'"
											style="cursor: pointer" />
										<img src="${pageContext.request.contextPath}/images/back.gif"
											onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=dealStrainManage&pageNow=${pageNow-1}'"
											style="cursor: pointer" />
									</c:if>
									<!-- 如果不是尾页 -->
									<c:if test="${pageNow!=pageCount}">
										<img src="${pageContext.request.contextPath}/images/next.gif" onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=dealStrainManage&pageNow=${pageNow+1}'" style="cursor:pointer"/>
										<img src="${pageContext.request.contextPath}/images/last.gif" onClick="location.href='${pageContext.request.contextPath}/teachers.do?flag=dealStrainManage&pageNow=${pageCount}'" style="cursor:pointer"/>
									</c:if>	
									<img src="${pageContext.request.contextPath}/images/go.gif" onClick="submitgo()" alt="跳转" style="cursor:pointer"/>
								</div>				
						</form>
					</td>
				</tr>
		</table>
	</body>
</html>
