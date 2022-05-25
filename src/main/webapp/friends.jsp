<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%!
Connection baglanti=null;
PreparedStatement ifade=null;
String _userName,_relationType;
int _userId;
%>

<%
try{
	_userId = Integer.parseInt(request.getParameter("userId"));
	_userName=request.getParameter("userName");
	_relationType = request.getParameter("relationType");

	try{
	Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
	out.println("JDBC Yüklenemedi!!!!!!!");
	}
	
	baglanti=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "My12?Sql");
	ifade=baglanti.prepareStatement("insert into relationslist(userId,userName,relationType) values(?,?,?) ");
	ifade.setInt(1, _userId);
	ifade.setString(2, _userName);
	ifade.setString(3, _relationType);
	ifade.executeUpdate();
	
}

catch(SQLException e){
out.println(e);
}finally{
ifade.close();
baglanti.close();
}

%>

</body>
</html>