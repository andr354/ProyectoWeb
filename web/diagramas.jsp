<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            int Id = Integer.parseInt(request.getParameter("id"));
            int Idu = Integer.parseInt(request.getParameter("idu"));
            int Idp = Integer.parseInt(request.getParameter("idp"));
            //out.println(Idu+1 +" id " + Id+2);
        %>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">.
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
            ResultSet rss = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/BaseLoginServlet");
            rs=manejador.executeQuery("SELECT Users.rol, nivel FROM Users WHERE Users.id='"+user+"'"); //"+user+"
            rs2=manejador.executeQuery("SELECT id_dig, id_dgp, descripcion, notaP, calif FROM diagramas, students, diagramasP WHERE id_prof="+Idp+" and id_dip=id_dgp and Id_stdn='"+Id+"' and id_usu='"+Idu+"'");
            rss=manejador.executeQuery("SELECT app_std, nom_std FROM students WHERE id_std='"+Id+"'");
            if(rs.next())
                rol = rs.getString("Users.rol");
                nivel = rs.getInt("Users.nivel");
            //manejador.closeConnection();
            out.println("<br><br>");
            rss.next();
            out.println("<h2>Participaciones por estudiante: "+ rss.getString("students.app_std") +" "+ rss.getString("students.nom_std") +"</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Diagrama</th>");
            out.println("<th>Comentario</th>");
            out.println("<th>Calificación</th>");
            out.println("<th>Notas profesor</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("diagramas.id_dig")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.id_dgp")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.descripcion")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.calif")+"</th>");
                out.println("<th>"+rs2.getString("diagramas.notaP")+"</th>");
                out.println("<th>");
                out.println("<a href='calificar.jsp?id="+rs2.getString("diagramas.id_dig")+"'>Calificar</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");

        %>
    </center>    
    </body>
</html>
