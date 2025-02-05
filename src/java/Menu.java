/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AyushRajput
 */
public class Menu extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try{
         String menuname= request.getParameter("menuname");     
        String halfp= request.getParameter("halfp");
        String fullp= request.getParameter("fullp");
        
       HttpSession hs=request.getSession(false);
        String userid=(String)hs.getAttribute("userid");
        String name=(String)hs.getAttribute("name");
         
         Class.forName("com.mysql.cj.jdbc.Driver");

//Create Connection Object

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","");


//Make the PreparedStatement object
PreparedStatement ps=cn.prepareStatement("insert into menuitem(menuname,halfp,fullp,restid,restname) values(?,?,?,?,?)");
ps.setString(1,menuname);
ps.setString(2,halfp);
ps.setString(3,fullp);
ps.setString(4,userid);
ps.setString(5,name);
boolean b=ps.execute();


if(!b)
{
    
    //out.println("<h3>items inserted Successfully</h3>");

//RequestDispatcher rd=request.getRequestDispatcher("Home3");
//rd.include(request, response);
  out.println("<h2>Choose Image</h2>");
    out.println("<form action='image_upload.jsp' method='post' enctype='multipart/form-data'>");
    out.println("<input type='file' name='file'>");
    out.println("<input type='submit' value='Upload'>");
    out.println(":</form>");
    
    
}

//Close the connection

cn.close();   


        }
        catch(Exception e){
        out.println(e.getMessage());
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
