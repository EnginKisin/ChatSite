<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="style.css" />
<title>Admin</title>
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
	<div class="container">
		<div class="form-container deleteUser-container">
			<form action="AdminFunct" method="post">
				<h2>Delete User</h2>
				<input class="Admininp" type="text" placeholder="Username" name="delete"/>
				<button>Delete</button>
			</form>
		</div>
		
		<div class="form-container maker-container">
			<form action="AdminFunct" method="post">
				<h2>Make Admin</h2>
				<input type="text" placeholder="Username" name="adminer"/>
				<button>Make Admin</button>
			</form>
		</div>
		
		<div class="form-container massageContainer">
			<form action="adminGetMessage.jsp" method="post">
				<h2>Get Message of User</h2>
				<input type="text" placeholder="Username" name="userName"/>
				<button>Get Message</button>
			</form>
		</div>
</div>				


		

	
	
	
	</body>
	
	<script type="text/javascript">
    </script>
	
	</html>