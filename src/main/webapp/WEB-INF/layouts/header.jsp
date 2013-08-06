<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<style type="text/css">
    #navDiv>ul>li{
        padding-left: 9%;
    }
    #navDiv>ul>li>a{
        color: #ffffff;
    }
    #navDiv>ul>li>a:hover{
        color: #0F64AC;
    }
    #navDiv>ul>li.active>a{
        color: #0F64AC;
        background: #ffffff;
    }
    #navDiv>ul{
        background: url("${ctx}/static/images/navbg.jpg") repeat-x;
    }
    .form-search{
        padding-top: 5%;
    }
    .nav-pills > a{
        height: 11px;
    }
    .nav-pills > a:active{
        height: 11px;
    }
    .dropdown-menu{
        position: absolute;
        top: 18%;
        left: inherit;
        min-width: 150px;
        opacity: 0.85;
    }
    .dropdown-menu > li{
        height: 15px;
    }
    .dropdown-menu > li > a{
        line-height: 10px;
        height: 18px;
        padding: 3px 40px 5px;
    }
</style>
<div style="width: 100%; height: 20px;"></div>
<div class="row-fluid">
    <div class="span8">
        <img src="${ctx}/static/images/blue_logo.png" alt="上海浦丰能源发展有限公司" style="height: 64px;"/>
    </div>
    <div class="span2 pull-right" style="margin-right: 7%;">
        <form class="form-search" action="${ctx}/search" style="margin-top:5%;">
            <div class="input-append">
                <input name="param" type="text" class="span8 search-query" placeholder="搜索">
                <button type="submit" class="btn"><i class="icon-search"></i> 搜 索</button>
            </div>
        </form>
    </div>
</div>
<div style="height: 15px;"></div>
<div class="row-fluid" id="navDiv">
    <ul class="nav nav-pills" style="margin-bottom: 0px; position: relative;">
        <li class="active"><a href="${ctx}/index">首页</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
                企业概况
            </a>
            <ul class="dropdown-menu" id="dMenu" role="menu" aria-labelledby="dLabel" style="left:20%; top:1px;">
                <li><a href="#"  style="font-weight: bolder;">企业概况</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/introduce/集团介绍">集团介绍</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/introduce/组织结构">组织结构</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/introduce/荣誉资质">荣誉资质</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/introduce/企业相册">企业相册</a></li>
            </ul>
        </li>

        <li class="dropdown">
            <a class="dropdown-toggle" id="nLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
                新闻中心
            </a>
            <ul class="dropdown-menu" id="nMenu" role="menu" aria-labelledby="nLabel" style="left:36.2%; top:1px;">
                <li><a href="#" style="font-weight: bolder;">新闻中心</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/news/公司新闻">公司新闻</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/news/行业资讯">行业资讯</a></li>
            </ul>
        </li>

        <li class="dropdown">
            <a class="dropdown-toggle" id="mLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
                市场动态
            </a>
            <ul class="dropdown-menu" id="mMenu" role="menu" aria-labelledby="mLabel" style="left:52.2%; top:1px;">
                <li><a href="#" style="font-weight: bolder;">市场动态</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/market/煤炭信息">煤炭信息</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/market/航运信息">航运信息</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/market/合作需求">合作需求</a></li>
            </ul>
        </li>


        <li class="dropdown">
            <a class="dropdown-toggle" id="yLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
                业务领域
            </a>
            <ul class="dropdown-menu" id="yMenu" role="menu" aria-labelledby="yLabel" style="left:68.2%; top:1px;">
                <li><a href="#" style="font-weight: bolder;">业务领域</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/business/煤炭贸易">煤炭贸易</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/business/房产置业">房产置业</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/business/航道疏浚">航道疏浚</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/business/仓储物流">仓储物流</a></li>
            </ul>
        </li>

        <li class="dropdown">
            <a class="dropdown-toggle" id="cLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
                联系互动
            </a>
            <ul class="dropdown-menu" id="cMenu" role="menu" aria-labelledby="cLabel" style="left:84.2%; top:1px;">
                <li><a href="#" style="font-weight: bolder;">联系互动</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/contact/招聘信息">招聘信息</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/contact/联系方式">联系方式</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/view/contact/友情链接">友情链接</a></li>
            </ul>
        </li>
    </ul>
</div>
<input type="hidden" id="typeId" value="${typeName}"/>
<div class="clearfix"></div>
<script type="text/javascript">
    $(function(){
        $('.carousel').carousel({
            interval: 5000
        });
        var currentType = $("#typeId").val();
        var currentName;

        $(".nav-pills > li").each(function(){
            $(this).removeClass();
        });
        if (currentType == "introduce"){
            $(".nav-pills>li:eq(1)").addClass("active");
            currentName = "企业概况";
        } else if (currentType == "business"){
            $(".nav-pills>li:eq(4)").addClass("active");
            currentName = "业务领域";
        } else if (currentType == "market"){
            $(".nav-pills>li:eq(3)").addClass("active");
            currentName = "市场动态";
        } else if (currentType == "news"){
            $(".nav-pills>li:eq(2)").addClass("active");
            currentName = "新闻中心";
        } else if (currentType == "contact"){
            $(".nav-pills>li:eq(5)").addClass("active");
            currentName = "联系互动";
        } else {
            $(".nav-pills>li:eq(0)").addClass("active");
            currentName = "首页";
        }


        $(".dropdown-menu>li>a").click(function(){
            $(this).parent().parent().siblings().css("background","#ffffff").css("color","#0F64AC");
        });

        $(".dropdown-menu li").click(function(e) {
            e.stopPropagation();
        });

        $(".dropdown-toggle").mouseenter(function(){
            $(this).dropdown('toggle');
            if ($.trim($(this).text()) != currentName){
                $(this).css("color","#ffffff").css("background","url('${ctx}/static/images/navbg.jpg') repeat-x");
            }
        });

        $(".dropdown-menu").mouseleave(function(){
            $(this).dropdown('toggle');
        });
    });
</script>