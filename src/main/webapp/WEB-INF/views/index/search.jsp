<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>上海浦丰能源发展有限公司</title>
    <style type="text/css">
        a{
            color: #333333;
        }
        a:hover{
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="row-fluid">
    <div class="span3 well" id="wellNavDiv">
        <ul class="nav nav-list">
            <c:forEach items="${typeList}" var="tl" varStatus="st">
                <c:choose>
                    <c:when test="${st.index == 0}">
                        <li class="active">
                    </c:when>
                    <c:otherwise>
                        <li>
                    </c:otherwise>
                </c:choose>
                        <a href="${ctx}/view/${typeName}/${tl}"><i class="icon-play"></i> ${tl}</a>
                    </li>
                <li class="divider"></li>
            </c:forEach>
        </ul>
    </div>
    <div class="span9 page-header">

        <div class="container">
            <img src="${ctx}/static/images/banner1.jpg" alt=""/>
        </div>

        <div class="row-fluid">
            <div class="span9" style="padding-top: 1%; padding-left: 3%;">
                <h4 style="color: #0F64AC;">${subType}</h4>
            </div>
            <div class="span3" style="padding-top: 2%;">
                <ul class="breadcrumb" style="background: #ffffff;">
                    <li><a href="${ctx}">首页</a> <span class="divider">/</span></li>
                    <li class="active">${subType}</li>
                </ul>
            </div>
        </div>

        <div class="container" style=" padding-left: 2%;">
            <c:forEach items="${contentPage.content}" var="cp">
                <p><i class="icon-thumbs-up"></i> <a href="${ctx}/details/news/公司新闻/${cp.id}">${cp.title}</a></p>
            </c:forEach>
        </div>
    </div>
</div>
<input type="hidden" id="subTypeId" value="${subType}"/>
<script type="text/javascript">
    $(function(){
        var selectedNodeText;
        var currentNodeText = $("#subTypeId").val();
        $(".nav-list>li").each(function(){
            selectedNodeText = $(this).find("a").text();
            if ($.trim(selectedNodeText) == $.trim(currentNodeText)){
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
    });
</script>
</body>
</html>