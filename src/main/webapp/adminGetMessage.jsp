<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet,java.sql.Statement"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%!
Connection baglanti=null;
PreparedStatement ifade=null;
String _userName,_sender,_groupId,_message_sendTime;
%>

<%
try{
	_userName=request.getParameter("userName");
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
	out.println("JDBC Yüklenemedi!!!!!!!");
	}
	
	baglanti=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "My12?Sql");
	ifade=baglanti.prepareStatement("SELECT sender,message FROM message WHERE userName = ?");
	ifade.setString(1, _userName);
	
	 ResultSet rs= ifade.executeQuery();
		
		while(rs.next())
		{
			
		out.println(
				"<tr>"+
					"<td>"+
						"<mark>"+rs.getString("sender")+"</mark>"+
					"</td>"+
					"<td>"+
						"<b>"+rs.getString("message")+"</b>"+
					"</td>"+
				"</tr>"+
				"<br/>"
			);
		}
		
	
	
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