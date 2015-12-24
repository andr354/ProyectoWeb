<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head></head>
<body>
	<h1>Login</h1>
<center>
	<s:form action="/Login">
            Nombre de usuario: <s:textfield name="username" label="Username" /><br>
            Contraseña: <s:password name="password" label="Password" />
		<s:submit />
	</s:form>
</center>
</body>
</html>