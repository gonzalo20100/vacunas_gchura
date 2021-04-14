
package com.emergentes.controlador;

import com.emergentes.modelo.ControlVacunas;
import com.emergentes.modelo.Vacunas;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vacunas objVacuna = new Vacunas();
        int id;
        int pos;
        String op = request.getParameter("op");
        
        if (op.equals("nuevo")) {
            HttpSession ses = request.getSession();
            ControlVacunas registroV = (ControlVacunas) ses.getAttribute("registroV");
            objVacuna.setId(registroV.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("miVacuna", objVacuna);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if (op.equals("modificar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            ControlVacunas registroV = (ControlVacunas) ses.getAttribute("registroV");
            pos = registroV.ubicarVacunado(id);
            objVacuna = registroV.getLista().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("miVacuna", objVacuna);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if (op.equals("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            ControlVacunas registroV = (ControlVacunas) ses.getAttribute("registroV");
            pos = registroV.ubicarVacunado(id);
            registroV.eliminarVacunado(pos);
            ses.setAttribute("registroV", registroV);
            response.sendRedirect("index.jsp");
        } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vacunas objVacuna = new Vacunas();
        int pos;
        String op = request.getParameter("op");
        
        if (op.equals("grabar")) {
            objVacuna.setId(Integer.parseInt(request.getParameter("id")));
            objVacuna.setNombre(request.getParameter("nombre"));
            objVacuna.setPeso(Integer.parseInt(request.getParameter("peso")));
            objVacuna.setTalla(Double.parseDouble(request.getParameter("talla")));
            objVacuna.setVacuna(request.getParameter("vacuna"));
            
            HttpSession ses = request.getSession();
            ControlVacunas registroV = (ControlVacunas) ses.getAttribute("registroV");
            
                String opg = request.getParameter("opg");
                if (opg.equals("nuevo")) {
                registroV.insertarVacunado(objVacuna);
            }
                else{
                    pos = registroV.ubicarVacunado(objVacuna.getId());
                    registroV.modificarVacunado(pos, objVacuna);
                    
                }
                ses.setAttribute("registroV", registroV);
                response.sendRedirect("index.jsp");
                
        }
    }
}
