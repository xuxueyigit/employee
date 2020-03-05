<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/9
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2 style="text-align: center">添加员工信息</h2>
<br>
<form action="addEmp" method="post">
    <div style="text-align: center">
        <table border="1" cellspacing="0" width="50%">
            <tr>
                <td>姓名</td>
                <td>
                    <input type="text" name="ename">
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="esex" checked value="男">男
                    <input type="radio" name="esex" value="女">女
                </td>
            </tr>
            <tr>
                <td>入职日期</td>
                <td>
                    <input type="date" name="estartime">
                </td>
            </tr>
            <tr>
                <td>工资</td>
                <td>
                    <input type="text" name="epay">
                </td>
            </tr>
            <tr>
                <td>所属部门</td>
                <td>
                    <select name="did" id="did" >
                        <option value="">请选择</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="注册">
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
<script src="statics/jquery-1.9.1.min.js"></script>
<script>
    $(function () {
        $.post("showDept",null,function (data) {
            for(var i=0;i<data.length;i++){
                var option="<option value="+data[i].did+">"+data[i].dname+"</option>";
                $("#did").append(option);
            }
        },"json")
    })
</script>
</html>
