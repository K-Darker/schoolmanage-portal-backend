<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Retire"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    
    <title>高校人事管理系统——系统维护</title>
    

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
		    	document.forms[0].action="${pageContext.request.contextPath}/retires.do?flag=retireManage&pageNow="+pageNow;
		    	document.forms[0].submit();
		  	}
		 
	</script>
  </head>
  
  <body>
		<!-- 提示现在操作的选项 -->
		<div class="page_title">
			系统维护 &gt; 添加和删除退休人员
		</div>
		<div class="button_bar">
			
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				添加退休人员
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
					退休原因
				</th>
				<th>
					退休时间
				</th>
				<th>
					工作年限
				</th>
				<th>
					操作
				</th>
				<% 
					int i=0;
					//取出request的信息
					List<Retire> retires=(List)request.getAttribute("retires");
					if(retires!=null&&retires.size()>0){
							for(Retire retire:retires){
							%>
					<tr>
						
								<td class="list_data_number">
									<%=++i %>
								</td>
		
								<td class="list_data_text">
									<%=retire.getEmp().getEmpno() %>   
								</td>
						
								<td class="list_data_text">
									<%=retire.getEmp().getEmpname()%>
								<br /></td>
								<td class="list_data_text">
									<%=retire.getReason()%>								
									<br /></td>
								<td class="list_data_text">
									<%=retire.getRe_time().toLocaleString()%>		
								</td>
								<td class="list_data_text">	
									<%=retire.getWorktime()%>									
								</td>
						
						<td class="list_data_op">
							<img
								onClick="to('${pageContext.request.contextPath}/retires.do?flag=editRetire&id=<%= retire.getId()%>');"
								title="编辑退休信息" src="${pageContext.request.contextPath}/images/bt_edit.gif" class="op_button" />
							<img
								title="联系方式" src="${pageContext.request.contextPath}/images/bt_linkman.gif" class="op_button" />
							<img
								onClick="to('${pageContext.request.contextPath}/retires.do?flag=queryRetire&id=<%=retire.getId() %>');"
								title="查询退休信息" src="${pageContext.request.contextPath}/images/bt_detail.gif" class="op_button" />
							<img
								onClick="del('确定要删除<%=retire.getId() %>员工和其档案么','${pageContext.request.contextPath}/service.do?flag=delRetire&id=<%=retire.getId()%>');"
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
											onClick="location.href='${pageContext.request.contextPath}/retires.do?flag=retireManage&pageNow=1'"
											style="cursor: pointer" />
										<img src="${pageContext.request.contextPath}/images/back.gif"
											onClick="location.href='${pageContext.request.contextPath}/retires.do?flag=retireManage&pageNow=${pageNow-1}'"
											style="cursor: pointer" />
									</c:if>
									<!-- 如果不是尾页 -->
									<c:if test="${pageNow!=pageCount}">
										<img src="${pageContext.request.contextPath}/images/next.gif" onClick="location.href='${pageContext.request.contextPath}/retires.do?flag=retireManage&pageNow=${pageNow+1}'" style="cursor:pointer"/>
										<img src="${pageContext.request.contextPath}/images/last.gif" onClick="location.href='${pageContext.request.contextPath}/retires.do?flag=retireManage&pageNow=${pageCount}'" style="cursor:pointer"/>
									</c:if>	
									<img src="${pageContext.request.contextPath}/images/go.gif" onClick="submitgo()" alt="跳转" style="cursor:pointer"/>
								</div>				
						</form>
					</td>
				</tr>
		</table>
	</body>
</html>

