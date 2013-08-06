<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title></title>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h5>您的位置：<c:choose>
            <c:when test="${contentModel.parentType=='introduce'}">
                企业概况
            </c:when>
            <c:when test="${contentModel.parentType=='business'}">
                业务领域
            </c:when>
            <c:when test="${contentModel.parentType=='market'}">
                市场动态
            </c:when>
            <c:when test="${contentModel.parentType=='news'}">
                新闻中心
            </c:when>
            <c:when test="${contentModel.parentType=='contact'}">
                联系互动
            </c:when>
        </c:choose>&nbsp;&nbsp;>>>&nbsp;&nbsp;<span style="color: red;">${contentModel.subType}</span></h5>
        <h5>文章标题：${contentModel.title}</h5>
    </div>
    <c:if test="${fn:length(contentModel.imageList) > 0}">
        <c:forEach items="${contentModel.imageList}" var="img">
            <img src="${ctx}${img.imagePath}${img.imageName}" alt="上海浦丰能源有限责任公司"/>
        </c:forEach>
    </c:if>
    <p>${contentModel.content}</p>
</div>
<div class="container well">
    <button type="button" onclick="history.back()" class="btn btn-primary"><i class="icon-repeat icon-white"></i> 返 回</button>
</div>
</body>
</html>