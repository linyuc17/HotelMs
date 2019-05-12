<%--
  Created by IntelliJ IDEA.
  User: zrb
  Date: 2018/12/19
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>登录界面</title>
</head>
<body>
<form action="success.jsp" method="post">
    用户名:<input type="text" name="username"><br>
    年 龄<input type="text" name="age"><br>
    密 码:<input type="password" name="password"><br>
    <!--在提交按钮对象当中进行按钮点击事件的添加操作，当点击提交按钮的时候，将会自动的触发check方法来将当前的表单对象
    作为参数来进行提交操作-->
    <!-- <input type="submit" value="提交" onclick="check(this.form)"> 当前代码标示点击之后触发check方法进行数据的
    校验操作但是不管成功或失败都会对表单对象当中的数据信息进行提交操作 -->
    <input type="submit" value="提交" onclick="return check(this.form)"><!--表单对象在提交之前调用check方法
来对表单对象当中的数据进行校验操作当校验无物时返回一个true此时将会对表单当中的数据进行提交，当数据校验失败时，返回
一个false将不会对表单对象当中的数据信息进行提交操作，等待用户的重新输入-->
</form>
<script type="text/javascript">
    String.prototype.trim=function()
    {/*对string对象当中所指定的方法进行重写操作,replace() 方法用于在字符串中用一些字符替换另一些字符，或替换一
个与正则表达式匹配的子串。*/
        return this.replace(/^\s+/,"").replace(/\s+$/,"");/*\s代表空白字符串，将其替换为空串^为开头$为结尾*/
    }
</script>
<script type="text/javascript">
    /*当表单对象提交之后将会调用当前的check方法来对表单当中的数据信息进行验证操作*/
    function check(form)
    {
        var errString="";//用户对错误的字符串信息进行填写操作
        /*对表单对象当中的属性参数值进行获取操作*/
        var username=form.username.value.trim();/* 通过表单对象来对当中的username里面的参数值进行获取，并对
参数值当中的空串进行过滤操作 */
        var password=form.password.value.trim();
        var age=form.age.value.trim();
        /*对用户名当中的数据进行校验操作*/
        if(username=="" || username==null)
        {
            errString="您必须要进行用户名的输入";
            alert(errString);
            return false;
        }
        else
        if(!/^\w{4,25}$/.test(username))
        {
            errString="\n您的用户名必须是数字或字母且在4到25为之间";
            alert(errString);
            return false;
        }
        /*对用户密码进行校验操作*/
        if(password=="" || password==null)
        {
            errString="\n你输入的密码为空";
            alert(errString);
            return false;
        }
        else
        if(!/^\w{4,25}$/.test(password))
        {
            errString="\n您所输入的密码必须是字母或数字，且长度在4到25位之间"
            alert(errString);
            return false;
        }
        if(age==null || age=="")
        {
            errString="年龄不能够为空";
            alert(errString);
            return false;
        }
        else
        if(!/^[0-1]?[0-9]?[0-9]$/.test(age))
        {
            errString="\n您所输入的年龄必须是整数，且必须是一个有效的年龄值"
            alert(errString);
            return false;
        }
        else/*表明没有错误的信息*/
            return true;
    }
</script>
</body>
</html>
