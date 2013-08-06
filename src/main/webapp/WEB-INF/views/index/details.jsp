<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>上海浦丰能源发展有限公司</title>
    <style type="text/css">
        .nav-list>.active>a, .nav-list>.active>a:hover, .nav-list>.active>a:focus{
            background: #F5F5F5;
            color: #0F64AC;
            /*font-size: 16px;*/
            text-align: center;
        }
        .nav-list>.active>a>[class^="icon-"]{
            background-image: url("${ctx}/static/bootstrap/img/glyphicons-halflings.png");
        }
        .nav-list>li>a{
            color: #333;
            /*font-size: 16px;*/
            text-align: center;
        }
        .nav-list>li>a{
            line-height: 30px;
        }
        #wellNavDiv{
            min-height: 900px;
            height: 100%;
        }
    </style>
    <style>
        a.link-blue{
            color: #0F64AC;
        }
        a.link-blue:active{
            color: #0F64AC;
        }
        a.link-blue:hover{
            color: #0F64AC;
        }
    </style>
    <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/galleria/galleria-1.2.9.min.js"></script>
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
    <div class="span9">

        <c:choose>
            <c:when test="${typeName == 'introduce'}">
                <img src="${ctx}/static/images/b_introduce.jpg" alt="" style="width: 100%; height: 200px;"/>
            </c:when>
            <c:when test="${typeName == 'business'}">
                <img src="${ctx}/static/images/b_business.jpg" alt="" style="width: 100%; height: 200px;"/>
            </c:when>
            <c:when test="${typeName == 'market'}">
                <img src="${ctx}/static/images/b_market.jpg" alt="" style="width: 100%; height: 200px;"/>
            </c:when>
            <c:when test="${typeName == 'news'}">
                <img src="${ctx}/static/images/b_news.jpg" alt="" style="width: 100%; height: 200px;"/>
            </c:when>
            <c:when test="${typeName == 'contact'}">
                <img src="${ctx}/static/images/b_contact.jpg" alt="" style="width: 100%; height: 200px;"/>
            </c:when>
        </c:choose>

        <div class="row-fluid">
            <div class="span8" style="padding-top: 1%; padding-left: 3%;">
                <h4 style="color: #0F64AC;">${subType}</h4>
            </div>
            <div class="span4 pull-right" style="padding-top: 1%;">
                <ul class="breadcrumb" style="background: #ffffff;">
                    <li><a class="link-blue" href="${ctx}/index">首页</a> <span class="divider">/</span></li>
                    <li><a class="link-blue" href="${ctx}/view/${typeName}">
                        <c:choose>
                            <c:when test="${typeName=='introduce'}">
                                <a class="link-blue" href="${ctx}/view/${typeName}/集团介绍">企业概况
                            </c:when>
                            <c:when test="${typeName=='business'}">
                                <a class="link-blue" href="${ctx}/view/${typeName}/煤炭贸易">业务领域
                            </c:when>
                            <c:when test="${typeName=='market'}">
                                <a class="link-blue" href="${ctx}/view/${typeName}/煤炭信息">市场动态
                            </c:when>
                            <c:when test="${typeName=='news'}">
                                <a class="link-blue" href="${ctx}/view/${typeName}/公司新闻">新闻中心
                            </c:when>
                            <c:when test="${typeName=='contact'}">
                                <a class="link-blue" href="${ctx}/view/${typeName}/招聘信息">联系互动
                            </c:when>
                        </c:choose>
                        </a> <span class="divider">/</span>
                    </li>
                    <li class="active">${subType}</li>
                </ul>
            </div>
        </div>

        <div class="row-fluid" style=" padding-left: 2%;">
            ${contentModel.content}
        </div>
        <p><a href="${ctx}/view/${typeName}/${subType}" class="btn btn-primary">返回列表</a></p>
        <div>
            <c:if test="${fn:length(contentPage.content) > 0}">
                <tags:pagination page="${contentPage}" paginationSize="5"/>
            </c:if>
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