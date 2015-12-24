<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Añadir usuario</title>
</head>
<body bgcolor="white">
<center>
<br>
        <h1>Agregar nuevo usuario</h1>
        <s:form action="/Add">
            <s:textfield name="username" label="Nombre de usuario"/><br>
            <s:textfield name="password" label="Contraseña"/><br>
            <s:select label="Rol" 
		headerKey="-1" headerValue="Asigne un rol al usuario"
		list="#{'1':'STUDENT','2':'PROFESSOR', '3':'ADMIN'}" 
		name="rol" 
		value="rol" />
            <br>
            <s:submit value="Agregar" />
        </s:form>
            <!--Dice que no pero si jala chido-->
</center>
</body>
</html>