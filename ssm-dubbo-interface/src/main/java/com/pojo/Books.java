package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Books implements Serializable {
    private int bookID;     // 书籍编号
    private String bookName;    // 书籍名称
    private int bookCounts;     // 书籍数量
    private String detail;      // 书籍描述
}