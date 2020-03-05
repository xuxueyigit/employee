<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/9
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="showEmp" method="post" id="form1" name="form1">
    <input type="hidden" id="setPage" name="page" value="1">
    姓名:
    <input type="text" name="ename" value="${condition.ename}">
    入职日期:
    <input type="date" name="startime" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${condition.startime}" ></fmt:formatDate>" >
     - <input type="date" name="endtime" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${condition.endtime}" ></fmt:formatDate>" >
    部门名称:
    <select name="did" id="did" >
        <option value="">请选择</option>
    </select>
    <input type="submit" value="查询">
    <button><a href="addEmp.jsp">添加员工</a></button>
</form>
<table border="1" cellspacing="0" width="100%">
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>入职日期</td>
        <td>工资</td>
        <td>部门名称</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${pageInfo.list}" var="e">
        <tr>
            <td>${e.eid}</td>
            <td>${e.ename}</td>
            <td>${e.esex}</td>
            <td>
                <fmt:formatDate value="${e.estartime}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
            <td>${e.epay}</td>
            <td>${e.dname}</td>
            <td>
                <a href="getSomeEmp?eid=${e.eid}">修改</a> &nbsp;&nbsp;&nbsp;
                <a href="javascript:if(confirm('确定删除吗')){location.href='deleteEmp?eid=${e.eid}'}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<div>
    共${pageInfo.total}条记录 ${pageInfo.pageNum}/${pageInfo.pages}
    <div style="text-align: center">
        <a href="javascript:go(1)">首页</a>
        <a href="javascript:go(${pageInfo.prePage==0?1:pageInfo.prePage})">上一页</a>
        <a href="javascript:go(${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage})">下一页</a>
        <a href="javascript:go(${pageInfo.pages})">尾页</a>
    </div>
</div>
<script src="statics/jquery-1.9.1.min.js"></script>
<script>
    function go(page) {
        $("#setPage").val(page);
        $("#form1").submit();
    }

    //加载所有部门
    $(function () {
        $.post("showDept",null,function (data) {
            for(var i=0;i<data.length;i++){
                var option="<option value="+data[i].did+">"+data[i].dname+"</option>";
                $("#did").append(option);

                //设置选中项
                $("#did").val(${condition.did})
            }
        },"json")
    })
</script>
</body>
</html>
