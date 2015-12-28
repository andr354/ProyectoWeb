<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
<body>
    <center>
	<h1>Login</h1>
	<s:form action="/Login">
            <s:textfield placeHolder="Nombre de usuario" name="username" label="Nombre de usuario" /><br>
            <s:password placeHolder="Contraseña" name="password" label="Contraseña" />
		<s:submit />
	</s:form>
    </center>
</body>
</html>