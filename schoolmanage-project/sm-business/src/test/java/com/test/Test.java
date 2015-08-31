package com.test;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test
{
    
    /**
     * @param args
     */
    public static void main(String[] args)
    {
        //测试2个数据源加载
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath*:META-INF/spring.xml");
        System.out.println(applicationContext);
        SessionFactory sessionFactory =(SessionFactory)applicationContext.getBean("sessionFactory");
        System.out.println(sessionFactory);
    }
    
}
