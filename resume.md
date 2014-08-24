曲东方
===============

基本信息
---------

1. 性别: 男
1. 年龄: 27
1. 邮箱: qudongfang@gmail.com
1. 手机: 18511158693
1. weibo: [http://weibo.com/castomer](http://weibo.com/castomer)
1. github: [https://github.com/castomer](https://github.com/castomer)

教育经历
---------

1. 2005.09 -- 2009.06 河南城建学院 地理信息系统 本科
1. 2010.09 -- 2013.06 南京师范大学 地图学与地理信息系统 硕士

项目经验
---------------

* [百度推广网络医生](http://wlys.baidu.com/)

    - 时间：2013.06 -- 2013.09
    - 语言：Visual C++
    - 作用：修复因网络导致的用户访问百度商业服务异常的问题
    - 工作内容：独立完成2.0版本之前的设计、研发、测试、上线

* [fluent-plugin-kafka](https://github.com/castomer/fluent-plugin-kafka)

    - 时间：2013.09 -- 2013.12
    - 语言：ruby
    - 作用：日志数据采集与发送
    - 工作内容：
        1. 通过zookeeper解决fluentd和kafka机器列表强耦合问题
        1. 增加fluent-plugin-kafka对kafka 0.8的支持

* Aqueducts-web(github私有项目)

    - 时间：2013.09 -- 2014.02
    - 语言：rails, coffescript
    - 作用：项目平台主页，包含用户管理、计算项管理、用户计算任务提交、计算结果动态图表、计算结果restful api接口
    - 工作内容：
        1. 增加计算结果动态图表功能
        1. 参与用户管理功能开发工作
        1. 计算结果restful api接口V3版本的开发

* [aqueducts-tools](https://github.com/castomer/aqueducts-tools)

    - 时间：2013.10 -- 至今
    - 语言：ruby、bash、C
    - 作用：一些小工具
    - 工作内容：
        1. kafka集群机器变更后，partition迁移工具
        1. log产生工具，控制log产生速率，模拟线上压力 
        1. elasticsearch集群过期数据清理工具

* AStream(github私有项目)

    - 时间：2013.11 -- 2014.02
    - 语言：java
    - 作用：strom计算任务topology
    - 工作内容：
        1. 对基础计算bolt进行抽象、重构设计，每种bolt的实现只需关注setup、teardown、calculate三个方法
        1. 提出并实现toplogy的动态构建架构，各个storm应用使用相同的topology代码，在提交storm计算任务时时根据json配置动态构建toplogy

* [aqueducts-dashboard](https://github.com/castomer/aqueducts-dashboard)

    - 时间：2013.12
    - 语言：ruby
    - 作用：项目关键指标dashboard，实时显示线上集群状态和流量趋势图
    - 工作内容：
        1. kafka集群流量
        1. zookeeper集群状态
        1. strom计算topology状态
        1. elasticsearch集群状态
        1. restful api响应时间
        1. 平台接入的服务总数

* [logstash](https://github.com/castomer/logstash/tree/aqueducts) & [logstash-kafka](https://github.com/castomer/logstash-kafka/tree/aqueducts)

    - 时间：2013.12 -- 至今
    - 语言：jruby
    - 作用：日志数据采集与发送
    - 工作内容： 
        1. 解决官方版本logstash对底层系统lib的依赖，将其移植到公司操作系统版本rhel 4.3上
        1. 解决当日志量大时，logstash发送日志延迟问题
        1. 增加[jruby-kafka](https://github.com/castomer/jruby-kafka)对官方kafka client的配置参数支持
        1. GC优化,降低数据发送延迟

* [kafka](https://github.com/castomer/kafka/tree/add_timestamp)

    - 时间：2014.02
    - 语言：scala
    - 工作内容：增加kafka将message持久化到硬盘时的时间戳，方便定位数据延迟

* [aqueducts-collector](https://github.com/castomer/aqueducts-collector)

    - 时间：2014.06 -- 2014.07
    - 语言：nodejs、golang、C
    - 作用：统一的log接收模块，提供丰富的数据接入方式，使agent和后端kafka解耦
    - 工作内容：
        1. nodejs实现http接口
        1. nodejs实现raw udp、raw tcp接口
        1. nodejs实现relp接口
        1. golang实现relp接口
        1. golang实现raw tcp接口
        1. 根据idc、topic进行流量调度功能

兴趣爱好
---------

1. 定位和解决问题
1. 跑步
