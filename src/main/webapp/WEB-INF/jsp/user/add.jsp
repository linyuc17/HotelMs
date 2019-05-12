<%--
  Created by IntelliJ IDEA.
  User: zrb
  Date: 2018/12/22
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>用户注册</title>
    <link rel="stylesheet"
          href="/lib/layer/2.4/skin/layer.css"
          id="layui_layer_skinlayercss">
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-user-add" novalidate="novalidate"
          method="post" action="/user/add" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="text" class="input-text error" value="" placeholder="" id="userId" name="userId"
                       aria-required="true" aria-invalid="true">
                <label id="userId-error" class="error"
                       for="userId"
                       style="display: block;">这是必填字段</label>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="password" class="input-text error" autocomplete="off" value="" placeholder="密码"
                       id="userPassword" name="userPassword" aria-required="true">
                <label id="userPassword-error" class="error" for="userPassword">这是必填字段</label>
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
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户姓名：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="text" class="input-text error" autocomplete="off" id="userName"
                       name="userName" aria-required="true">
                <label id="userName-error" class="error" for="userName">这是必填字段</label>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="text" class="input-text error" autocomplete="off" id="identityNumber"
                       name="identityNumber" aria-required="true">
                <label id="identityNumber-error" class="error" for="identityNumber">这是必填字段</label>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机号码：</label>
            <div class="formControls col-xs-4 col-sm-6">
                <input type="text" class="input-text error" autocomplete="off" id="userPhone"
                       name="userPhone" aria-required="true">
                <label id="userPhone-error" class="error" for="userPhone">这是必填字段</label>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-4 col-sm-6 skin-minimal">
                <label class="radio-box">
                    <input style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"
                           type="radio" id="userGender-1" name="userGender" class="valid" value="1">男
                </label>
                <label class="radio-box">
                    <input style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"
                           type="radio" id="userGender-2" name="userGender" class="valid" value="0">女
                </label>
            </div>
        </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">用户头像：</label>
            <div class="formControls col-xs-8 col-sm-9">
<span class="btn-upload form-group">
<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly="" nullmsg="请添加附件！" style="width:200px">
<a href="javascript:;" class="btn btn-primary radius upload-btn">
<i class="Hui-iconfont"></i> 浏览文件
</a>
<input type="file" multiple="multiple" name="uploadPhoto" id="uploadPhoto" class="input-file">
</span>
            </div>
        </div>
        <input type="hidden" value="1" name="userStatus" id="userStatus">
        <div class="col-xs-4 col-sm-6 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
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
                userId: {
                    required: true,
                    minlength: 5,
                    maxlength: 25
                },
                userPassword: {
                    required: true,
                },
                userPassword2: {
                    required: true,
                    equalTo: "#userPassword"
                },
                userName:{
                    required: true,
                    minlength: 2,
                    maxlength: 20,
                },
                identityNumber:{
                    required: true,
                    minlength: 18,
                    maxlength: 18,
                },
                userGender: {
                    required: true,
                },
                userPhone: {
                    required: true,
                    minlength: 11,
                    maxlength: 11,
                    isPhone: true,
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post',
                    url: "/user/add",
                    success: function (data) {
                        if (data == 1){
                            layer.msg('注册成功!', {icon: 1, time: 1000});
                            setTimeout("window.location=('/user/login');",1000);
                        }else {
                            layer.msg('注册失败，请重试!', {icon: 6, time: 1000});
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