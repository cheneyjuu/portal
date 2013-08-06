<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>新增内容</title>
    <style type="text/css">@import url(${ctx}/static/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css);</style>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">
        $(function(){
            window.UEDITOR_HOME_URL = "${ctx}/static/ueditor/";
        });
    </script>
</head>
<body>
<div class="page-header">
    <h4>新增<c:choose>
            <c:when test="${typeName=='introduce'}">
                企业概况
            </c:when>
            <c:when test="${typeName=='business'}">
                业务领域
            </c:when>
            <c:when test="${typeName=='market'}">
                市场动态
            </c:when>
            <c:when test="${typeName=='news'}">
                新闻中心
            </c:when>
            <c:when test="${typeName=='contact'}">
                联系互动
            </c:when>
        </c:choose>消息</h4>
    <input type="hidden" id="typeNameHidden" value="${typeName}"/>
</div>
<form action="${ctx}/admin/add/${typeName}" method="post">
    <div class="control-group">
        <label class="control-label" for="inputTitle">标题</label>
        <div class="controls">
            <input class="input-large span4" type="text" name="title" id="inputTitle" placeholder="标题"> &nbsp;&nbsp; <i style="color: #3c3c3c;">* 如果没有可以不填</i>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="inputType">分类</label>
        <div class="controls">
            <select name="subType" id="inputType" class="span4">
                <option value="0">--选择分类--</option>
                <c:forEach items="${typeList}" var="t" varStatus="st">
                    <option value="${t}">${t}</option>
                </c:forEach>
            </select>
            &nbsp;&nbsp; <i style="color: #ff0000;">* 不能为空</i>
        </div>
    </div>

    <div class="control-group" id="uploaderDiv">
        <label class="control-label" for="uploader">上传图片</label>
        <div class="controls">
            <div id="uploader">
                <p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>
            </div>
        </div>
    </div>

    <div class="control-group" id="areaDiv">
        <label class="control-label" for="myEditor">内容</label>
        <div class="controls">
            <textarea id="myEditor" name="content"></textarea>
        </div>
    </div>

    <div class="control-group">
        <div class="controls">
            <%--<input type="button" class="btn btn-primary" id="submitBtn" value="保存" style="float:left;">--%>
            <button type="button" class="btn btn-primary" id="submitBtn" ><i class="icon-plus icon-white"></i> 保  存</button>
        </div>
    </div>

    <div id="files"></div>
</form>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<!-- Third party script for BrowserPlus runtime (Google Gears included in Gears runtime now) -->
<script type="text/javascript" src="${ctx}/static/plupload/js/browserplus-min.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/plupload.full.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/i18n/zh.js"></script>
<script type="text/javascript">

    UE.getEditor('myEditor');

    $(function(){
        var type_name = $("#typeNameHidden").val();
        var selectValue;
        $("select").change(function () {
            var str = "";
            $("select option:selected").each(function () {
                str += $(this).text() + "";
                selectValue = $(this).val();
            });

            if (str == "企业相册"){
                $("#areaDiv").hide();
                $("#uploaderDiv").show();
            } else {
                $("#areaDiv").show();
                $("#uploaderDiv").hide();
            }

            if (type_name == "market" || type_name == "news"){
                $("#uploaderDiv").show();
            }

        }).change();

        $("#submitBtn").click(function(){
            if (selectValue == 0){
                alert("请选择分类");
                return;
            } else {
                $("form").submit();
            }
        });
    });
</script>
<script type="text/javascript">
    $(function() {
        $("#uploader").pluploadQueue({
            runtimes : 'flash,html4,html5',
            url : '${ctx}/admin/image/upload',
            max_file_size : '10mb',
            headers : 'contentType="image/jpeg;charset=UTF-8"',
            urlstream_upload:true,
            unique_names:false,
            filters : [
                {title : "图片文件", extensions : "jpg,gif,png,jpeg,bmp"}
            ],
            flash_swf_url : '${ctx}/static/plupload/js/plupload.flash.swf',
            init : {
                FileUploaded:function(up,b,res){
                    var fileName = res["response"];
                    $('#files').append('<input type="hidden" name="fileNameList" value="'+fileName+'">');
                }
            }
        });
    });
</script>
</body>
</html>