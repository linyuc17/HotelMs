<%--
  Created by IntelliJ IDEA.
  User: zrb
  Date: 2018/12/23
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css">
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css">
    <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.8/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin">
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css">
    <!--[if IE 6]>
    <script type="text/javascript" src="/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>用户密码修改</title>
    <link rel="stylesheet"
          href="/lib/layer/2.4/skin/layer.css"
          id="layui_layer_skinlayercss">
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-user-add" novalidate="novalidate"
          method="post" action="/user/changePassword" enctype="multipart/form-data">
        <input type="hidden" id="userId" name="userId" value="${USER.userId}">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>原密码：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="password" class="input-text error" autocomplete="off" value="" placeholder="请输入原密码"
                       id="userPassword0" name="userPassword0" aria-required="true">
                <label id="userPassword0-error" class="error" for="userPassword0">这是必填字段</label>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="password" class="input-text error" autocomplete="off" value="" placeholder="请输入原密码"
                       id="userPassword1" name="userPassword1" aria-required="true">
                <label id="userPassword1-error" class="error" for="userPassword1">这是必填字段</label>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="password" class="input-text error" autocomplete="off" placeholder="确认新密码"
                       id="userPassword2" name="userPassword2" aria-required="true">
                <label id="userPassword2-error" class="error" for="userPassword2">这是必填字段</label>
            </div>
        </div>
        <div class="col-xs-4 col-sm-6 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-user-add").validate({
            rules: {
                userPassword0: {
                    required: true,
                },
                userPassword1: {
                    required: true,
                },
                userPassword2: {
                    required: true,
                    equalTo: "#userPassword1"
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post',
                    url: "/user/changePassword",
                    success: function (data) {
                        if (data == 1){
                            layer.msg('修改成功!', {icon: 1, time: 1000});
                            setTimeout("window.location=('/hotel/index');",1000);
                        }else {
                            layer.msg('修改失败，请重试!', {icon: 2, time: 1000});
                            setTimeout("location.reload();",1000);
                        }
                    }
                });
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

