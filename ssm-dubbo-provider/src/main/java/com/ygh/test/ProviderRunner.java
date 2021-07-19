package com.ygh.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;

// 服务提供者通过main方法启动
public class ProviderRunner {
    public static void main(String[] args) throws IOException {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        context.start();
        System.out.println("provider start");
        System.in.read();
    }
}
