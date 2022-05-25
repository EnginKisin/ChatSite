<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="Loginstyle.css" type="text/css" rel="stylesheet">
<meta charset="utf-8">
<title>Welcome</title>
<link rel = "icon" href = "logo.png" type = "image/x-icon" >
</head>
<body style="background-image: url('bg.jpg');" >

<div class="navbar">
	<a href="login.jsp"> <img class="img" src="logo.png" width="23" height="20" alt="logo" title="home"></a>
	<a href="home.jsp" title="home page">Home Page</a>
	<a href="#howtouse.jsp" title="how to use">How to Use</a>
	<a href="#aboutus.jsp" title="aboutus">About Us</a>
	<a href="#lol.jsp">\(★ω★)/</a>
</div>

<div class="container">

	<div class="form-container sign-up-container">
		<form action="register.jsp" method="post">
			<h2>Sign Up</h2>
			<input type="text" placeholder="UserName" name="userName"/>
			<input type="email" placeholder="Email" name="email"/>
			<input onfocus="(this.type='date')" placeholder="BirthDate" name="birthDate"/>
			<input type="password" placeholder="Password" name="password_" />
			<button id="btn">Create An Account</button>
		</form>
	</div>
	
	
	<br/>


	<script>     
        document.getElementById("btn")
            .onclick = function(){
        		window.alert("Registration completed");
                window.setTimeout(function(){location.href = 'login.jsp';}, 500);                 
             };
    </script>
	
	
	<div class="form-container log-in-container">
	<form action="login" method="post">
			<h2>Log In</h2>
			<input type="text" placeholder="UserName" name="userName" />
			<input type="password" placeholder="Password" name="password_" />
			<a href="#">Forgot your password?</a>
			<button>Sign In</button>
	</form>
	</div>
	
</div>


</body>
</html>