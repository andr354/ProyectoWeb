<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admninistrator</title>
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
            
            if(3==nivel){
            rs2=manejador.executeQuery("SELECT idUser, id, rol FROM users");
            
            out.println("<table width='70%'>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            out.println("<th>Rol</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("Users.id")+"</th>");
                out.println("<th>"+rs2.getString("Users.rol")+"</th>");
                out.println("<th><a href='add.jsp'>Agregar usuario</a> |");
                out.println(" <a href='modificar.jsp?id="+rs2.getString("Users.idUser")+"'>Modificar usuario</a> |");
                out.println(" <a href='eliminar.jsp?id="+rs2.getString("Users.idUser")+"'>Eliminar usuario</a> ");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            }else{
                
            }

        %>
    </center>    
    </body>
</html>