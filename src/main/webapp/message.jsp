<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%!
Connection baglanti=null;
PreparedStatement ifade=null;
String _userName,_sender,_message,_sendTime;
int _groupId;

LocalDateTime date = LocalDateTime.now();
DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
String sendTime = date.format(formatDate);

%>

<%
try{
	_userName = request.getParameter("userName");
	_sender= (String)request.getSession().getAttribute("userName");
	_groupId = 0;
	_message = request.getParameter("message");
	_sendTime = sendTime;

	try{
	Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
	out.println("JDBC Yüklenemedi!!!!!!!");
	}
	
	baglanti=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "My12?Sql");
	ifade=baglanti.prepareStatement("insert into message(userName,sender,groupId,message,sendTime) values(?,?,?,?,?) ");
	ifade.setString(1, _userName);
	ifade.setString(2, _sender);
	ifade.setInt(3, _groupId);
	ifade.setString(4, _message);
	ifade.setString(5, _sendTime);
	ifade.executeUpdate();
}

catch(SQLException e){
out.println(e);
}

%>

</body>
</html>