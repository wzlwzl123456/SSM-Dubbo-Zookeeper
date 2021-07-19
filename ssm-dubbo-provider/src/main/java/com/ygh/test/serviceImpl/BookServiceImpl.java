package com.ygh.test.serviceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.ygh.test.dao.BookMapper;
import com.ygh.test.pojo.Books;
import com.ygh.test.service.BookService;
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

    public Books findBookById(int id) {
        return bookMapper.findBookById(id);
    }

    public List<Books> findAllBook() {
        return bookMapper.findAllBook();
    }
}
