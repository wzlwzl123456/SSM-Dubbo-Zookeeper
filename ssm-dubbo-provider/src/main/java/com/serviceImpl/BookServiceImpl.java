package com.serviceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.dao.BookMapper;
import com.pojo.Books;
import com.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Service
@Component
public class BookServiceImpl implements BookService {
    // service调dao层
    @Autowired
    private BookMapper bookMapper;

    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    public List<Books> fuzzyQuery(String bookName) {
        return bookMapper.fuzzyQuery(bookName);
    }
}