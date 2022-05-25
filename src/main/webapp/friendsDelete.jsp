<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%!
Connection baglanti=null;
PreparedStatement ifade3=null;
String _userName;

%>

<%
try{
	_userName = request.getParameter("userName");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
	out.println("JDBC Yüklenemedi!!!!!!!");
	}
	
	baglanti=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "My12?Sql");
	ifade3=baglanti.prepareStatement("Delete From relationslist where userName=?");
	ifade3.setString(1, _userName);
	ifade3.executeUpdate();
	out.println("Deleted Friend");
	
}

catch(SQLException e){
out.println(e);
}finally{
ifade3.close();
baglanti.close();
}

%>

</body>
</html>