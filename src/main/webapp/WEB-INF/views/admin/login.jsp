<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>登录页</title>
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js" type="text/javascript"></script>

    <script>
		$(document).ready(function() {
			$("#loginForm").validate();
		});
	</script>
</head>

<body>
<div class="container well row-fluid">
    <div class="container" style="background: #fff;">
        <div>
            <img alt="上海浦丰能源" src="${ctx}/static/images/logo.png" />
        </div>
        <div style="height: 50px;"></div>
        <div class="row-fluid">
            <div class="container">
                <form id="loginForm" action="${ctx}/admin/login" method="post" class="form-horizontal">
                    <%
                        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                        if(error != null){
                    %>
                    <div class="alert alert-error input-medium controls">
                        <button class="close" data-dismiss="alert">×</button>登录失败，请重试.
                    </div>
                    <%
                        }
                    %>
                    <div class="control-group">
                        <label for="username" class="control-label">名称:</label>
                        <div class="controls">
                            <input type="text" id="username" name="username"  value="${username}" class="input-medium required"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="password" class="control-label">密码:</label>
                        <div class="controls">
                            <input type="password" id="password" name="password" class="input-medium required"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <label class="checkbox" for="rememberMe"><input type="checkbox" id="rememberMe" name="rememberMe"/> 记住我</label>
                            <input id="submit_btn" class="btn btn-primary" type="submit" value="登录"/> <a class="btn" href="${ctx}/register">注册</a>
                            <!-- <span class="help-block">(管理员: <b>admin/admin</b>, 普通用户: <b>user/user</b>)</span> -->
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
