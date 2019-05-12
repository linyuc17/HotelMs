<%--
  Created by IntelliJ IDEA.
  User: zrb
  Date: 2018/12/23
  Time: 22:38
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

    <title>订单列表</title>
    <link rel="stylesheet"
          href="/lib/layer/2.4/skin/layer.css"
          id="layui_layer_skinlayercss" style="">
    <link href="/lib/My97DatePicker/4.8/skin/WdatePicker.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 预定管理 <span
        class="c-gray en">&gt;</span> 订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont"></i></a></nav>
<div class="page-container">
    <div class="text-c">
        日期范围：
        <input type="text" value="${order.startDate}"
               onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
        -<input type="text" value="${order.endDate}"
                onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
        <input type="text" class="input-text" style="width:125px" placeholder="输入订单编号" id="orderId"
               name="orderId" value="${order.orderId}">
        <input type="text" class="input-text" style="width:125px" placeholder="输入用户编号" id="userId"
               name="userId" value="${order.userId}">
        <input type="text" class="input-text" style="width:125px" placeholder="输入房间编号" id="roomId"
               name="roomId" value="${order.roomId}">
        <input type="text" class="input-text" style="width:125px" placeholder="输入处理员编号" id="adminId"
               name="adminId" value="${order.adminId}">
        <button type="submit" class="btn btn-success" id="searchOrder" name="searchOrder" onclick="searchOrder()">
            <i class="Hui-iconfont"></i> 查找订单
        </button>
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l">
        <a href="javascript:;" onclick="order_list_del()" class="btn btn-danger radius">
            <i class="Hui-iconfont"></i> 批量删除</a>
        </span>
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
                <div class="dataTables_length">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

                <div class="dataTables_length">
                    <label>选择订单状态 <select id="selectOrderStatus" name="selectOrderStatus" style="width:70px;"
                                          aria-controls="DataTables_Table_0" class="select">
                        <option>请选择</option>
                        <option value="0" name="orderStatus" <c:if test="${order.orderStatus==0}">selected</c:if>>待处理
                        </option>
                        <option value="1" name="orderStatus" <c:if test="${order.orderStatus==1}">selected</c:if>>已处理
                        </option>
                    </select></label></div>

                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr>
                        <th scope="col" colspan="9">订单列表</th>
                    </tr>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="allChecked" id="allChecked" onclick="doCheck()">
                        </th>
                        <th width="50">订单编号</th>
                        <th>用户编号</th>
                        <th>房间编号</th>
                        <th>房间类型</th>
                        <th>订单日期</th>
                        <th>订单状态</th>
                        <th>处理人编号</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr class="text-c">
                            <td><input type="checkbox" value="${order.orderId}" name="deleteId" id="deleteId"></td>
                            <td width="12%">${order.orderId}</td>
                            <td width="12%">${order.userId}</td>
                            <td width="12%">${order.roomId}</td>
                            <td width="15%">
                                <c:if test="${order.roomType == 1}">
                                    单人经济房
                                </c:if>
                                <c:if test="${order.roomType == 2}">
                                    双人标准房
                                </c:if>
                                <c:if test="${order.roomType == 3}">
                                    商务豪华房
                                </c:if>
                            </td>
                            <td width="19%">${order.orderDate}</td>
                            <c:if test="${order.orderStatus == 1}">
                                <td width="10%" class="td-status"><span class="label label-success radius">已处理</span>
                                </td>
                            </c:if>
                            <c:if test="${order.orderStatus != 1}">
                                <td width="10%" class="td-status"><span class="label radius">等待处理</span></td>
                            </c:if>
                            <td>${order.adminId}</td>
                            <td width="8%" class="td-manage">
                                <c:if test="${order.orderStatus != 1}">
                                    <a style="text-decoration:none" onclick="order_start(this,${order.orderId})"
                                       href="javascript:;" title="启用"><i class="Hui-iconfont"></i></a></c:if>
                                <a title="删除" href="javascript:;" onclick="order_del(this,${order.orderId})"
                                   class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--分页--%>
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
                    <span><a class="paginate_button <c:if test="${page.page==4}">current</c:if>"
                             aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                             onclick="pageNo(4)">4</a></span></c:if>
                        <c:if test="${page.totalPages>=5}">
                    <span><a class="paginate_button <c:if test="${page.page==5}">current</c:if>"
                             aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                             onclick="pageNo(5)">5</a></span></c:if>

                    </c:if>
                    <c:if test="${page.page >= 3 && (page.page + 2 <= 5 || page.page + 2 <= page.totalPages)}">
                    <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                             tabindex="0" onclick="pageNo(${page.page-2})">${page.page-2}</a></span>
                        <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page-1})">${page.page-1}</a></span>
                        <span><a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page})">${page.page}</a></span>
                        <c:if test="${page.totalPages>=4}">
                        <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page+1})">${page.page+1}</a></span></c:if>
                        <c:if test="${page.totalPages>=5}">
                        <span><a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="1"
                                 tabindex="0" onclick="pageNo(${page.page+2})">${page.page+2}</a></span></c:if>
                    </c:if>
                    <c:if test="${page.page ==4 && page.totalPages == 4}">
                        <span><a class="paginate_button " <c:if test="${page.page==1}">current</c:if>"
                                 aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                 onclick="pageNo(1)">1</a></span>
                        <span><a class="paginate_button <c:if test="${page.page==2}">current</c:if>"
                                 aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                 onclick="pageNo(2)">2</a></span>
                        <span><a class="paginate_button <c:if test="${page.page==3}">current</c:if>"
                                 aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                 onclick="pageNo(3)">3</a></span>
                        <span><a class="paginate_button <c:if test="${page.page==4}">current</c:if>"
                                 aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0"
                                 onclick="pageNo(4)">4</a></span>
                    </c:if>
                    <c:if test="${page.page + 2 > page.totalPages && page.totalPages >= 5}">
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
            <%--分页--%>
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
    /*批量删除*/
    function order_list_del() {
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
                url: '/order/delete',
                data: deleteIdList,
            });
            layer.msg('删除成功!', {icon: 1, time: 1000});
            setTimeout("location.reload();", 1000);
        }

    }

    /*订单-删除*/
    function order_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '/order/delete',
                dataType: 'json',
                data: {roomId: id.valueOf(),},
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                    setTimeout("location.reload();", 1000);
                },
            });
        });
    }

    /*订单处理-确认*/
    function order_start(obj, id) {
        layer.confirm('要确认订单吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '/order/start',
                data: {id: id.valueOf()},
            });
            $(obj).remove();
            layer.msg('订单已确认!', {icon: 6, time: 1000});
            setTimeout("location.reload();", 1000);
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
            var starRow = (${page.page} -1) *${page.pageSize};
            var pageNo = ${page.page};
            var orderId = document.getElementById("orderId").value;
            var userId = document.getElementById("userId").value;
            var roomId = document.getElementById("roomId").value;
            var adminId = document.getElementById("adminId").value;
            var orderStatus = <c:if test="${order.orderStatus==null}">""</c:if>
                <c:if test="${order.orderStatus!=null}">${order.orderStatus}</c:if>;
            var startDate = document.getElementById("datemin").value;
            var endDate = document.getElementById("datemax").value;
            if (selectPageSize.val() == 5) {
                window.location = ("/order/list?pageSize=5&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
                    "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId
                    + "&orderStatus=" + orderStatus + "&startDate="
                    + startDate + "&endDate=" +endDate);
            } else if (selectPageSize.val() == 10) {
                window.location = ("/order/list?pageSize=10&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
                    "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId
                    + "&orderStatus=" + orderStatus + "&startDate="
                    + startDate + "&endDate=" +endDate);
            } else if (selectPageSize.val() == 20) {
                window.location = ("/order/list?pageSize=20&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
                    "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId
                    + "&orderStatus=" + orderStatus + "&startDate="
                    + startDate + "&endDate=" +endDate);
            } else if (selectPageSize.val() == 50) {
                window.location = ("/order/list?pageSize=50&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
                    "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId
                    + "&orderStatus=" + orderStatus + "&startDate="
                    + startDate + "&endDate=" +endDate);
            }
        })
    });
    // 选择订单处理状态
    $(function () {
        $('#selectOrderStatus').on('change', function () {
            var selectOrderStatus = $('#selectOrderStatus option:selected');
            var pageSize = ${page.pageSize};
            var starRow = (${page.page} -1) *${page.pageSize};
            var pageNo = ${page.page};
            var orderId = document.getElementById("orderId").value;
            var userId = document.getElementById("userId").value;
            var roomId = document.getElementById("roomId").value;
            var adminId = document.getElementById("adminId").value;
            var startDate = document.getElementById("datemin").value;
            var endDate = document.getElementById("datemax").value;
            if (selectOrderStatus.val() == 1) {
                window.location = ("/order/list?orderStatus=1&pageSize=" + pageSize +
                    "&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
                    "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId + "&startDate="
                    + startDate + "&endDate=" +endDate);
            } else if (selectOrderStatus.val() == 0) {
                window.location = ("/order/list?orderStatus=0&pageSize=" + pageSize +
                    "&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
                    "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId  + "&startDate="
                    + startDate + "&endDate=" +endDate);
            } else {
                window.location = ("/order/list?pageSize=" + pageSize +
                    "&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
                    "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId  + "&startDate="
                    + startDate + "&endDate=" +endDate);
            }
        })
    });

    // 选择页号跳转
    function pageNo(pageNo) {
        var pageSize = ${page.pageSize};
        var starRow = (pageNo - 1) *${page.pageSize};
        var pageNo = pageNo;
        var orderId = document.getElementById("orderId").value;
        var userId = document.getElementById("userId").value;
        var roomId = document.getElementById("roomId").value;
        var adminId = document.getElementById("adminId").value;
        var orderStatus = <c:if test="${order.orderStatus==null}">""</c:if>
            <c:if test="${order.orderStatus!=null}">${order.orderStatus}</c:if>;
        var startDate = document.getElementById("datemin").value;
        var endDate = document.getElementById("datemax").value;
        window.location = ("/order/list?pageSize=" + pageSize +
            "&page=" + pageNo + "&starRow=" + starRow + "&orderId = " + orderId +
            "&userId=" + userId + "&roomId=" + roomId + "&adminId=" + adminId
            + "&orderStatus=" + orderStatus + "&startDate="
            + startDate + "&endDate=" +endDate)
    }

    // 获取跳转的值
    function jumpPage() {
        var jumpPage = document.getElementById("jumpPageNo").value;
        if (jumpPage == null && jumpPage == "") {
            location.reload(true)
        } else {
            pageNo(jumpPage);
        }
    }

    // 查找订单信息
    function searchOrder() {
        var pageSize = ${page.pageSize};
        var starRow = (${page.page} -1) *${page.pageSize};
        var orderId = document.getElementById("orderId").value;
        var userId = document.getElementById("userId").value;
        var roomId = document.getElementById("roomId").value;
        var adminId = document.getElementById("adminId").value;
        var orderStatus = <c:if test="${order.orderStatus==null}">""</c:if>
            <c:if test="${order.orderStatus!=null}">${order.orderStatus}</c:if>;
        var startDate = document.getElementById("datemin").value;
        var endDate = document.getElementById("datemax").value;
        window.location = ("/order/list?pageSize=" + pageSize +
            "&starRow=" + starRow + "&orderId=" + orderId +
            "&userId=" + userId + "&roomId=" + roomId + "&adminId="
            + adminId + "&orderStatus=" + orderStatus + "&startDate="
            + startDate + "&endDate=" +endDate)
    }
</script>
</body>
</html>
