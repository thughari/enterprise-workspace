<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,
                    org.hibernate.*,
                    org.hibernate.cfg.Configuration,
                    com.wipro.velocity.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Collection Mapping</title>
</head>
<body>
	<h1>Hibernate Collection Mapping Demo Using XML Configuration</h1>

	<%
Session sess = new Configuration().configure("hibernate.cfg.xml")
.buildSessionFactory().openSession();
Transaction t = sess.beginTransaction();

Employee employee = new Employee();
employee.setEmployeeId(1006);
employee.setEmployeeName("Gavin King");

Set<String> phoneNumbers = new HashSet<String>();
phoneNumbers.add("99582");
phoneNumbers.add("63048");
//phoneNumbers.add("25805");

employee.setPhoneNumbers(phoneNumbers);

sess.save(employee);
t.commit();
sess.close();
out.println("<br>"+"success");
%>
</body>
</html>