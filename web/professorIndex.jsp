<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            int grupo = 0;
            try{
                grupo = Integer.parseInt(request.getParameter("grupo"));
            }catch(Exception e){
            }
        %>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Professor</title>
    </head>
    <body>
    <script>
    function capturar()
    {
        var porId = document.getElementById("nombre").value;
        //document.getElementById("resultado").innerHTML=" <br>Por ID: "+porId+" ";
        var pagina = "professorIndex.jsp?grupo=";
        var paginaF = pagina.concat(porId);
        location.href = paginaF;
        
    }
    
    function loadDoc(snd, std) {
        //alert("Cambiando: "+snd+" estado: "+std);
        var xhttp = new XMLHttpRequest();
        var est=0;
        if(std==0){
            est=1;
        }
        var eestd = document.getElementById(""+snd+"").innerHTML;
        if(eestd==0){
            eestd=1;
        }else{
            eestd=0;
        }
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                document.getElementById(""+snd+"").innerHTML = eestd;
            }
        };
        xhttp.open("POST", "cestado.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id="+snd+"&std="+est);
        //location.href = "professorIndex.jsp?grupo=0";
    }
    </script>    
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
            int idP = 1;
            int nivel = 1;
            ResultSet rs=null;
            ResultSet rs2 = null;
            ResultSet rs3 = null;
            manejador.setConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/BaseLoginServlet");
            rs=manejador.executeQuery("SELECT Users.rol, nivel, idUser FROM Users WHERE Users.id='"+user+"'"); //"+user+"
            if(grupo==0){
                rs2=manejador.executeQuery("SELECT * FROM users, students WHERE nivel=1 and idUser=id_usu ");
            }else{
                rs2=manejador.executeQuery("SELECT * FROM users, students WHERE nivel=1 and idUser=id_usu and grp_std='"+grupo+"' ");
            }
            if(rs.next())
                rol = rs.getString("Users.rol");
                nivel = rs.getInt("Users.nivel");
                idP = rs.getInt("Users.idUser");

            rs3=manejador.executeQuery("SELECT * FROM diagramasP WHERE id_prof='"+idP+"' ");
            //manejador.closeConnection();
            out.println("<h1>Wellcome "+rol+" : "+user+"</h1>");
            System.out.println("-"+rol+"-");
            out.println("<br><br>");
            out.println("<h2>Estudiantes activos actualmente:</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            out.println("<th>Grupo</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs2.next()){
                out.println("<tr>");
                out.println("<th>"+rs2.getString("students.nom_std")+" "+rs2.getString("students.app_std")+"</th>");
                out.println("<th>"+rs2.getString("students.grp_std")+"</th>");
                out.println("<th><a href='diagramas.jsp?id="+rs2.getString("students.id_std")+"&idu="+rs2.getString("users.idUser")+"&idp="+idP+"'>Ver participaciones</a>");
                out.println("</th>");
                out.println("</tr>");
                
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            out.println("Ver solo el grupo: ");
            out.println("<form id=\"form1\">");
            out.println("<br><input type=\"number\" id=\"nombre\" class=\"formulario\">");
            out.println("</form>");
            out.println("<input type=\"button\" value=\"Filtrar\" onclick=\"capturar()\">");
            out.println("<div id=\"resultado\"></div>");
            
            out.println("<br><br>");
            out.println("<h2>Diagramas creados:</h2>");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table table-striped table-bordered table-responsive\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Descripción</th>");
            out.println("<th>Grupo</th>");
            out.println("<th>Estado</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while(rs3.next()){
                out.println("<tr>");
                out.println("<th>"+rs3.getInt("diagramasP.id_dip")+"</th>");
                out.println("<th>"+rs3.getString("diagramasP.descrip")+"</th>");
                out.println("<th>"+rs3.getString("diagramasP.grupo")+"</th>");
                out.println("<th id=\""+rs3.getInt("diagramasP.id_dip")+"\">"+rs3.getString("diagramasP.estado")+"</th>");
                out.println("<th>");
                out.println("<button type=\"button\" onclick=\"loadDoc("+rs3.getString("diagramasP.id_dip")+","+rs3.getString("diagramasP.estado")+")\">Cambiar estado</button>");
                out.println("<a href='eliminarD.jsp?id="+rs3.getString("diagramasP.id_dip")+"'>Eliminar</a>");
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