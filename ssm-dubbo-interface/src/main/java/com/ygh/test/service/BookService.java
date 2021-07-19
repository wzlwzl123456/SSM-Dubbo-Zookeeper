package com.ygh.test.service;

import com.ygh.test.pojo.Books;

import java.util.List;


public interface BookService {
    // 增加一本书
    int addBook(Books books);

    // 删除一本书
    int deleteBookById(int id);

    // 更新一本书
    int updateBook(Books books);

    // 查询一本书
    Books findBookById(int id);

    // 查询全部的书
    List<Books> findAllBook();
}
