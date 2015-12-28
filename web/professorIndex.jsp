<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Professor</title>
    </head>
    <body>
    <center>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
        </style>
        <%@ page import="java.sql.*" %>
        <jsp:useBean id="manejador" scope="session" class="paquete.DB"></jsp:useBean>
        <%
            String user = (String)session.getAttribute("username");
            String rol = "";
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/BaseLoginServlet");
            rs=manejador.executeQuery("SELECT Users.rol, nivel FROM Users WHERE Users.id='"+user+"'"); //"+user+"
            if(rs.next())
                rol = rs.getString("Users.rol");
                nivel = rs.getInt("Users.nivel");
            //manejador.closeConnection();
            out.println("<h1>Wellcome "+rol+" : "+user+"</h1>");
            System.out.println("-"+rol+"-");
            

        %>
    </center>    
    </body>
</html>