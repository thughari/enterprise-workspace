package com.wipro.velocity.hiberanatedemo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class StudentApp {

	public static void main(String[] args) {
		
		Configuration cfg=new Configuration();  
        cfg.configure("hibernate.cfg.xml");  
        SessionFactory sf=cfg.buildSessionFactory();  
        Session session=sf.openSession();   // Physical Connection with db
        
        Transaction t=session.beginTransaction();
        
        Student s1=new Student();
        
        s1.setName("Pawan");
        s1.setBranch("Mechanical");
        s1.setMarks(90);
        
        session.save(s1);
        t.commit();
        System.out.println("Student details successfully saved to database");
        session.close();
        sf.close();

	}

}
