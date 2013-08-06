<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title></title>
</head>
<body>
<table class="table table-bordered table-striped">
    <thead>
    <tr>
        <th>序号</th>
        <c:if test="${showTitle}">
            <th>标题</th>
        </c:if>
        <th>所属菜单</th>
        <c:if test="${subType!='企业相册'}">
            <th>内容</th>
        </c:if>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${contentPage.content}" var="image" varStatus="status">
        <tr>
            <td>${status.index+1}</td>
            <c:if test="${showTitle}">
            <td>${image.title}</td>
            </c:if>
            <td>${image.subType}</td>

            <c:if test="${subType!='企业相册'}">
                <td>
                    <c:choose>
                        <c:when test="${fn:length(image.content) > 10}">
                            ${fn:substring(image.content, 0, 10)}
                        </c:when>
                        <c:otherwise>
                            ${image.content}
                        </c:otherwise>
                    </c:choose>
                </td>
            </c:if>

            <td>
                <c:choose>
                    <c:when test="${image.subType=='企业相册'}">
                        <a class="btn" href="${ctx}/admin/image/list/${image.id}"><i class="icon-edit"></i> 查看</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn" href="${ctx}/admin/content/details/${image.id}"><i class="icon-list"></i> 查看</a>
                        <a class="btn" href="${ctx}/admin/update/${typeName}/${image.subType}/${image.id}"><i class="icon-edit"></i> 修改</a>
                    </c:otherwise>
                </c:choose>

                <a class="btn btn-danger" onclick="javascript:return window.confirm('确认删除吗？');" id="deleteBtn" href="${ctx}/admin/content/delete/${typeName}/${image.subType}/${image.id}"><i class="icon-trash icon-white"></i> 删除</a>
            </td>

        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="5">
            <c:if test="${fn:length(contentPage.content) > 0}">
                <tags:pagination page="${contentPage}" paginationSize="12"/>
            </c:if>
        </td>
    </tr>
    </tfoot>
</table>
</body>
</html>