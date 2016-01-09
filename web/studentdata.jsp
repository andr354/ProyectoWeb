<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%
        int Id = Integer.parseInt(request.getParameter("id"));
    %>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Información del estudiante</title>
</head>
<body bgcolor="white">
<center>
<br>
        <h1>Información del alumno</h1>
        <s:form action="/Std">
            <s:textfield placeHolder="Nombre(s)" name="nombre" label="Nombre(s)"/><br>
            <s:textfield placeHolder="Apellidos" name="apps" label="Apellidos"/><br>
            <s:textfield placeHolder="Grupo" name="grupo"  label="Grupo"/><br>
            <input type="hidden" name="id" value=<%out.println(Id);%>/>
            <br>
            <s:submit value="Agregar" />
        </s:form>
            <!--Dice que no pero si jala chido-->
</center>
</body>
</html>
