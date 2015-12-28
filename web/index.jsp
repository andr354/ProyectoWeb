<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head></head>
<body>
	<h1>Login</h1>
<center>
	<s:form action="/Login">
            <s:textfield name="username" label="Nombre de usuario" /><br>
            <s:password name="password" label="Contraseña" />
		<s:submit />
	</s:form>
</center>
</body>
</html>