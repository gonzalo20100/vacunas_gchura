<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - REGISTRO - MODIFICA</title>
    </head>
    <body>
        <h2 style="color:red">
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                REGISTRO DE
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                MODIFICAR DATOS DE
            </c:if>
                ESTUDIANTE VACUNADO
        </h2>
            <jsp:useBean id="miVacuna" scope="request" class="com.emergentes.modelo.Vacunas" />
            
            <form action="Controller" method="post">
                <table>
                    <tr>
                        <td>Id </td>
                        <td><input type="text" name="id"
                                   value="<jsp:getProperty name="miVacuna" property="id" />" >
                        </td>
                    </tr>
                    <tr>
                        <td>Nombre y Apellidos</td>
                        <td><input type="text" name="nombre"
                                   value="<jsp:getProperty name="miVacuna" property="nombre" />" >                        
                        </td>
                    </tr>
                    <tr>
                        <td>Peso (kg.)</td>
                        <td><input type="number" name="peso" placeholder="000" min="0" max="120" 
                                   value="<jsp:getProperty name="miVacuna" property="peso" />" >
                        </td>
                    </tr>
                    <tr>
                        <td>Talla(metros)</td>
                        <td><input type="number" name="talla" placeholder="0.00" step="0.01"  min="0" max="2.00" 
                                   value="<jsp:getProperty name="miVacuna" property="talla" />" >                        
                        </td>
                    </tr>
                    <tr>
                        <td>¿Vacuna Suministrada? </td>
                        <td>
                            <select name="vacuna">
                                <option value="Si"
                            <c:if test="${miVacuna.vacuna == 'Si'}"
                                  var="res" scope="request">
                                    selected
                            </c:if>                                    
                                >Si</option>
                                <option value="No"
                            <c:if test="${miVacuna.vacuna == 'No'}"
                                  var="res" scope="request">
                                    selected
                            </c:if>                                    
                                >No</option>
                            </select>
                        </td>
                    </tr>                    
                    <tr>                        
                        <td>
                            <input type="hidden" name="opg" value="${requestScope.op}"/>
                            <input type="hidden" name="op" value="grabar"/>
                        </td>
                        <td><input type="submit" value="Enviar" /></td>
                    </tr>
                </table>
            </form>
    </body>
</html>
