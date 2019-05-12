<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎登录酒店后台管理系统</title>
    <link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="${pageContext.request.contextPath }../js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }../js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-471)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-471)/2});
            })
        });
    </script>

</head>

<body style="background-color:#1c77ac; background-image:url(${pageContext.request.contextPath }/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>欢迎登录酒店后台管理界面平台</span>
    <ul>
        <li><a href="/user/login">用户登录</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>

<div class="loginbody">

    <span class="systemlogo"></span>

    <div class="loginbox" style="height: 400px;">
        <ul>
            <li><input id="name" name="name" type="text" class="loginuser" placeholder="name" /></li>
            <li><input id="password" name="password" type="password" class="loginpwd" placeholder="password" /></li>
            <li><img src="/kaptcha" style="float: left;" onclick="this.src='/kaptcha?'+Math.random()">
            <input id="vertity" name="vertity"  style="height: 36px; margin-left: 5px; width: 180px;"  type="text" placeholder="  ?" /></li>
            <li><input type="button" class="loginbtn" onclick="x()" value="登录" />
                <input type="reset" class="loginbtn" value="重置"/><br/>
                <label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    function x() {
        var vertity = document.getElementById("vertity").value;
        var name = document.getElementById("name").value;
        var password =document.getElementById("password").value;
        $.ajax({
            url:"/doLogin",
            type:"post",
            data:JSON.stringify({name:name,password:password,vertity:vertity}),
            contentType: "application/json;charset=UTF-8",

            success:function (data) {
                if(data != null){
                    if(data.code === 1){
                        /*alert("您输入的用户名为：" + data.name
                            +"密码为：" + data.pwd);*/
                        window.location.href =
                            "${pageContext.request.contextPath}/index";
                    }else if(data.code === 2){
                        alert(data.msg);
                        window.location.href =
                            "${pageContext.request.contextPath}/adminLogin";
                    }
                }
            },
            fail:function (msg) {
                alert(msg);
            }
        });
        return false;
    }
</script>

<script src="${pageContext.request.contextPath}../js/layui.js" type="text/javascript" charset="utf-8"></script>
<div class="loginbm">@酒店管理系统后台@</div>
</body>
</html>
