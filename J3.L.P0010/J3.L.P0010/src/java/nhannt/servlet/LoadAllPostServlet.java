/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nhannt.notification.Notification;
import nhannt.notification.NotificationDAO;
import nhannt.notification.NotificationDTO;
import nhannt.post.PostDAO;

import nhannt.userInfor.UserInforDAO;
import org.apache.log4j.Logger;

/**
 *
 * @author NhanNT
 */
@WebServlet(name = "LoadAllPostServlet", urlPatterns = {"/LoadAllPostServlet"})
public class LoadAllPostServlet extends HttpServlet {
    private String SHOW_POST_CONTROLLER="ShowPostServlet";
    private final String LOGIN_PAGE = "login.jsp";
    static final Logger LOGGER = Logger.getLogger(LoadAllPostServlet.class);

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
        
        int numberAllPost;
        int numberOfPage;
        String url = SHOW_POST_CONTROLLER; 
        try  {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            if(session.getAttribute("EMAIL")!= null)
            {
                session.setAttribute("IS_SEARCH", "false");
            
            PostDAO postDAO =  new PostDAO();
            UserInforDAO userInforDAO = new UserInforDAO();
            NotificationDAO notificationDAO = new NotificationDAO();
            
            numberAllPost=postDAO.countAllPost();
            session.setAttribute("NUMBER_ALL_POST", numberAllPost);
            double tmp=numberAllPost;
            numberOfPage= (int) Math.ceil(tmp/20);
            session.setAttribute("NUMBER_OF_PAGE", numberOfPage);
            
            ArrayList<NotificationDTO> listNotificationDTO = new ArrayList<>();
            ArrayList<Notification> listNotification = new ArrayList<>();
            listNotificationDTO = notificationDAO.getListNotification((String) session.getAttribute("EMAIL"));
            
            int countNotification = 0;            
            for (NotificationDTO notificationDTO : listNotificationDTO) {
                if(!notificationDTO.getEmail().equals((String) session.getAttribute("EMAIL")))
                    
                {
                    listNotification.add(new Notification(notificationDTO, userInforDAO.getName(notificationDTO.getEmail())));
                }
                
            }
            for (Notification notification : listNotification) {
                if(notification.getNotificationDTO().isIsNew())
                {
                    countNotification++;
                }
            }
            session.setAttribute("COUNT_NOTIFICATION", countNotification);
            session.setAttribute("LIST_NOTIFICATION", listNotification);
            } else
            {
                url = LOGIN_PAGE;
            }
            
            
            
            
            
                    
        } catch (SQLException ex) {
            LOGGER.error("LoadAllPostServlet - SQL " + ex.getMessage());
        } catch (NamingException ex) {
             LOGGER.error("LoadAllPostServlet - Naming " + ex.getMessage());
        } finally
        {
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
