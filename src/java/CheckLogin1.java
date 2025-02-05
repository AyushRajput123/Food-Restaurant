/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class CheckLogin1 extends HttpServlet {

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
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","");
        Statement smt = cn.createStatement();
        ResultSet rs =smt.executeQuery("select * from dregister where email='"+email+"'and binary pwd='"+pwd+"'" );
        if(rs.next()){
        String userid = rs.getString("userid");
        String name = rs.getString("name");
        String mob = rs.getString("mob");
        String Licence = rs.getString("Licence");
        HttpSession hs = request.getSession(true);
        hs.setAttribute("userid", userid);
        hs.setAttribute("name", name);
        hs.setAttribute("mob", mob);
        hs.setAttribute("Licence", Licence);
        hs.setAttribute("email", email); 
        RequestDispatcher rd=request.getRequestDispatcher("Home1");
        rd.forward(request, response);
        }
        else{
        out.println("<h2> invalid email or passward");
        RequestDispatcher rd=request.getRequestDispatcher("index2.html");
        rd.include(request, response);
        }
        cn.close();
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e)
        {
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
