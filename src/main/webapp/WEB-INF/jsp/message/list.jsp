<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2018/12/19
  Time: 20:23  #F5F5F5
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
    <title>MessageList</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}../js/jquery-3.1.1.min.js"></script>
    <script>
        function check() {
            var content = $("#content").val();
            var file = $("#file").val();
            if(content==""){
                alert("随便说点什么吧...");
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
<div class="row user" style="background:#D3D3D3">
    <div class="col-md-12">
        <div class="profile">
            <div class="info">

                <c:if test="${!empty ADMIN.admin_name}">
                <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img src="/upload/admin/${ADMIN.admin_photo}" width="60" height="60"></a>
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;${ADMIN.admin_name}</h4>
                </c:if>
                <c:if test="${!empty USER.userName}">
                    <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="/upload/user/${USER.userPhoto}" width="60" height="60"></a>
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;${USER.userName}</h4>
                </c:if>
            </div>
            <div class="col-lg-12">
                <h4>Alerts</h4>
                <div class="bs-component">
                    <div class="alert alert-dismissible alert-info">
                        <button class="close" type="button" data-dismiss="alert">×</button>
                        <h3>Message Board</h3>
                        <p>这里是Rose Hotel的留言板，是一个永久开放，peace的留言平台，在这里你可以分享住宿期间的体验或图片，对本酒店的建议、吐槽等等！ aaaacl</p>
                        共 ${count} 条留言
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="tile p-0">
            <ul class="nav flex-column nav-tabs user-tabs">
                <li class="nav-item"><a class="nav-link active" href="/messageList" data-toggle="tab">留言列表</a></li>
                <li class="nav-item"><a class="nav-link" href="/toWriteMessage" data-toggle="tab">发表评论</a></li>
            </ul>
        </div>
    </div>
    <div class="col-md-9">
        <div class="tab-content">
            <div class="${listShow}" id="user-timeline">

                <c:forEach var="me" items="${page.rows}" varStatus="st" begin="0" step="1">
                <div class="timeline-post">
                    <div class="post-media"><a href="#"><img src="/upload/user/${me.message_user_photo}" width="40" height="40"></a>
                        <div class="content">
                            <h5><a href="#">${me.message_username}</a></h5>
                            <p class="text-muted"><small>${me.message_date}</small></p>
                        </div>
                    </div>
                    <div class="post-media">
                        <p>
                            ${me.message_content}
                            <c:if test="${!empty me.message_content_photo}">
                                <br><img src="${me.message_content_photo}" width="70" height="70">
                            </c:if>
                        </p>
                    </div>
                        <ul class="post-utility">
                        <li class="likes">
                            <a href="/likeMessage?id=${me.message_id}&num=${me.message_like}">
                                <i class="Hui-iconfont zan2">&#xe697;</i>&nbsp;${me.message_like}</a></li>
                        <li class="shares">
                            <a href="https://weibo.com/">
                                <i class="Hui-iconfont share-weibo">&#xe6da;</i>Share</a></li>
                            <c:if test="${!empty ADMIN.admin_name}">
                        <li class="comments">
                            <a href="/deleteMessage?id=${me.message_id}">
                                <i class="Hui-iconfont del3">&#xe6e2;&nbsp;&nbsp;</i></a></li>
                            <div><a href="#"><i class="Hui-iconfont del3">&#xe6df;</i></a></div>
                            </c:if>
                    </ul>
                </div>
                </c:forEach>

                <div style="float:right">
                    <ul class="pagination">
                        <% session.setAttribute("value",1); %>
                        <itheima:page url="${pageContext.request.contextPath}/messageList"/>
                        <li><a>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                        <% session.setAttribute("value",2); %>
                    </ul>
                </div>
            </div>
            <div class="${writeShow}" id="user-settings">
                <div class="tile user-settings">
                    <h4 class="line-head">Write down your thought </h4>
                    <div class="bs-component">
                        <div class="alert alert-dismissible alert-info">
                            <button class="close" type="button" data-dismiss="alert">×</button>
                            <h4>Today's topic</h4>
                            <p>Share an interesting incident that happeded in your hotel</p>
                        </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/saveMessage" enctype="multipart/form-data" method="post" onsubmit="return check()">
                        <div class="row">
                            <div class="col-md-8 mb-4">
                                <label>内容</label>
                                <textarea id="content" class="form-control" name="message_content" rows="7" placeholder="......"></textarea>
                            </div>
                            <div class="col-md-8 mb-4">
                                <label>添加图片</label>
                                <input id="file" class="form-control" type="file" name="file">
                            </div>
                        </div>
                        <div class="row mb-10">
                            <div class="col-md-12">
                                <input class="btn btn-primary" type="submit"value="send">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
