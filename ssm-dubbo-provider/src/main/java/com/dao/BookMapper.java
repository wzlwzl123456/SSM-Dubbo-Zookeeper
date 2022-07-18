package com.dao;


import com.pojo.Books;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface BookMapper {
    //增加一个Book
    int addBook(Books book);

    //根据id删除一个Book
    int deleteBookById(int id);

    //更新Book
    int updateBook(Books books);

    //根据id查询,返回一个Book
    Books queryBookById(int id);

    //查询全部Book,返回list集合
    List<Books> queryAllBook();

    //根据bookName模糊查询，返回list集合
    List<Books> fuzzyQuery(String bookName);
}