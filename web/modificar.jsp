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
<title>Añadir usuario</title>
</head>
<body bgcolor="white">
<center>
<br>
        <h1>Modificar usuario</h1>
      <%@ page import="java.sql.*" %>
      <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
      <h4>Datos actuales del usuario</h4>
        <%
            String user = (String)session.getAttribute("userName");
            String rol = "";
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/baseloginservlet");
            rs2=manejador.executeQuery("SELECT * FROM users WHERE idUser='"+Id+"' ");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            out.println("<th>Password</th>");
            out.println("<th>Rol</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("users.id")+"</th>");
                out.println("<th>"+rs2.getString("users.password")+"</th>");
                out.println("<th>"+rs2.getString("users.rol")+"</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
      %>
        <s:form action="/Add">
            <s:textfield placeHolder="Nombre de usuario" name="username" label="Nombre de usuario"/><br>
            <input type="hidden" name="id" value=<%out.println(Id);%>/>
            <s:textfield placeHolder="Contraseña" name="password" label="Contraseña"/><br>
            <s:select label="Rol" 
		headerKey="-1" headerValue="Modifcar Rol"
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