/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nhannt.notification.NotificationDAO;
import nhannt.post.PostDAO;
import org.apache.log4j.Logger;

/**
 *
 * @author NhanNT
 */
@WebServlet(name = "DeletePostServlet", urlPatterns = {"/DeletePostServlet"})
public class DeletePostServlet extends HttpServlet {

    private final String LOAD_ALL_POST_CONTROLLER = "LoadAllPostServlet";
    private final String ERROR_PAGE = "error.html";
    private final String LOGIN_PAGE = "login.jsp";
    static final Logger LOGGER = Logger.getLogger(DeletePostServlet.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String postId = request.getParameter("txtPostId");
        String url = ERROR_PAGE;
        try {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            if(session.getAttribute("EMAIL")!= null)
            {
                PostDAO postDAO = new PostDAO();
            NotificationDAO notificationDAO = new NotificationDAO();
            boolean result = postDAO.deletePost(postId);
            if (result) {
                notificationDAO.deleteNotificationByPostId(Integer.parseInt(postId));
                url = LOAD_ALL_POST_CONTROLLER;
            }
            } else
            {
                url = LOGIN_PAGE;
            }
            
            
        } catch (SQLException ex) {
            LOGGER.error("DeletePostServlet - SQL " + ex.getMessage());
        } catch (NamingException ex) {
            LOGGER.error("DeletePostServlet - Naming " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
