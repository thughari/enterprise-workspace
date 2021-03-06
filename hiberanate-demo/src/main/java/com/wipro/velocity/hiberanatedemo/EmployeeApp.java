package com.wipro.velocity.hiberanatedemo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate Application to save Employee object to Database.
 *
 */
public class EmployeeApp 
{
    public static void main( String[] args )
    {
    	Configuration cfg=new Configuration();  
        cfg.configure("hibernate.cfg.xml");  
        SessionFactory sf=cfg.buildSessionFactory();  
        Session session=sf.openSession();   // Physical Connection with db

        
        Transaction t=session.beginTransaction();
        
        Employee e1 = new Employee(); 	//Create transient object of Employee
        e1.setFirstName("Pawan");
        e1.setLastName("Kalyan");
        
        session.save(e1);	//persist Employee object
        t.commit();
        System.out.println("Data successfully saved to Database");
        session.close();
        sf.close();
    }
}
