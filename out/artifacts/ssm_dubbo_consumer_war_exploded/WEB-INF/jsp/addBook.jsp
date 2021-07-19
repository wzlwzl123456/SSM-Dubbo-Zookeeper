<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增书籍</title>
</head>
<body>
<h1>新增书籍</h1>
<form action="${pageContext.request.contextPath}/book/addBook" method="post">
    <div>
        <label>书籍名称：</label>
        <input type="text" name="bookName">
    </div>
    <div>
        <label>书籍数量：</label>
        <input type="text" name="bookCounts">
    </div>
    <div>
        <label>书籍描述：</label>
        <input type="text" name="detail">
    </div>
    <div>
        <input type="submit" value="添加">
    </div>
</form>
</body>
</html>
