<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>上海浦丰后台管理系统</title>
    <sitemesh:head />
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/static/styles/default.css"/>
    <script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <style type="text/css">
        .dropdown-menu{
            position: relative;
            width: 98%;
            margin-bottom: 10px;
            margin-left: 5%;
        }
        .dropdown-menu > li{
            height: 20px;
        }
        .dropdown-menu > li > a {
            line-height: 15px;
        }
    </style>
</head>
<body>
<shiro:hasRole name="admin">
<div class="container-fluid">
    <div class="row-fluid well">
        <div class="span10"><img alt="上海浦丰能源" src="${ctx}/static/images/logo.png"/></div>
        <div class="span2 pull-right" style="margin-top: 2%;">
            <a class="btn pull-right" style="margin-right: 5%;" href="${ctx}/logout"><i class="icon-hand-left"></i> 退出系统</a>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <ul class="nav nav-list well">
                <input type="hidden" id="currentType" value="${typeName}"/>
                <li class="nav-header">
                    <span>新增内容</span>
                </li>
                <li class="divider"></li>
                <li class="active" id="addList">
                    <a href="${ctx}/admin/add/introduce"><i class="icon-play"></i>新增企业概况</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${ctx}/admin/add/business"><i class="icon-play"></i>新增业务领域</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${ctx}/admin/add/market"><i class="icon-play"></i>新增市场动态</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${ctx}/admin/add/news"><i class="icon-play"></i>新增新闻</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${ctx}/admin/add/contact"><i class="icon-play"></i>新增联系互动</a>
                </li>
                <li class="divider"></li>
                <li class="nav-header">
                    <span>内容管理</span>
                </li>
                <li class="divider"></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" id="nLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
                        <i class="icon-play"></i>企业概况管理
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="nLabel">
                        <li><a href="${ctx}/admin/list/introduce/集团介绍">集团介绍</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/introduce/组织结构">组织结构</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/introduce/荣誉资质">荣誉资质</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/introduce/企业相册">企业相册</a></li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
                        <i class="icon-play"></i>业务领域管理
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="nLabel">
                        <li><a href="${ctx}/admin/list/business/煤炭贸易">煤炭贸易</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/business/房产置业">房产置业</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/business/航道疏浚">航道疏浚</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/business/仓储物流">仓储物流</a></li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
                        <i class="icon-play"></i>市场动态管理
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="nLabel">
                        <li><a href="${ctx}/admin/list/market/煤炭信息">煤炭信息</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/market/航运信息">航运信息</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/market/合作需求">合作需求</a></li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
                        <i class="icon-play"></i>新闻管理
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="nLabel">
                        <li><a href="${ctx}/admin/list/news/公司新闻">公司新闻</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/news/行业资讯">行业资讯</a></li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
                        <i class="icon-play"></i>联系互动管理
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="nLabel">
                        <li><a href="${ctx}/admin/list/contact/招聘信息">招聘信息</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/contact/联系方式">联系方式</a></li><li class="divider"></li>
                        <li><a href="${ctx}/admin/list/contact/友情链接">友情链接</a></li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li class="nav-header">
                    <span>个人中心</span>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${ctx}/admin/profile"><i class="icon-play"></i>修改资料</a>
                </li>
            </ul>
        </div>
        <div class="span9">
            <sitemesh:body />
        </div>
    </div>
</div>
</shiro:hasRole>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>