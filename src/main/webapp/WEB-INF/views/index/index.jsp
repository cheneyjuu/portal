<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style type="text/css">
    a{
        color: #333333;
    }
    a:hover{
        text-decoration: none;
    }
    .carousel-indicators{
        top: 330px;
        right: 100px;
    }
    .carousel-indicators .active{
        background-color: #0F64AC;
    }
</style>
<div class="container-fluid" style="padding: 0;">
    <div id="myCarousel" class="carousel slide">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="active item">
                <img src="${ctx}/static/images/ad1.jpg" alt="" style="margin: 0 auto; width: 100%; height: 350px;"/>
            </div>
            <div class="item">
                <img src="${ctx}/static/images/ad2.jpg" alt="" style="margin: 0 auto; width: 100%; height: 350px;"/>
            </div>
            <div class="item">
                <img src="${ctx}/static/images/ad3.jpg" alt="" style="margin: 0 auto; width: 100%; height: 350px;"/>
            </div>
            <div class="item">
                <img src="${ctx}/static/images/ad4.jpg" alt="" style="margin: 0 auto; width: 100%; height: 350px;"/>
            </div>
            <div class="item">
                <img src="${ctx}/static/images/ad5.jpg" alt="" style="margin: 0 auto; width: 100%; height: 350px;"/>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <%--<div style="height: 50px;"></div>--%>
    <div class="row-fluid">
        <div class="span3" style="padding-left: 8%;">
            <div class="page-header">
                <h4>公司新闻<small>/NEWS</small></h4>
                <c:forEach items="${contentPage.content}" var="cp">
                    <p><i class="icon-thumbs-up"></i> <a href="${ctx}/details/${cp.parentType}/${cp.subType}/${cp.id}">${cp.title}</a></p>
                </c:forEach>
            </div>
        </div>
        <div class="span8" style="margin-top: 2%;">
            <div class="span3">
                <a href="${ctx}/view/introduce/集团介绍">
                    <img src="${ctx}/static/images/index-introduce.jpg" class="img-polaroid">
                    <h5>集团介绍 <small>MORE</small> </h5>
                </a>
            </div>
            <div class="span3">
                <a href="${ctx}/view/introduce/企业相册">
                    <img src="${ctx}/static/images/index-image.jpg" class="img-polaroid">
                    <h5>企业相册 <small>MORE</small> </h5>
                </a>
            </div>
            <div class="span3">
                <a href="${ctx}/view/business">
                    <img src="${ctx}/static/images/index-business.jpg" class="img-polaroid">
                    <h5>业务领域 <small>MORE</small> </h5>
                </a>
            </div>
            <div class="span3">
                <a href="${ctx}/view/market/煤炭信息">
                    <img src="${ctx}/static/images/index-market.jpg" class="img-polaroid">
                    <h5>市场动态 <small>MORE</small> </h5>
                </a>
            </div>
        </div>
    </div>
</div>