<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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