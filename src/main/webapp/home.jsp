<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException,java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet,java.sql.Statement"%>

<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="Homestyle.css" />
    <title>Home Page</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
  </head>

  <body style="background-image: url('bg.jpg');" >
<div class="container">
	<div class="sidebar-left">
		<div class="flex"><div class="logo"><img class="img" src="logo.png" width="23" height="20" alt="logo" title="home"></div>
			<a class="logo-expand"> Chicky Chat</a></div>
			<div class="side-wrapper">
				<!--  <div class="side-title">MENU</div>-->
				<div class="side-menu">
					<a class="sidebar-link main-chat is-active" href="#">Main Chat</a>
					<a class="sidebar-link chat-2" href="#">Chat-2</a>
					
					<div id="friendsBox">
        <label class="label"><b>Add to friends</b></label>
        <form action='friends.jsp' method='post'>

          <input type="hidden" name="userId" value="${member.userID}" />
          <input type="text" placeholder="AddFriend" name="userName" />
			<div class="flex">
          <input type="checkbox" name="relationType" value="friend">Friend
          <input type="checkbox" name="relationType" value="dear">Dear
          <input type="checkbox" name="relationType" value="flirt">Flirt
          </div>
          <button id="addfriends">Add</button>
        </form>
      </div>
      

<div id="friendsDelete">
			<form action='friendsDelete.jsp' method='post'>
				<input type="text" placeholder="DeleteFriend" name="userName" />
				<button id="deletefriends">Delete</button>
			</form>
     	</div> <!-- end of friendDelete -->
	    <div id="friendsView">
      <form action='friendsView.jsp' method='post'>
        <input type="hidden" name="userId" value="${member.userID}" />
        <button>Friends List</button>
      </form>
    </div> <!-- end of friendsView -->
	
	
    <div id="messageView">
      <label class="label"><b>Email box</b></label>
      <table>

        <%
						try
						{
						
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "My12?Sql");
						String sql = "SELECT sender,message FROM message WHERE userName = ?";
						PreparedStatement statement = conn.prepareStatement(sql);
				        statement.setString(1, (String)request.getSession().getAttribute("userName"));
				        ResultSet rs=statement.executeQuery();
					
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
								"</tr>"
								
							);
						}
						
						}catch(Exception e)
						{
						System.err.println(e);
						}
						%>
      </table>
    </div> <!-- end of messageview -->
	

				</div> <!-- end of side-menu -->
			</div> <!-- end of side-wrapper -->

	</div> <!-- end of sidebar-left -->









    <div id="main-container">
      <div id="menu">

        <p class="welcome">${member.userName}</p>
        <%
	            	if(session.getAttribute("privelege").equals("1") || session.getAttribute("privelege").equals("2")){
	            		%>
        <a href="admin">For Admins</a>
        <%
	            	}
                %>


        <p class="logout"><a id="exit" href="logout">Exit Chat</a></p>
      </div> <!-- end of menu -->

      <div id="chatbox"></div>

      <div>
        <input id="usermsg" type="text" name="usermsg" />
        <input id="submitmsg" type="submit" name="submitmsg" onclick="sendMessage()" value="Send" />
      </div>
    </div> <!-- end of main-container -->

<div class="sidebar-right">
						 <div id="messageBox">
        <label class="label"><b>Send message</b></label>
        <form action='message.jsp' method='post'>
          <input type="text" placeholder="UserName" name="userName" />
          <input type="text" placeholder="Message" name="message" />
          <button id="btnsendmsg">Send</button>
        </form>
      </div> 
      <!-- end of messagebox -->
					
					
    <div id="memberBox">
      <label class="label"><b>Site members</b></label>
      <table>

        <%
						try
						{
							
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/arkadasaramasitesidb", "root", "My12?Sql");
						String query="Select userID,userName From member";
						Statement stmt=conn.createStatement();
						ResultSet rs=stmt.executeQuery(query);
						
						while(rs.next())
						{
						out.println(
								"<tr>"+
									"<td>"+
										"<img src='Member_icon.png' width='20px' height='20px' />"+
									"</td>"+
									"<td>"+
										rs.getString("userName")+
									"</td>"+
								"</tr>"
									);
						}
						
						}catch(Exception e)
						{
						System.err.println(e);
						}
						%>
      </table>


    </div> <!-- end of memberbox -->
					
      
	

</div> <!-- end of sidebar-right -->



</div> <!-- End of container -->
    <script>
      var WsUrl = "ws://localhost:8080/ArkadasAramaSitesi/chat";
      websocket = new WebSocket(WsUrl);

      websocket.onmessage = function processMessage(usermsg) {
        document.getElementById("chatbox").innerHTML += usermsg.data + "<br/>";
      };


      function sendMessage() {
        websocket.send("<mark>" + "${member.userName}" + "</mark>" + ":" + "<b>" + usermsg.value + "</b>");
        usermsg.value = "";
      }



      document.getElementById("btnsendmsg")
        .onclick = function() {
          window.setTimeout(function() {
            location.href = 'home.jsp';
          }, 50);
        };


      document.getElementById("addfriends")
        .onclick = function() {
          window.alert("Friend Added");
          window.setTimeout(function() {
            location.href = 'home.jsp';
          }, 50);
        };


      document.getElementById("deletefriends")
        .onclick = function() {
          window.alert("Friend Deleted");
          window.setTimeout(function() {
            location.href = 'home.jsp';
          }, 50);
        };

    </script>



  </body>

</html>
