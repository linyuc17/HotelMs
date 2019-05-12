<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c"> 日期范围：
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
        -
        <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
        <input type="text" class="input-text" style="width:250px" placeholder="输入员工名称" name="staff_name"  id="staff_name">
        <button class="btn btn-success" onclick="dim()"><i class="Hui-iconfont">&#xe665;</i> 搜员工</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','${pageContext.request.contextPath}/staffAdd','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有数据：<strong>${staffList.size()}</strong> 条</span> </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">ID</th>
                <th width="100">员工照片</th>
                <th width="100">员工名</th>
                <th width="40">性别</th>
                <th width="90">手机</th>
                <th width="150">身份证号</th>
                <th width="70">状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-c">
            <c:forEach items="${staffList}" var="staff" varStatus="st">
                <tr  bgcolor="#FFFFFF" class="text-c">
                    <td><input type="checkbox" name="staff" value="${staff.staff_id}"></td>
                    <td>${st.index+1}</td>
                    <td><img src="${pageContext.request.contextPath}/staffUpload/${staff.staff_photo}" width="44" height="44"></td>
                    <td>${staff.staff_name}</td>
                    <td>
                        <c:if test="${staff.staff_gender==9}">汉子</c:if>
                        <c:if test="${staff.staff_gender==0}">萌妹</c:if>
                    </td>
                    <td>${staff.staff_phone}</td>
                    <td>${staff.identity_number}</td>
                    <td class="td-status">
                    <span class="label label-success radius">
                    <c:if test="${staff.staff_gender==9}">已启用</c:if>
                    </span>
                    <c:if test="${staff.staff_gender==0}">未启用</c:if>
                    </td>
                    <td class="td-manage">
                        <a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用">
                            <i class="Hui-iconfont">&#xe631;</i>
                        </a>
                        <a title="编辑" href="/staffEdit/${staff.staff_id}" class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a title="删除" href="/StaffDelete/${staff.staff_id}" class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tr>
            <%--
            <tr class="text-c">
                <td><input type="checkbox" value="{staff_id}" name="staff_id"></td>
                <td>1</td>
                <td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">张三</u></td>
                <td>男</td>
                <td>13000000000</td>
                <td>admin@mail.com</td>
                <td class="text-l">北京市 海淀区</td>
                <td>2014-6-11 11:11:42</td>
                <td class="td-status"><span class="label label-success radius">已启用</span></td>
                <td class="td-manage"><a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="member_edit('编辑','member-add.html','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
            --%>
            </tbody>
        </table>
        <%--<table class="table table-border table-bordered table-hover table-bg table-sort">
            <tr items="${page}">
                <form method="GET" action="${pageContext.request.contextPath}/findByPage">
                    <td><input type="hidden" name="page" value="1"></td>
                    <td><input type="submit" value="首页"></td>
                </form>
                <form method="GET" action="${pageContext.request.contextPath}/findByPage">
                    <td><input type="hidden" name="page" value="${page.prefPage}"></td>
                    <td><input type="submit" value="上一页"></td>
                </form>
                <td>当前：第${page.currentPage}页<--></td>
                <td>共：${page.totalPages}页</td>
                <form method="GET" action="${pageContext.request.contextPath}/findByPage">
                    <td><input type="hidden" name="page" value="${page.nextPage}"></td>
                    <td><input type="submit" value="下一页"></td>
                </form>
                <form method="GET" action="${pageContext.request.contextPath}/findByPage">
                    <td><input type="hidden" name="page" value="${page.totalPages}"></td>
                    <td><input type="submit" value="尾页"></td>
                </form>
            </tr>
        </table>--%>
        <a href="${pageContext.request.contextPath}staffListByPage?pageNo=${pageNo=1}" class="btn btn-success radius">首页</a>
        <a href="${pageContext.request.contextPath}staffListByPage?pageNo=${pageNo-1}" class="btn btn-success radius">上一页</a>
        <a href="${pageContext.request.contextPath}staffListByPage?pageNo=${pageNo+1}" class="btn btn-success radius">下一页</a>
        <a href="${pageContext.request.contextPath}staffListByPage?pageNo=${totalPage}" class="btn btn-success radius">尾页</a>

    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function(){
        $('.table-sort').dataTable({
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
            ]
        });

    });
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*模糊查询*/
    function dim() {
        var condition = document.getElementById("staff_name").value;
        window.location.href="/findsByDim/"+condition;
        alert("您输入的名字为" + condition)
    }

    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-停用*/
    /*function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                    $(obj).remove();
                    layer.msg('已停用!',{icon: 5,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }*/

    /*用户-启用*/
    /*function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }*/
    /*用户-编辑*/
    function member_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*密码-修改*/
    function change_password(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>
