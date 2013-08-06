<%@ page contentType="text/html;charset=UTF-8" %>
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
        .galleria-image .galleria-images .galleria-stage{
            width:95%;
            height: 600px;
        }
        .galleria-layer img {
            top:0;
        }
        #galleria{ width: 95%; height: 600px; background: #fff; }
        .galleria-container {
            background: #fff;
        }
        .galleria-thumbnails-list {
            margin : 0 45px 0 45px;
        }
        .galleria-image-nav-right {
            background-position:-280px 20px;
            width: 50px;
            height: 70px;
            background-color: #ccc;
            right: -60;
        }
        .galleria-image-nav-left{
            width: 50px;
            height: 70px;
            background-color: #ccc;
            background-position:20px 20px;
        }
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
            <div class="span4" style="padding-top: 1%;">
                <ul class="breadcrumb" style="background: #ffffff;">
                    <li><a class="link-blue" href="${ctx}/index">首页</a> <span class="divider">/</span></li>
                    <li>
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
                    </a> <span class="divider">/</span></li>
                    <li class="active">${subType}</li>
                </ul>
            </div>
        </div>

        <div class="row-fluid" style=" padding-left: 2%;">
            <c:choose>
                <c:when test="${contentModel.subType == '企业相册'}">
                <div id="galleria">
                    <c:forEach items="${contentModel.imageList}" var="picture">
                        <a href="${ctx}${picture.imagePath}${picture.bigName}"><img src="${ctx}${picture.imagePath}${picture.smallName}" data-big="${ctx}${picture.imagePath}${picture.imageName}"></a>
                    </c:forEach>
                </div>
                    <script>
                        Galleria.loadTheme('${ctx}/static/galleria/themes/classic/galleria.classic.min.js');
                        Galleria.run('#galleria');
                        Galleria.configure({
                            showImagenav: 'true',
                            autoplay: 5000,
                            imageCrop: false,
                            preload:'7',
                            responsive:true,
                            maxScaleRatio:'1',
                            minScaleRatio:'1'
                        });
                    </script>
                </c:when>

                <c:when test="${typeName=='market' || typeName=='news' || subType=='招聘信息'}">
                    <c:forEach items="${contentPage.content}" var="cp">
                        <div class="row-fluid" style="margin-bottom: 10px;">
                            <div class="span8" style="margin-left: 0;">
                                <a href="${ctx}/details/${typeName}/${subType}/${cp.id}" class="link-blue" style="font-weight: bold;">
                                    <h5 style="font-size: 16px;">${cp.title}<small style="padding-left: 20px;">${cp.createTime}</small></h5>
                                </a>
                                <p>
                                    <a href="${ctx}/details/${typeName}/${subType}/${cp.id}">${cp.content}</a>
                                </p>
                            </div>
                            <div class="span3 pull-right">
                                <c:if test="${fn:length(cp.imageList) > 0}">
                                    <c:forEach items="${cp.imageList}" var="picture" varStatus="st">
                                        <c:if test="${st.index == 0}">
                                            <a target="_blank" href="${ctx}${picture.imagePath}${picture.imageName}"><img class="pull-right" style="max-height: 120px; padding-right: 10px;" src="${ctx}${picture.imagePath}${picture.smallName}" data-big="${ctx}${picture.imagePath}${picture.smallName}"></a>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <div class="page-header">
                        <h1>${contentModel.title}</h1>
                        <%--<h3>${subType}</h3>--%>
                    </div>
                    <p>${contentModel.content}</p>
                </c:otherwise>
            </c:choose>
        </div>
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