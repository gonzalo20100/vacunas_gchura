<%@page import="com.emergentes.modelo.Vacunas"%>
<%@page import="com.emergentes.modelo.ControlVacunas"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    if (session.getAttribute("registroV") == null) {
            ControlVacunas objetoIni = new ControlVacunas();
            
            objetoIni.insertarVacunado(new Vacunas(1, "Brunito Diaz", 25, 1.40, "Si"));
            objetoIni.insertarVacunado(new Vacunas(2, "Juancito Pinto", 30, 1.52, "No"));
            
            session.setAttribute("registroV", objetoIni);
        }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - Vacunas</title>
    </head>
    <body>
            <label style="color:blue"><b>
                    <p>PRIMER PARCIAL TEM-742</p>
                    Nombre: Gonzalo Chura Garcia
                    <br>Carnet: 9247930
            </b></label>
        <h1>Registro de Vacunas</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <br><br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Peso</th>
                <th>Talla</th>
                <th>Vacuna</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.registroV.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Editar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>                       
        </table>
      
    </body>
</html>
