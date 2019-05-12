<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2018/11/29
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Date date = new Date();
    SimpleDateFormat sdf = (SimpleDateFormat) DateFormat.getDateTimeInstance();
    String da = sdf.format(date);
    pageContext.setAttribute("da", da);
%>
<div  style="color:#6495ED" class="page-container">
    <h1>欢迎进入酒店预订官网！</h1>
    <h3>${USER.userName}</h3>
    <a href="${pageContext.request.contextPath}/logout"></a>
    <h5>&nbsp;</h5>
    <h3>Now time:&nbsp;&nbsp;${da}</h3>
    <div id="Clock" style='position:absolute;bottom:0px'><h4>版权所属;&nbsp;&nbsp;_aaaacl</h4></div>
</div>
</body>
</html>