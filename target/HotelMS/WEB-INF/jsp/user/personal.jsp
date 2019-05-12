<%--
  Created by IntelliJ IDEA.
  User: zrb
  Date: 2018/12/20
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- //for-mobile-apps -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../css/style1.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="../css/swipebox.css">
    <!-- js -->
    <script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
    <!-- //js -->
    <link href="http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic"
          rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic"
          rel="stylesheet" type="text/css">
</head>

<body>
<div class="banner_body">
    <div class="container">
        <div class="w3ls_logo_nav">
            <div class="w3ls_logo_nav_right">
                <div class="sap_tabs">
                    <div class="w3ls_logo_nav_left">
                        <h1 style="font-family: Myriad Pro;color: #F5FAFE">用户界面</h1>
                    </div>
                    <div id="horizontalTab" style="display: block; width: 100%; margin-left: 105px;">
                        <div class="resp-tabs-container">

                            <ul class="resp-tabs-list">

                                <li class="resp-tab-item" aria-controls="tab_item-1" id="tab_item-2" role="tab">
                                    <a href="/bookRoomList" >房间预定</a>
                                </li>
                                <li class="resp-tab-item" aria-controls="tab_item-2" id="tab_item-3" role="tab">
                                    <a href="/order/userOrder">查看订单</a>
                                </li>
                                <li class="resp-tab-item" aria-controls="tab_item-3" id="tab_item-4" role="tab">
                                    <a href="/user/update">修改信息</a>
                                </li>
                                <li class="resp-tab-item" aria-controls="tab_item-4" id="tab_item-5" role="tab">
                                    <a href="/user/changePwdPage">修改密码</a>
                                </li>
                            </ul>
                            <div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0"
                                 style="display:block;margin-left: 250px;margin-top: 100px">
                                <!-- home -->
                                <div class="wthree_tab_content">
                                    <c:if test="${USER.userPhoto==null}">
                                        <img src="/images/userphoto/unknow.jpg" alt=""
                                             style="border-radius:50px; position:absolute; z-index:3;
                                             margin-left: 150px;margin-top: -100px ;height:150px ;width:150px">
                                    </c:if>
                                    <c:if test="${USER.userPhoto!=null}">
                                        <img src="/upload/user/${USER.userPhoto}" alt=""
                                             style="border-radius:50px; position:absolute; z-index:3;
                                             margin-left: 150px;margin-top: -100px ;height:150px ;width:150px">
                                    </c:if>
                                    <div class="wthree_tab_content_pos" style="margin-top: -45px">
                                        <div class="wthree_tab_content_pos_grid">
                                            <h2>Welcome to Rose Hotel</h2>
                                            <h3>${USER.userName}</h3>
                                            <ul class="address">
                                                <li>
                                                    <ul class="address-text">
                                                        <li><b>性别</b></li>
                                                        <c:if test="${USER.userGender == 0}">女</c:if>
                                                        <c:if test="${USER.userGender == 1}">男</c:if>
                                                        <c:if test="${USER.userGender != 0 && USER.userGender != 1}">
                                                            外星人</c:if>
                                                        <li></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <ul class="address-text">
                                                        <li><b>电话</b></li>
                                                        <li>${USER.userPhone}</li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
