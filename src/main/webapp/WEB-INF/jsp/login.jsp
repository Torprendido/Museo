
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<link rel = "stylesheet" href = "css/login.css" type = "text/css"/>
		<meta charset = "UTF-8"/>
		<SCRIPT src = "jScript/transiciones.js"></SCRIPT>
	</head>
	<body>
		<div id='transicion'></div>
		<div id="main" class="container"> 
			<form name="loginform" id="loginform" action="loginControl.html" method="post" class="wpl-track-me"> 
				<p class="login-username">
				<label for="user_login"></label> 
					<input type="text" name="usuario" id="user_login" class="input" placeholder="Nombre de usuario:" value="" size="20" /> 
				</p> 
				<p class="login-password"> 
					<label for="user_pass"></label><input type="password" name="contrasenia" id="user_pass" class="input" placeholder="contraseña:" value="" size="20" /> 
				</p> 
				<p class="login-remember">
					<label><input name="rememberme" type="checkbox" id="rememberme" value="forever"> Remember Me</label>
				</p> 
                                <p class="login-submit">
					<input type="submit" name="wp-submit" id="wp-submit" class="button-primary" value="GO" /><input type="hidden" name="redirect_to" value="#"/>
				</p> 
			</form> 
		</div>
		
	</body>
</html>
