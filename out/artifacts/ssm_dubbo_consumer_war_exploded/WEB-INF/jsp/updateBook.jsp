<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>
</head>
<body>
<h1>修改书籍</h1>
<form action="${pageContext.request.contextPath}/book/updateBook" method="post">
    <input type="hidden" name="bookID" value="${QBook.bookID}">
    <div>
        <label>书籍名称：</label>
        <input type="text" name="bookName" value="${QBook.bookName}">
    </div>
    <div>
        <label>书籍数量：</label>
        <input type="text" name="bookCounts" value="${QBook.bookCounts}">
    </div>
    <div>
        <label>书籍描述：</label>
        <input type="text" name="detail" value="${QBook.detail}">
    </div>
    <div>
        <input type="submit" value="修改">
    </div>
</form>
</body>
</html>
