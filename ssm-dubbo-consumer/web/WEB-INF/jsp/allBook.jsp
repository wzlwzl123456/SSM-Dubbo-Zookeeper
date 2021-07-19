<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
</head>
<body>
<h1>书籍展示</h1>
<div>
    <a href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
</div>
<div>
    <table>
        <thead>
        <tr>
            <th>书籍编号</th>
            <th>书籍名称</th>
            <th>书籍数量</th>
            <th>书籍详情</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody>
            <c:forEach var="book" items="${list}">
                <tr>
                    <td>${book.bookID}</td>
                    <td>${book.bookName}</td>
                    <td>${book.bookCounts}</td>
                    <td>${book.detail}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.bookID}">修改</a>
                        |
                        <a href="${pageContext.request.contextPath}/book/deleteBook/${book.bookID}">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
