<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2018/12/17
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>房间信息</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}../js/jquery-3.1.1.min.js"></script>
    <script>
        function check() {
            var id = $("#id").val();
            var room_number = $("#room_number").val();
            var file = $("#file").val();
            if(id==""){
                alert("请输入id...");
                return false;
            }
            if(room_number==""){
                alert("请输入房间编号...");
                return false;
            }
            if(file==""){
                alert("请添加图片...");
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="col-md-6">
        <div class="tile">
            <h3 class="tile-title">Please fill out this form</h3>
            <div class="tile-body">
                <c:if test="${allErrors != null }">
                    <c:forEach items="${allErrors }" var="error">
                        <font color="red" >${ error.defaultMessage}</font>
                    </c:forEach>
                </c:if>
                <form class="form-horizontal" action="${pageContext.request.contextPath}/${url}" method="post" enctype="multipart/form-data" onsubmit="return check()">
                    <div class="form-group row">
                        <label class="control-label col-md-3">ID</label>
                        <div class="col-md-8">
                            <input id="id" class="form-control" type="text" name="id" value="${room.id}"  placeholder="Enter id"
                                   <c:if test="${url == 'updateRoom'}">readonly="readonly"</c:if>>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">编号</label>
                        <div class="col-md-8">
                            <input id="room_number" class="form-control col-md-8" type="text" name="room_number" value="${room.room_number}" placeholder="Enter room_number">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">类型</label>
                        <div class="col-md-9">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="room_type" value="40">单人经济房
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="room_type" value="41">双人标准房
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="room_type" value="42">豪华套房
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">状态</label>
                        <div class="col-md-9">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="room_status" value="43">已预订
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="room_status" value="44">空闲
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="room_status" value="45">已满
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">价格</label>
                        <div class="col-md-8">
                            <input class="form-control col-md-8" type="text" name="room_price" value="${room.room_price}" placeholder="Enter room_price">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">照片</label>
                        <div class="col-md-8">
                            <input id="file" class="form-control" type="file" name="file">
                        </div>
                    </div>
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">
                                <input class="btn btn-primary" type="submit" value="提交">&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
