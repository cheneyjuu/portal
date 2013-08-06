<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
    <li>
        <a href="${ctx}/admin/list/introduce" onclick="toggleList(1)"><i class="icon-play"></i>企业概况管理</a>
        <ul class="nav nav-stacked nav-pills" style="display: none;" id="q_sub">
            <li><a href="#">集团介绍</a></li>
            <li><a href="#">组织结构</a></li>
            <li><a href="#">荣誉资质</a></li>
            <li><a href="#">企业相册</a></li>
        </ul>
    </li>

    <li class="divider"></li>
    <li>
        <a href="${ctx}/admin/list/business"><i class="icon-play"></i>业务领域管理</a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="${ctx}/admin/list/market"><i class="icon-play"></i>市场动态管理</a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="${ctx}/admin/list/news"><i class="icon-play"></i>新闻管理</a>
    </li>
    <li class="divider"></li>
    <li>
        <a href="${ctx}/admin/list/contact"><i class="icon-play"></i>联系互动管理</a>
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

<script type="text/javascript">
    function toggleList(el){
        var isShown = false;
        isShown = $("#q_sub").style();
        alert("a: "+isShown);
    }
</script>

<script type="text/javascript">
    $(function(){
        var type = $("#currentType").val();



        if (type == "business"){
            $("ul > li").removeClass();
            $("ul > li:eq(3)").addClass("active");
        } else if (type == "market"){
            $("ul > li").removeClass();
            $("ul > li:eq(4)").addClass("active");
        } else if (type == "news"){
            $("ul > li").removeClass();
            $("ul > li:eq(5)").addClass("active");
        } else if (type == "contact"){
            $("ul > li").removeClass();
            $("ul > li:eq(6)").addClass("active");
        } else if (type == "introduce"){
            $("ul > li").removeClass();
            $("ul > li:eq(2)").addClass("active");
        }
    });
</script>