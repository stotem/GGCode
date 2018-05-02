# GGCode
源代码生成器，通过对数据表和数据列的元数据分析, 生成项目源代码。
## 基础框架
源代码生成框架: [rapid-framework](https://code.google.com/archive/p/rapid-framework/)

UI框架: [sb-admin-2](https://startbootstrap.com/template-overviews/sb-admin-2/)

代码框架: SpringMVC + mybatis + Velocity。

代码架构: 经典三层架构(MVC), 增加rpc模块做为调用三方api模块, 增加manager模块设置为缓存层与事务层。

主要转换规则:

1. 数据表与数据列的注释做为UI展示title。
2. 数据列的为空性、数据长度和是否可为空等属性转换为javax.validation的判断规则。
3. 数据列的数据类型转换为实体对象属性的数据类型。

## 集成功能
1. 增加shiro做为权限管理框架。
2. 为文档数据存储添加MongoDB支持。
3. 为缓存增加Redis支持, 且自动配置Spring Cache为Redis缓存。
4. 以Velocity做为页面模板语言。
5. 增加javax.validation为服务端验证框架。且Controller自动验证传入参数。
6. 采用bonecp对数据库连接池化管理。
7. spring的响应数据采用多视图配置。

## 如何使用?
* 默认支持mariadb与mysql数据库环境下运行，在bin目录中通过配置generator.xml后直接`java -jar GGCode-0.0.1.jar`
* 当在使用其它类型的数据库运行时，需要import相应的数据库驱动jar。
主要操作方法有两个:
    * fork源码在pom.xml中增加数据库驱动依赖，重新打包再以`jar -jar GGCode-xxx.jar`运行
    * 将驱动包下载到GGCode-xxx.jar同级目录，使用`java -cp GGCode-xxx.jar:[driver.jar] App`运行(windows则使用`java -cp GGCode-xxx.jar;[driver.jar] App`运行)

## generator.xml配置说明
详见generator.xml注释

## 数据库设计要求
为了规范生成的Code，针对数据表的设计，需要满足每张表包含以下字段，请使用者遵守：
```
id bigint PRIMARY KEY COMMENT '数据主键(与业务主键区分)',
del_flag tinyint(1) DEFAULT 1 COMMENT '数据删除标识(1: 有效，2: 失效)',
created_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP '数据创建时间',
updated_time timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后update时间',
created_by varchar(50) DEFAULT NULL COMMENT '数据创建者',
updated_by varchar(50) DEFAULT NULL COMMENT '数据最近更新者',
version int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
```
## 其它说明
1. controller的访问URI不带后缀.
2. 所有的页面文件后缀为view.

## 生成后程序截图
![](http://www.wujianjun.org/images/list.png)

![](http://www.wujianjun.org/images/add.png)

![](http://www.wujianjun.org/images/update.png)

![](http://www.wujianjun.org/images/show.png)

![](http://www.wujianjun.org/images/delete.png)
