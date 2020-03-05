<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/9
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2 style="text-align: center">修改员工信息</h2>
<br>
<form action="updateEmp" method="post">
    <div style="text-align: center">
        <table border="1" cellspacing="0" width="50%">
            <input type="hidden" name="eid" value="${emp.eid}">
            <tr>
                <td>姓名</td>
                <td>
                    <input type="text" name="ename" value="${emp.ename}">
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="esex" ${emp.esex=="男"?"checked":""} value="男">男
                    <input type="radio" name="esex" ${emp.esex=="女"?"checked":""} value="女">女
                </td>
            </tr>
            <tr>
                <td>入职日期</td>
                <td>
                    <input type="date" name="estartime"
                           value="<fmt:formatDate value="${emp.estartime}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                </td>
            </tr>
            <tr>
                <td>工资</td>
                <td>
                    <input type="text" name="epay" value="${emp.epay}">
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
                    <input type="submit" value="修改">
                </td>
            </tr>
        </table>
    </div>
</form>
<script src="statics/jquery-1.9.1.min.js"></script>
<script>
    $(function () {
        $.post("showDept",null,function (data) {
            for(var i=0;i<data.length;i++){
                var option="<option value="+data[i].did+">"+data[i].dname+"</option>";
                $("#did").append(option);

                //设置选中项
                $("#did").val(${emp.did});
            }
        },"json")
    })
</script>
</body>
</html>
