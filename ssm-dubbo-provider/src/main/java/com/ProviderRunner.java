package com;


import java.io.IOException;

// 服务提供者通过main方法启动
public class ProviderRunner {
    public static void main(String[] args) throws IOException {
        com.alibaba.dubbo.container.Main.main(args);
        System.out.println("provider start");
        System.in.read();
    }
}