<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    //将json数据装入table容器
    function append_json(data, tableId) {
        var table = document.getElementById(tableId);
        var child;
        while ((child = table.firstChild)) {
            child.remove();
        }
        for (var i = 0; i < data.length; i++) {
            var tr = document.createElement('tr');
            tr.style.display = 'flex'
            tr.innerHTML = '<td style="width: 10%;border: 1px solid black">' + data[i].bookID + '</td>' +
                '<td style="width: 30%;border: 1px solid black">' + data[i].bookName + '</td>' +
                '<td style="width: 10%;border: 1px solid black">' + data[i].bookCounts + '</td>' +
                '<td style="width: 50%;border: 1px solid black">' + data[i].detail + '</td>';
            table.appendChild(tr);
        }
        initTable()
    }

    //查询所有书籍
    function get() {
        $.ajax({
            type: "POST",
            url: "/book/allBook",
            data: {},
            success: function (data) {
                // console.log(data)
                append_json(data, "gable")
                alert("查询成功")
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("查询失败")
            }
        });
    }

    //模糊查询
    function fuzzyQuery() {
        if (!$("#nameInput").val()) {
            alert("信息不完整,需要Name")
        } else {
            $.ajax({
                type: "POST",
                url: "/book/fuzzyQueryBook",
                data: {
                    "bookName": $("#nameInput").val(),
                },
                success: function (data) {
                    append_json(data, "gable")
                    alert("模糊查询成功")
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("模糊查询失败")
                }
            });
        }
    }

    //新增一本书
    function add() {
        if (!$("#nameInput").val() || !$("#countInput").val() || !$("#detailInput").val()) {
            alert("信息不完整,需要Name、Count、Detail")
        } else {
            $.ajax({
                type: "POST",
                url: "/book/addBook",
                data: {
                    "name": $("#nameInput").val(),
                    "count": $("#countInput").val(),
                    "detail": $("#detailInput").val()
                },
                success: function (data) {
                    get()
                    alert(data)
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("增加失败")
                }
            });
        }
    }

    function del() {
        if (!$("#idInput").val()) {
            alert("信息不完整，需要ID")
        } else {

            $.ajax({
                type: "POST",
                url: "/book/deleteBook",
                data: {
                    "idList": $("#idInput").val()
                },
                success: function (data) {
                    get()
                    alert(data)
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("删除失败")
                }
            });
        }
    }

    // //删除一本书
    // function del() {
    //     if (!$("#idInput").val()) {
    //         alert("信息不完整，需要ID")
    //     } else {
    //         var delIdString = $("#idInput").val();
    //         var delIdList = delIdString.split(",");
    //         for (var i = 0; i < delIdList.length; i++) {
    //             if (isNaN(delIdList[i])) {
    //                 alert("格式不正确:" + delIdList[i]);
    //                 break;
    //             }
    //             $.ajax({
    //                 type: "POST",
    //                 url: "/book/deleteBook",
    //                 data: {
    //                     "id": delIdList[i]
    //                 },
    //                 success: function (data) {
    //                     get()
    //                     alert(data)
    //                 },
    //                 error: function (jqXHR, textStatus, errorThrown) {
    //                     alert("删除失败")
    //                 }
    //             });
    //         }
    //     }
    // }
    //更新一本书
    function update() {
        if (!$("#idInput").val() || !$("#nameInput").val() || !$("#countInput").val() || !$("#detailInput").val()) {
            alert("信息不完整,需要ID、Name、Count、Detail")
        } else {
            $.ajax({
                type: "POST",
                url: "/book/updateBook",
                data: {
                    "id": $("#idInput").val(),
                    "name": $("#nameInput").val(),
                    "count": $("#countInput").val(),
                    "detail": $("#detailInput").val()
                },
                success: function (data) {
                    get()
                    alert(data)
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("更新失败")
                }
            });
        }
    }

    //查询一本书
    function query() {
        if (!$("#idInput").val()) {
            alert("信息不完整，需要ID")
        } else {
            $.ajax({
                type: "POST",
                url: "/book/queryBook",
                data: {
                    "id": $("#idInput").val(),
                },
                success: function (data) {
                    alert(data)
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("查询失败")
                }
            });
        }
    }
</script>
<script>
    var pageSize = 3;
    var currentPage = 0;
    var len;
    var page;

    function initTable() {
        len = $("#gable tr").length
        console.log(len)
        page = len % pageSize == 0 ? len / pageSize : Math.floor(len / pageSize) + 1;
        console.log(page)
        currentPage = 1
        displayPage()
    }

    function frontPage() {
        if (currentPage == 1) {
            alert("first page")
        } else {
            currentPage -= 1
        }
        displayPage()
    }

    function nextPage() {
        if (currentPage == page) {
            alert("final page")
        } else {
            currentPage += 1
        }
        displayPage()
    }

    function displayPage() {
        $("#gable tr").hide()
        $("#gable tr").each(function (i) {
            console.log(i)
            if (i >= (currentPage - 1) * pageSize && i <= (currentPage - 1) * pageSize + 2) {
                $(this).show()
            }
        })
    }
</script>
<style>
    html, body {
        width: 100%;
        height: 100%;
    }

    .layout {
        width: 100%;
        height: 100%;
        display: flex;
    }

    .aside {
        width: 20%;
        height: 100%;
        overflow-y: auto;
        background-color: #0099ff;
        text-align: center;
    }

    .article {
        flex: 1;
        height: 100%;
        overflow-y: auto;
        text-align: center;
    }

    .buttonClass {
        margin: 10%;
    }
</style>
<body>
<div class="layout">
    <div class="aside">
        <div>输入书籍信息：</div>
        <div>ID</div>
        <input id="idInput" style="width: 80%">
        <div>bookName</div>
        <input id="nameInput" style="width: 80%">
        <div>Count</div>
        <input id="countInput" style="width: 80%">
        <div>Detail</div>
        <textarea id="detailInput" style="width: 80%;height: 100px"></textarea>
        <div class="buttonClass">
            <button id="add" onclick="add()">增加</button>
            <button id="del" onclick="del()">删除</button>
            <button id="update" onclick="update()">更新</button>
            <button id="fuzzy" onclick="fuzzyQuery()">查询</button>
        </div>
        <div>操作要求：</div>
        <div>增加：需要bookName</div>
        <div>删除：需要ID，支持批量以,号分隔</div>
        <div>更新：需要ID、bookName、Count、Detail</div>
        <div>查询：需要bookName，支持模糊查询</div>

    </div>
    <div class="article">
        <button onclick="frontPage()">上一页</button>
        <button onclick="nextPage()">下一页</button>
        <button id="get" onclick="get()">查全部</button>
        <h3>结果：</h3>
        <div style="display: inline-block;width: 80%;position:center;">
            <div style="display: flex;background-color: lightblue">
                <div style="width: 10%;border: 1px solid black">ID</div>
                <div style="width: 30%;border: 1px solid black">Name</div>
                <div style="width: 10%;border: 1px solid black">Count</div>
                <div style="width: 50%;border: 1px solid black">Detail</div>
            </div>
            <table id="gable" style="background-color: lightgray;display: inline-block;width: 100%">
                <tr style="width: 100%;display: inline-block">
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>