<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="style.css" />
<title>View Friends</title>
<link rel = "icon" href = "logo.png" type = "image/x-icon">
</head>
<body>

<div class="navbar">
	<a href="login.jsp"> <img class="img" src="logo.png" width="23" height="20" alt="logo" title="home"></a>
	<a href="home.jsp" title="home page">Home Page</a>
	<a href="#howtouse.jsp" title="how to use">How to Use</a>
	<a href="#aboutus.jsp" title="aboutus">About Us</a>
	<a href="#lol.jsp">\(★ω★)/</a>
</div>


<%!
Connection baglanti=null;
PreparedStatement ifade2=null;
int _userId;
%>

<%
try{
	_userId = Integer.parseInt(request.getParameter("userId"));
	try{
	Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
	out.println("JDBC Yüklenemedi!!!!!!!");
	}
	
	baglanti=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "My12?Sql");
	ifade2=baglanti.prepareStatement("Select userName,relationType From relationslist where userId=?");
	ifade2.setInt(1, _userId);
	
	ResultSet result = ifade2.executeQuery();
	out.println("<table style='border: 2px solid #222222'>");
	 while(result.next())
     {
     out.println(
         "<tr>"+
           "<td style='border: 2px solid #ffc000; padding: 5px;'>"+
           result.getString("userName")+
          "</td>"+
           "<td style='border: 2px solid #ffc000; padding: 5px;'>"+
           result.getString("relationType")+
           "</td>"+
         "</tr>"+
           "<br/>"
           );
     }out.println("</table>");
}
catch(SQLException e){
out.println(e);
}finally{
ifade2.close();
baglanti.close();
}
%>

</body>
</html>