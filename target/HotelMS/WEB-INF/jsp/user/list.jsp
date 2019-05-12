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
    <link rel="Bookmark" href="/favicon.ico">
    <link rel="Shortcut Icon" href="/favicon.ico">

    <script type="text/javascript" src="/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/lib/respond.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css">
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css">
    <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.8/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin">
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css">

    <script type="text/javascript" src="/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>

    <title>用户列表</title>
    <link rel="stylesheet"
          href="/lib/layer/2.4/skin/layer.css"
          id="layui_layer_skinlayercss" style="">
    <link href="/lib/My97DatePicker/4.8/skin/WdatePicker.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span
        class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont"></i></a></nav>
<div class="page-container">
    <div class="text-c">
        <input type="text" class="input-text" style="width:125px" placeholder="输入用户编号" id="userId"
               name="userId" value="${user.userId}">
        <input type="text" class="input-text" style="width:125px" placeholder="输入用户姓名" id="userName"
               name="userName" value="${user.userName}">
        <input type="text" class="input-text" style="width:125px" placeholder="输入身份证号" id="identityNumber"
               name="identityNumber" value="${user.identityNumber}">
        <input type="text" class="input-text" style="width:125px" placeholder="输入手机号码" id="userPhone"
               name="userPhone" value="${user.userPhone}">
        <button type="submit" class="btn btn-success" id="searchUser" name="searchUser" onclick="searchUser()">
            <i class="Hui-iconfont"></i> 搜用户
        </button>
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l">
        <a href="javascript:;" onclick="user_list_del()" class="btn btn-danger radius">
            <i class="Hui-iconfont"></i> 批量删除</a>
            <%--<a href="javascript:;" onclick="admin_add('添加用户','admin-add.html','800','500')"
               class="btn btn-primary radius">
                <i class="Hui-iconfont"></i> 添加用户</a>--%></span>
            <span class="r">共有数据：<strong>${page.totalRows}</strong> 条</span></div>
        <div class="mt-20">
            <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
                <div class="dataTables_length">
                    <label>显示 <select id="selectPageSize" name="selectPageSize"
                                      aria-controls="DataTables_Table_0" class="select">
                        <option value="5" name="pageSize" <c:if test="${page.pageSize==5}">selected</c:if>>5</option>
                        <option value="10" name="pageSize" <c:if test="${page.pageSize==10}">selected</c:if>>10</option>
                        <option value="20" name="pageSize" <c:if test="${page.pageSize==20}">selected</c:if>>20</option>
                        <option value="50" name="pageSize" <c:if test="${page.pageSize==50}">selected</c:if>>50</option>
                    </select> 条</label></div>
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr>
                        <th scope="col" colspan="7">用户列表</th>
                    </tr>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="allChecked" id="allChecked" onclick="doCheck()">
                        </th>
                        <th width="50">用户编号</th>
                        <th>用户姓名</th>
                        <th>用户性别</th>
                        <th>身份证号</th>
                        <th>电话号码</th>
                        <th>用户照片</th>
                        <th>用户状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr class="text-c">
                            <td><input type="checkbox" value="${user.userId}" name="deleteId" id="deleteId"></td>
                            <td width="10%">${user.userId}</td>
                            <td width="10%">${user.userName}</td>
                            <td width="5%"><c:if test="${user.userGender == 0}">
                                女
                            </c:if>
                                <c:if test="${user.userGender == 1}">
                                    男
                                </c:if>
                                <c:if test="${user.userGender != 1 && user.userGender!=0}">
                                    未知
                                </c:if>
                            </td>
                            <td width="15%">${user.identityNumber}</td>
                            <td width="15%">${user.userPhone}</td>
                            <td width="10%"><img src="/upload/user/${user.userPhoto}" width="60" height="50" alt="照片"></td>
                            <c:if test="${user.userStatus == 1}">
                                <td class="td-status"><span class="label label-success radius">已启用</span></td>
                                <td class="td-manage"><a style="text-decoration:none" onclick="user_stop(this,${user.userId})"
                                                     href="javascript:;" title="停用"><i class="Hui-iconfont"></i></a>
                            </c:if>
                            <c:if test="${user.userStatus != 1}">
                                <td class="td-status"><span class="label radius">已停用</span></td>

                            <td class="td-manage">
                                <a style="text-decoration:none" onclick="user_start(this,${user.userId})"
                                                     href="javascript:;" title="启用"><i class="Hui-iconfont"></i></a>
                            </c:if>
                                <a title="删除" href="javascript:;" onclick="user_del(this,${user.userId})"
                                   class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="dataTables_info" id="first" role="status" aria-live="polite">
                    第 ${page.page}/${page.totalPages}，共 ${page.totalPages} 页
                </div>
                <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                    <a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="0"
                       tabindex="0" id="DataTables_Table_0_previous" onclick="pageNo(1)">首页</a>
                    <c:if test="${page.page < 3}">
                        <c:if test="${page.totalPages>=1}">
                    <span><a class="paginate_button <c:if test="${page.page==1}">current</c:if>"
                             aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                             onclick="pageNo(1)">1</a></span></c:if>
                        <c:if test="${page.totalPages>=2}">
                    <span><a class="paginate_button <c:if test="${page.page==2}">current</c:if>"
                             aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                             onclick="pageNo(2)">2</a></span></c:if>
                        <c:if test="${page.totalPages>=3}">
                    <span><a class="paginate_button <c:if test="${page.page==3}">current</c:if>"
                             aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                             onclick="pageNo(3)">3</a></span></c:if>
                        <c:if test="${page.totalPages>=4}">
                    <span><a class="paginate_button"
                             aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                             onclick="pageNo(4)">4</a></span></c:if>
                        <c:if test="${page.totalPages>=5}">
                         <span><a class="paginate_button" aria-controls="DataTables_Table_0"
                                  data-dt-idx="1" tabindex="0" onclick="pageNo(5)">5</a></span>
                        </c:if>
                    </c:if>
                    <c:if test="${page.page >= 3 && page.page + 2 <= page.totalPages}">
                    <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                             tabindex="0" onclick="pageNo(${page.page-2})">${page.page-2}</a></span>
                        <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page-1})">${page.page-1}</a></span>
                        <span><a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page})">${page.page}</a></span>
                        <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page+1})">${page.page+1}</a></span>
                        <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page+2})">${page.page+2}</a></span>
                    </c:if>
                    <c:if test="${page.page + 2 > page.totalPages && page.totalPages > 3}">
                        <c:if test="${page.totalPages-4>0}">
                    <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                             tabindex="0" onclick="pageNo(${page.totalPages-4})">${page.totalPages-4}</a></span>
                        </c:if>
                        <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.totalPages-3})">${page.totalPages-3}</a></span>
                        <span><a class="paginate_button <c:if test="${page.page==page.totalPages-2}">current</c:if>"
                                 aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                 onclick="pageNo(${page.totalPages-2})">${page.totalPages-2}</a></span>
                        <span><a class="paginate_button <c:if test="${page.page==page.totalPages-1}">current</c:if>"
                                 aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                 onclick="pageNo(${page.totalPages-1})">${page.totalPages-1}</a></span>
                        <span><a class="paginate_button <c:if test="${page.page==page.totalPages}">current</c:if>"
                                 aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                 onclick="pageNo(${page.totalPages})">${page.totalPages}</a></span>
                    </c:if>
                    <a class="paginate_button next disabled " aria-controls="DataTables_Table_0" data-dt-idx="2"
                       tabindex="0"
                       id="end" onclick="pageNo(${page.totalPages})">末页</a>
                    <strong>第</strong><input type="text" class="input-text size-MINI" style="width: 1cm" id="jumpPageNo"
                                             value="" name="jumpPageNo"><strong>页</strong>
                    <a class="paginate_button next disabled " aria-controls="DataTables_Table_0" data-dt-idx="2"
                       tabindex="0"
                       id="jump" onclick="jumpPage()">跳转</a></div>
            </div>
        </div>
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
    /*
    参数解释：
    title 标题
    url 请求的url
    id 需要操作的数据id
    w 弹出层宽度（缺省调默认值）
    h 弹出层高度（缺省调默认值）
    */
    /*批量删除*/
    function user_list_del() {
        // 实例化存放需删除数据的数组
        var deleteIdList = [];
        // 获取选择的数据
        var selectedIdList = document.getElementsByName("deleteId");
        for (var i = 0; i < selectedIdList.length; i++) {
            if (selectedIdList[i].checked) {
                deleteIdList.push(selectedIdList[i])
            }
        }
        if (deleteIdList.length == 0) {
            alert("请选择要删除的数据！");
        } else {
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '/user/delete',
                data: deleteIdList,
                });
            location.reload(true);
        }

    }

    /*用户-增加*/
    function user_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-删除*/
    function user_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '/user/delete',
                dataType: 'json',
                data : {id:id.valueOf()},
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                    setTimeout("location.reload();",1000);
                },
            });
        });
    }

    /*用户-编辑*/
    function user_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-停用*/
    function user_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '/user/stop',
                data: {id:id.valueOf()},
            });
            $(obj).remove();
            layer.msg('已停用!', {icon: 5, time: 1000});
            setTimeout("location.reload();",1000);
        });
    }

    /*用户-启用*/
    function user_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '/user/start',
                data: {id:id.valueOf()},
            });
            $(obj).remove();
            layer.msg('已启用!', {icon: 6, time: 1000});
            setTimeout("location.reload();",1000);
        });
    }

    //checkbox 全选/取消全选
    function doCheck() {
        var ch = document.getElementsByName("deleteId");
        if (document.getElementsByName("allChecked")[0].checked == true) {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = true;
            }
        } else {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = false;
            }
        }
    }

    // 选择显示数据大小
    $(function () {
        $('#selectPageSize').on('change', function () {
            var selectPageSize = $('#selectPageSize option:selected');
            if (selectPageSize.val() == 5) {
                window.location = ("/user/list?pageSize=5");
            } else if (selectPageSize.val() == 10) {
                window.location = ("/user/list?pageSize=10");
            } else if (selectPageSize.val() == 20) {
                window.location = ("/user/list?pageSize=20");
            } else if (selectPageSize.val() == 50) {
                window.location = ("/user/list?pageSize=50");
            }
        })
    });

    // 选择页号跳转
    function pageNo(pageNo) {
        var pageSize = ${page.pageSize};
        var starRow = (pageNo - 1) *${page.pageSize};
        var pageNo = pageNo;
        var userId = document.getElementById("userId").value;
        var userName = document.getElementById("userName").value;
        var identityNumber = document.getElementById("identityNumber").value;
        var userPhone = document.getElementById("userPhone").value;
        window.location = ("/user/list?pageSize=" + pageSize +
            "&page=" + pageNo + "&starRow=" + starRow +
            "&userId=" + userId + "&userName=" + userName +
            "&identityNumber=" + identityNumber + "&userPhone=" + userPhone)
    }

    // 获取跳转的值
    function jumpPage() {
        var jumpPage = document.getElementById("jumpPageNo").value;
        if (jumpPage == null && jumpPage ==""){
            location.reload(true)
        }else {
            pageNo(jumpPage);
        }
    }

    // 查找用户
    function searchUser() {
        var pageSize = ${page.pageSize};
        var starRow = (${page.page} -1) *${page.pageSize};
        var userId = document.getElementById("userId").value;
        var userName = document.getElementById("userName").value;
        var identityNumber = document.getElementById("identityNumber").value;
        var userPhone = document.getElementById("userPhone").value;
        window.location = ("/user/list?pageSize=" + pageSize +
            "&starRow=" + starRow + "&userId=" + userId +
            "&userName=" + userName + "&identityNumber=" + identityNumber + "&userPhone=" + userPhone)
    }
</script>
</body>
</html>
