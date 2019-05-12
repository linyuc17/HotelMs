<%--
  Created by IntelliJ IDEA.
  User: zrb
  Date: 2018/12/24
  Time: 9:12
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

    <title>个人订单</title>
    <link rel="stylesheet"
          href="/lib/layer/2.4/skin/layer.css"
          id="layui_layer_skinlayercss" style="">
    <link href="/lib/My97DatePicker/4.8/skin/WdatePicker.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 预定管理 <span
        class="c-gray en">&gt;</span> 我的订单 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont"></i></a></nav>
<div class="page-container">
    <div class="text-c">
        <div class="cl pd-5 bg-1 bk-gray mt-20">
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
                    </select> 条</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <div class="dataTables_length">
                    <label>选择订单状态 <select id="selectOrderStatus" name="selectOrderStatus" style="width:70px;"
                                          aria-controls="DataTables_Table_0" class="select">
                        <option>请选择</option>
                        <option value="0" name="orderStatus" <c:if test="${order.orderStatus==0}">selected</c:if>>处理中
                        </option>
                        <option value="1" name="orderStatus" <c:if test="${order.orderStatus==1}">selected</c:if>>已处理
                        </option>
                    </select></label></div>
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr>
                        <th scope="col" colspan="7">订单列表</th>
                    </tr>
                    <tr class="text-c">
                        <th>订单编号</th>
                        <th >房间编号</th>
                        <th>房间类型</th>
                        <th>订单日期</th>
                        <th>订单状态</th>
                        <th>处理的管理员编号</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${userOrderList}">
                        <tr class="text-c">
                            <td width="13%">${order.orderId}</td>
                            <td width="13%">${order.roomId}</td>
                            <td width="17%">
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
                            <td width="20%">${order.orderDate}</td>
                            <c:if test="${order.orderStatus == 1}">
                                <td class="td-status"><span class="label label-success radius">已处理</span></td>
                            </c:if>
                            <c:if test="${order.orderStatus != 1}">
                                <td class="td-status"><span class="label radius">等待处理</span></td></c:if>
                            <td width="15%">${order.adminId}</td>
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

    // 选择显示数据大小
    $(function () {
        $('#selectPageSize').on('change', function () {
            var selectPageSize = $('#selectPageSize option:selected');
            var orderStatus = <c:if test="${order.orderStatus==null}">""</c:if>
                <c:if test="${order.orderStatus!=null}">${order.orderStatus}</c:if>;
            if (selectPageSize.val() == 5) {
                window.location = ("/order/userOrder?pageSize=5"
                    + "&orderStatus=" + orderStatus);
            } else if (selectPageSize.val() == 10) {
                window.location = ("/order/userOrder?pageSize=10"
                    + "&orderStatus=" + orderStatus);
            } else if (selectPageSize.val() == 20) {
                window.location = ("/order/userOrder?pageSize=20"
                    + "&orderStatus=" + orderStatus);
            } else if (selectPageSize.val() == 50) {
                window.location = ("/order/userOrder?pageSize=50"
                    + "&orderStatus=" + orderStatus);
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
            if (selectOrderStatus.val() == 1) {
                window.location = ("/order/userOrder?orderStatus=1&pageSize=" + pageSize +
                    "&page=" + pageNo + "&starRow=" + starRow);
            } else if (selectOrderStatus.val() == 0) {
                window.location = ("/order/userOrder?orderStatus=0&pageSize=" + pageSize +
                    "&page=" + pageNo + "&starRow=" + starRow);
            } else {
                window.location = ("/order/userOrder?pageSize=" + pageSize +
                    "&page=" + pageNo + "&starRow=" + starRow);
            }
        })
    });

    // 选择页号跳转
    function pageNo(pageNo) {
        var pageSize = ${page.pageSize};
        var starRow = (pageNo - 1) *${page.pageSize};
        var pageNo = pageNo;
        var orderStatus = <c:if test="${order.orderStatus==null}">""</c:if>
            <c:if test="${order.orderStatus!=null}">${order.orderStatus}</c:if>;
        window.location = ("/order/userOrder?pageSize=" + pageSize +
            "&page=" + pageNo + "&starRow=" + starRow +"&orderStatus="+orderStatus)
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
</script>
</body>
</html>
