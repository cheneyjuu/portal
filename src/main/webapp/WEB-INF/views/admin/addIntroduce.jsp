<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title></title>
</head>
<body>
<div class="container row-fluid">
    <div class="span10">
        <div class="span3">分类：</div>
        <div class="span10">
            <select name="typeName" id="typeNameID">
                <option value="0">--选择分类--</option>
                <option value="1">集团介绍</option>
                <option value="2">组织机构</option>
                <option value="3">荣誉资质</option>
                <option value="4">企业相册</option>
            </select>
        </div>
    </div>
</div>
</body>
</html>