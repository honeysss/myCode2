﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.chinasofti.meeting.dao.DepartmentDao, com.chinasofti.meeting.vo.Department,
    java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>527会议管理系统</title>
        <link rel="stylesheet" href="styles/common.css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
       <style>
    .update {
    	color: gray;
    	border:none;
    	padding: 3px;
    	cursor: pointer;
    	outline: none;
    }
    .page-header .header-title {
    width:35% !important;
    margin-left: 13%;
    }
    </style>
    </head>
    <body>
        <div class="page-header">
            <div class="header-banner">
                <img src="images/header.png" alt="CoolMeeting"/>
            </div>
            <div class="header-title">
                欢迎访问527会议管理系统
            </div>
            <div class="header-quicklink">
                欢迎您,dear <strong>
                <%= session.getAttribute("username") %>
               </strong>
                
                <% 
                int empId = 0;
                	if (request.getAttribute("empId") != null) {
                		empId = Integer.parseInt(request.getAttribute("empId").toString());
                	}
                	
                %>
                
                <form action="updatePwdOrQuit" style="display:inline-block;">
                <input type="text" style="display:none;" value="<%= empId %>" name="empId"/>
                <input class="update" type="submit" value="修改密码" />
                <input class="update" type="button" value="退出" 
                onclick="quit()" />
                
                <script>
                	function quit() {
                        var con = confirm('您确定要退出吗?');
                        console.log(con);
                        if (con) {
                        	window.location.href = 'login.jsp';
                        }
                	}
                </script>
                
                </form>
            </div>
        </div>
        
        
        <div class="page-body">
            <div class="page-sidebar">
                <div class="sidebar-menugroup">
                    <div class="sidebar-grouptitle">员工管理</div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-menuitem"><a href="addEmployee.jsp">增加员工</a></li>
                        <li class="sidebar-menuitem"><a href="searchAllEmployees.jsp">查看所有员工</a></li>
                        <li class="sidebar-menuitem"><a href="searchOneEmployee.jsp">查找员工</a></li>
                    </ul>
                </div>
                <div class="sidebar-menugroup">
                    <div class="sidebar-grouptitle">部门管理</div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-menuitem"><a href="addDepartment.jsp">增加部门</a></li>
                        <li class="sidebar-menuitem"><a href="selectAllDept.jsp">查看所有部门</a></li>
                    </ul>
                </div>
                <div class="sidebar-menugroup">
                    <div class="sidebar-grouptitle">会议室管理</div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-menuitem"><a href="addMeetingRoom.jsp">添加会议室</a></li>
                        <li class="sidebar-menuitem"><a href="selectAllMeetingRooms.jsp">查看会议室</a></li>
                    </ul>
                </div>
                <div class="sidebar-menugroup">
                    <div class="sidebar-grouptitle">会议管理</div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-menuitem"><a href="addMeeting.jsp">增加会议</a></li>
                        <li class="sidebar-menuitem"><a href="selectAllMeetings.jsp">查看所有会议</a></li>
                        <li class="sidebar-menuitem"><a href="searchmeetings.jsp">查找会议</a></li>
                    </ul>
                </div>
            </div>
            <div class="page-content">
                <div class="content-nav">
                   员工管理  > 增加员工
                </div>
                <form action="AddEmpServlet">
                    <fieldset>
                        <legend>员工信息</legend>
                        <table class="formtable" style="width:50%">
                            <tr>
                                <td>姓名：</td>
                                <td>
                                    <input type="text" id="employeename" maxlength="20" name="empName"/>
                                </td>
                            </tr>
                            <tr>
                                <td>用户名：</td>
                                <td>
                                    <input type="text" id="accountname" maxlength="20" name="username"/>
                                </td>
                            </tr>
                            <tr>
                                <td>密码：</td>
                                <td>
                                    <input type="password" id="password" maxlength="20" placeholder="请输入6位以上的密码"
                                    name="pwd"/>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>确认密码：</td>
                                <td>
                                    <input type="password" id="confirm" maxlength="20" name="pwd2"/>
                                </td>
                            </tr>
                            <tr>
                                <td>联系电话：</td>
                                <td>
                                    <input type="text" id="phone" maxlength="20" name="empTel"/>
                                </td>
                            </tr>
                            <tr>
                                <td>电子邮件：</td>
                                <td>
                                    <input type="text" id="email" maxlength="20" name="empEmail"/>
                                </td>
                            </tr>
                            <tr>
							<td>所在部门：</td>
                                <td>
                                    <select name="empDeptId"> 
                                    <%
                                    	DepartmentDao departmentDao = new DepartmentDao();
                                    	ArrayList<Department> departmentList = departmentDao.selectAllDept();
                                    	if (departmentList.size() != 0) {
                                    		for (int i = 0; i < departmentList.size(); i ++) {
                                    %>   
                                     	<option value="<%= departmentList.get(i).getDeptId() %>"><%= departmentList.get(i).getDeptName() %></option>
										
									<% 
                                    		}
                                    	}
									%>
                                     </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" class="clickbutton" value="注册"/>
                                    <input type="reset" class="clickbutton" value="重置"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="page-footer">
            <hr/>
            更多问题，欢迎联系<a href="mailto:webmaster@eeg.com">管理员</a>
            <img src="images/footer.png" alt="CoolMeeting"/>
        </div>
        
        	<% String message = (String)request.getAttribute("message"); %>
        	<% if (message != null) { %>
	        <script>
	        		alert("<%= message %>");
	        </script>
        	<% } message = null; %>
    </body>
</html>