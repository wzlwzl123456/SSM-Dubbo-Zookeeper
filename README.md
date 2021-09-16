# ssm+dubbo+zookeeper简单项目

#### 介绍
在一个SSM项目基础上，引入dubbo和zookeeper。将controller层与service层dao层进行了拆分，使双方通过service接口远程调用的形式，实现了基本的增删改查。
interface为接口，provider为服务提供者，consumer为消费者。


#### 使用说明

1.  先启动zookeeper
2.  再启动服务提供者，通过ProviderRunner（main方法）启动
3.  最后启动消费者，通过配置的Tomcat启动。
4.  可以通过启动dubbo-admin，实现服务站和消费者的监控。
