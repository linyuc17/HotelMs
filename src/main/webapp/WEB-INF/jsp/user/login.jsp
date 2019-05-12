<%--
  Created by IntelliJ IDEA.
  User: zrb
  Date: 2018/12/19
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;
charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>用户登录</title>
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        <c:if test="${msg != null}">
        alert("${msg}");
        </c:if>
    </script>
</head>
<body>

<section class="material-half-bg">
    <div class="cover"></div>
</section>
<section class="login-content">
    <div class="logo">
        <h1>Rose Hotel</h1>
    </div>
    <div class="login-box">
        <form class="login-form" action="/user/toIndex" method="post">
            <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>用户登录</h3>
            <div class="form-group">
                <label class="control-label">用户名</label>
                <input name="loginUserId" id="id" class="form-control" type="text" placeholder="用户名" autofocus>
            </div>
            <div class="form-group">
                <label class="control-label">密码</label>
                <input name="loginUserPwd" id="password" class="form-control" type="password" placeholder="密码">
            </div>
            <div class="form-group">
                <div class="utility">
                    <input name="verifyCodeActual" class="form-control col-md-6" type="text" placeholder="验证码"
                           autofocus>
                    <img id="captcha_img" alt="点击更换" title="点击更换"
                         onclick="refresh()" src="/kaptcha"/>
                </div>
            </div>
            <div class="form-group">
                <div class="utility">
                        <p class="semibold-text mb-2"><a href="/user/regiest">没有账号？点我注册！</a></p>
                    <p class="semibold-text mb-2"><a href="#" data-toggle="flip">忘记密码？</a></p>
                </div>
            </div>
            <div class="form-group btn-container">
                <button class="btn btn-primary btn-block" onclick="return check1(this.form)"><i
                        class="fa fa-sign-in fa-lg fa-fw"></i>登录
                </button>
            </div>
        </form>
        <form class="forget-form" action="/user/resetPassword">
            <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>找回密码</h3>
            <div class="form-group">
                <label class="control-label">用户名</label>
                <input name="loginUserId" id="id_forget1" class="form-control" type="text" placeholder="用户名">
            </div>
            <div class="form-group">
                <label class="control-label">身份证号</label>
                <input name="loginUserPwd" id="id_forget2" class="form-control" type="text" placeholder="请输入该用户所绑定的身份证号">
            </div>
            <div class="form-group btn-container">
                <button class="btn btn-primary btn-block" onclick="return check2(this.form)"><i
                        class="fa fa-sign-in fa-lg fa-fw"></i>重置密码</button>
            </div>
            <div class="form-group mt-3">
                <p class="semibold-text mb-0"><a href="#" data-toggle="flip">
                    <i class="fa fa-angle-left fa-fw"></i> 返回</a></p>
            </div>
        </form>
    </div>
</section>
<!-- Essential javascripts for application to work-->
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="/js/plugins/pace.min.js"></script>
<script type="text/javascript">
    // Login Page Flipbox control
    $('.login-content [data-toggle="flip"]').click(function () {
        $('.login-box').toggleClass('flipped');
        return false;
    });

    function refresh() {
        document.getElementById('captcha_img').src = "/kaptcha";
    }
</script>
<script type="text/javascript">
    String.prototype.trim = function () {/*对string对象当中所指定的方法进行重写操作,replace() 方法用于在字符串中用一些字符替换另一些字符，或替换一
个与正则表达式匹配的子串。*/
        return this.replace(/^\s+/, "").replace(/\s+$/, "");
        /*\s代表空白字符串，将其替换为空串^为开头$为结尾*/
        /*\w表示匹配匹配包括下划线的任何单词字符*/
    }
</script>
<script type="text/javascript">
    /*当表单对象提交之后将会调用当前的check方法来对表单当中的数据信息进行验证操作*/
    function check2(form) {
        var errString = "";//用户对错误的字符串信息进行填写操作
        /*对表单对象当中的属性参数值进行获取操作*/
        var loginUserId = form.loginUserId.value.trim();
        /* 通过表单对象来对当中的username里面的参数值进行获取，并对参数值当中的空串进行过滤操作 */
        var loginUserPwd = form.loginUserPwd.value.trim();
        /*对用户名当中的数据进行校验操作*/
        if (loginUserId === "" || loginUserId == null) {
            errString = "用户名不能为空";
            alert(errString);
            return false;
        }
        else if (!/^[A-Za-z0-9]{5,12}$/.test(loginUserId)) {
            errString = "\n用户名必须是数字或字母且在5到12为之间";
            alert(errString);
            return false;
        }
        /*对身份证号进行校验操作*/
        if (loginUserPwd === "" || loginUserPwd == null) {
            errString = "\n身份证号不能为空";
            alert(errString);
            return false;
        }
        else if (!/^[A-Za-z0-9]{18,18}$/.test(loginUserPwd)) {
            errString = "\n身份证号是字母或数字且大小为18位"
            alert(errString);
            return false;
        }
        else/*表明没有错误的信息*/
            return true;
    }
</script>
<script type="text/javascript">
    /*当表单对象提交之后将会调用当前的check方法来对表单当中的数据信息进行验证操作*/
    function check1(form) {
        var errString = "";//用户对错误的字符串信息进行填写操作
        /*对表单对象当中的属性参数值进行获取操作*/
        var username = form.loginUserId.value.trim();
        /* 通过表单对象来对当中的username里面的参数值进行获取，并对参数值当中的空串进行过滤操作 */
        var password = form.loginUserPwd.value.trim();
        var captcha = form.verifyCodeActual.value.trim();
        /*对用户名当中的数据进行校验操作*/
        if (username === "" || username == null) {
            errString = "用户名不能为空";
            alert(errString);
            return false;
        }
        else if (!/^[A-Za-z0-9]{5,10}$/.test(username)) {
            errString = "\n用户名必须是数字或字母且在5到25为之间";
            alert(errString);
            return false;
        }
        /*对用户密码进行校验操作*/
        if (password === "" || password == null) {
            errString = "\n密码不能为空";
            alert(errString);
            return false;
        }
        else if (!/^[\w]*$/.test(password)) {
            errString = "\n密码必须是字母或数字或下划线"
            alert(errString);
            return false;
        }
        if (captcha == null || captcha === "") {
            errString = "验证码不能为空";
            alert(errString);
            return false;
        }
        else if (!/^[1-9]\d|0*$/.test(captcha)) {
            errString = "\n验证码必须是整数";
            alert(errString);
            return false;
        }
        else/*表明没有错误的信息*/
            return true;
    }
</script>
</body>
</html>

