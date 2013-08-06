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
        <th>内容</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${imageList}" var="image" varStatus="status">
        <tr>
            <td>${status.index+1}</td>
            <td>
                <img src="${ctx}${image.imagePath}${image.smallName}" alt=""/>
            </td>
            <td>
                <input type="hidden" value="${image.id}"/>
                <a class="btn" href="#uploadModal" role="button" data-toggle="modal" onclick="changeValue(this)"><i class="icon-edit"></i> 修改</a>
                <a class="btn btn-danger" onclick="javascript:return window.confirm('确认删除吗？');" id="deleteBtn" href="${ctx}/admin/image/delete/${contentId}/${image.id}"><i class="icon-trash icon-white"></i> 删除</a>
            </td>
        </tr>
    </c:forEach>

    <!-- Modal -->
    <div id="uploadModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">修改图片</h3>
        </div>
        <div class="modal-body">
            <form action="${ctx}/admin/image/singleUpload/${contentId}" id="uploadForm" enctype="multipart/form-data" method="post">
                <input type="file" name="file"/>
                <input type="hidden" name="id" id="uploadHiddenId"/>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-primary" id="uploadBtn">上传</button>
        </div>
    </div>

    </tbody>
</table>
<script type="text/javascript">
    var modify_id;

    function changeValue(el){
        modify_id = $(el).siblings().eq(0).val();
        $("#uploadHiddenId").val(modify_id);
    }

    $(function(){
        $("#uploadBtn").click(function(){
            $("#uploadForm").submit();
        });
    });
</script>
</body>
</html>