package com.ygh.test.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ygh.test.pojo.Books;
import com.ygh.test.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Reference
    private BookService bookService;

    // 查询全部书籍，返回到一个书籍展示页面
    @RequestMapping("/allBook")
    public String list(ModelMap modelMap){
        List<Books> list = bookService.findAllBook();
        //System.out.println(list);
        modelMap.put("list", list);
        return "allBook";
    }

    // 跳转到增加书籍页面
    @RequestMapping("toAddBook")
    public  String toAddPaper(){
        return "addBook";
    }

    //  添加书籍的请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }

    // 跳转到修改页面
    @RequestMapping("/toUpdateBook")
    public String toUpdatePaper(int id,Model model){
        Books books = bookService.findBookById(id);
        model.addAttribute("QBook",books);
        return "updateBook";
    }

    // 修改书籍
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }

    // 删除书籍
    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }


}
