package com.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Books;
import com.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/book")
public class BookController {

    @Reference
    private BookService bookService;

    //查询所有书籍返回json
    @RequestMapping(path = "/allBook", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getBookList() {
        List<Books> booksList = this.bookService.queryAllBook();
        System.out.println(booksList);
        return JSONObject.toJSONString(booksList);
    }

    //增加一本书籍
    @RequestMapping(path = "/addBook", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addBook(String name, int count, String detail) {
        Books book = new Books(0, name, count, detail);
        System.out.println(book);
        this.bookService.addBook(book);
        return "新增书完成";
    }

    //删除一本书籍
    @RequestMapping(path = "/deleteBook", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteBook(String idList) {
        String[] delId = idList.split(",");
        String sucRes = "成功删除：";
        String faiRes = "失败删除：";

        List<Books> booksList = this.bookService.queryAllBook();
        List<Integer> bookIdList = booksList.stream().map(Books::getBookID).collect(Collectors.toList());
        for (int i = 0; i < delId.length; i++) {
            if (bookIdList.contains(Integer.parseInt(delId[i]))) {
                this.bookService.deleteBookById(Integer.parseInt(delId[i]));
                sucRes = sucRes + delId[i] + ",";
            } else {
                faiRes = faiRes + delId[i] + ",";
            }
        }
        return sucRes + faiRes;

    }

    //更新一本书籍
    @RequestMapping(path = "/updateBook", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String updateBook(int id, String name, int count, String detail) {
        Books book = new Books(id, name, count, detail);
        System.out.println(book);
        List<Books> booksList = this.bookService.queryAllBook();
        List<Integer> bookIdList = booksList.stream().map(Books::getBookID).collect(Collectors.toList());
        if (bookIdList.contains(id)) {
            this.bookService.updateBook(book);
            return "更新完成";
        } else {
            return "这本书不存在";
        }
    }

    //精确查询一本书籍，通过id
    @RequestMapping(path = "/queryBook", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String queryBook(int id) {
        List<Books> booksList = this.bookService.queryAllBook();
        List<Integer> bookIdList = booksList.stream().map(Books::getBookID).collect(Collectors.toList());
        if (bookIdList.contains(id)) {
            return this.bookService.queryBookById(id).toString();
        } else {
            return "这本书不存在";
        }
    }

    //模糊查询一本数据，通过bookName
    @RequestMapping(path = "/fuzzyQueryBook", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String fuzzyQueryBookList(String bookName) {
        List<Books> booksList = this.bookService.fuzzyQuery(bookName);
        return JSONObject.toJSONString(booksList);
    }
}