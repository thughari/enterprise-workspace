<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="org.hibernate.query.Query,
                    org.hibernate.*,
                    org.hibernate.cfg.Configuration,
                    com.wipro.velocity.User,
                    java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HQL</title>
</head>
<body>
	<h1>HQL - Hibernate Query Language</h1>
	<h2>HQL Select Query</h2>
	<%
    Configuration cfg = new Configuration();
    cfg.configure("hibernate.cfg.xml");
    SessionFactory factory = cfg.buildSessionFactory();
    Session sess= factory.openSession();
    sess.beginTransaction();
    
    Query<User> qry=sess.createQuery("from User");
    
    List<User> lst    =(List<User>)qry.list();
   
    out.println("<h3>List of Employees:</h3>"+"<br>");
    for(User st:lst)
    {
        out.println(st.getId()+" "+st.getName()+" "+st.getEmail()+"<br>");
    }
    %>
</body>
</html>