<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<style type="text/css">
    a{
        color: #333333;
    }
    a:hover{
        text-decoration: none;
    }
</style>
<div class="row-fluid well" style="margin-top: 50px; line-height: 30px;">
    <div class="span7">
        <a style="cursor:pointer;" onClick="setHomepage('http://cheneyjuu.x9.fjjsp01.com/portal/index');">设为首页</a> | <a style="cursor:pointer;" target=_top onclick="AddFavorite('http://cheneyjuu.x9.fjjsp01.com/portal/index', '上海浦丰能源发展有限公司')" >加入收藏</a> | <a href="${ctx}/view/contact/联系方式">联系我们</a> | <a
            href="${ctx}/admin/index">后台管理</a>
    </div>
    <div class="span5">
        上海浦丰能源发展有限公司&nbsp;&nbsp;&nbsp;&nbsp;版权所有[沪ICP备案0072568号]
    </div>
	<%--Copyright &copy; 2005-2012 <a href="#"></a>--%>

</div>
<script type="text/javascript">
  function setHomepage(pageURL) {
    if (document.all) {
        document.body.style.behavior='url(#default#homepage)';
        document.body.setHomePage(pageURL);
    }
    else {
            try { //IE
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            } catch (e) {
    try{ //Firefox
     var prefs = Components.classes['@mozilla.org/preferences-service;1']
.getService(Components. interfaces.nsIPrefBranch);
     prefs.setCharPref('browser.startup.homepage',pageURL);
    } catch(e) {
                alert( "您的浏览器不支持该操作，请使用浏览器菜单手动设置." );
    }
            }
    }
}

function AddFavorite(sURL, sTitle) {
    try { //IE
        window.external.addFavorite(sURL, sTitle);
    } catch (e) {
        try { //Firefox
            window.sidebar.addPanel(sTitle, sURL, "");
        } catch (e) {
   try{//Chrome无法自动收藏，用创建快应用程序的捷方式来替代。
    createShortcut();
   } catch(e){
    alert("您的浏览器不支持自动加入收藏，请使用Ctrl+D手动设置.");  
   }
        }
    }
}
</script>
