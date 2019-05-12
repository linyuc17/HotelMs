<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2018/12/16
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
    <title>客房管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 房间管理 <span class="c-gray en">&gt;</span> 房间列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form action="${pageContext.request.contextPath}/roomList">
    <div class="text-c">
        <span class="select-box inline">
		<label>显示
        <select class="" id="roomType1" name="rows">
            <option value="" name="rows" >${rows}</option>
            <option value="5" name="rows" >5</option>
            <option value="10" name="rows" >10</option>
            <option value="20" name="rows" >20</option>
        </select>条</label>
		</span>
        <span class="select-box inline">
		<label for="roomType">房间类型</label>
        <select class="" id="roomType" name="roomType">
            <option value="">全部类型</option>
            <c:forEach items="${typeType}" var="item">
                <option value="${item.dict_id}" <c:if test="${item.dict_id == roomType}"> selected</c:if>>
                        ${item.dict_item_name}
                </option>
            </c:forEach>
        </select>
		</span>
        <span class="select-box inline">
        <label for="roomStatus">房间状态</label>
        <select class="" id="roomStatus" name="roomStatus">
            <option value="">全部状态</option>
            <c:forEach items="${statusType}" var="item">
                <option value="${item.dict_id}" <c:if test="${item.dict_id == roomStatus}"> selected</c:if>>
                        ${item.dict_item_name}
                </option>
            </c:forEach>
        </select>
        </span>
        <label for="roomName"></label>
        <input type="text" id="roomName" value="${roomNumber}" placeholder=" 房间编号" name="roomNumber" style="width:250px" class="input-text">
        <button class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
    </div>
    </form>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l"><%--<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
        <i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>--%>
        <a href="/addRoom" class="btn btn-primary radius" data-title="添加房间"  ><i class="Hui-iconfont">&#xe600;</i> 添加房间</a></span>
        <span class="r">共有房间：<strong>${count}</strong> 间</span> </div>
    <div class="mt-20">
        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
        <form action="${pageContext.request.contextPath}/deleteCustomers" method="post">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="allChecked" id="allChecked" onclick="doCheck()"></th>
                <th width="100">序号</th>
                <th width="100">编号</th>
                <th>客房类型</th>
                <th>客房状态</th>
                <th width="150">价格</th>
                <th width="200">照片</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ro" items="${page.rows}" varStatus="st" begin="0" step="1">
                <tr class="text-c"
                    <%--<c:if test="${st.count%2==0}">bgcolor="#6495ED"</c:if>
                    <c:if test="${st.count%2==1}">bgcolor="#B0C4DE"</c:if>--%>>

                    <td><input type="checkbox" id="ids" name="ids" value="${ro.id}"></td>
                    <td>${st.count}</td>
                    <td>${ro.room_number}</td>
                    <td>${ro.room_type}</td>
                    <td>${ro.room_status}</td>
                    <td>${ro.room_price}</td>
                    <td><img src="${ro.room_photo}" width="160" height="50"></td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration:none" href="/editRoom?id=${ro.id}"><i class="Hui-iconfont" style="font-size:20px">&#xe6df;</i>&nbsp;&nbsp;</a>
                    </td>
                        <%--<td><a href="${pageContext.request.contextPath}/editCustomer/${st.count}">修改</a> </td>--%>
                        <%--<td><c:if test="${ro.gender == 0}">女</c:if><c:if test="${ro.gender == 1}">男</c:if></td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span class="l">
                <input type="submit" id="delete" value="批量删除" class="btn btn-danger radius"></span></div>
        </form>
        <div class="dataTables_info" id="first" role="status" aria-live="polite">
        </div>
        <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
            <% session.setAttribute("value",2); %>
            <itheima:page url="${pageContext.request.contextPath}/roomList"/>
        </div>
        </div>
    </div>
</div>

<script>
    function doCheck() {
        var ch = document.getElementsByName("ids");
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
</script>
</body>
</html>
