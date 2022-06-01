<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,
                    org.hibernate.*,
                    org.hibernate.cfg.Configuration,
                    com.wipro.velocity.Student,
                    com.wipro.velocity.StudentClass" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Component Mapping</title>
</head>
<body>
<h1>Component Mapping Demo</h1>
<%
Session sess = new Configuration().configure("hibernate.cfg.xml")
.buildSessionFactory().openSession();
Transaction t = sess.beginTransaction();

StudentClass studentClass = new StudentClass("ECE2","BE3");
Student student = new Student("Hari", "Babu","BE3/12/30", 15, studentClass);
sess.save(student); //saved as Persistent object
out.println("Data Saved Successfully");
t.commit();
%>
</body>
</html>