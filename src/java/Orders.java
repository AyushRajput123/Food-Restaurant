/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AyushRajput
 */
public class Orders extends HttpServlet {

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
            
            String userid=null , demail=null ;
        
         String restname= request.getParameter("restname");     
        String restid= request.getParameter("restid");
        String menuname= request.getParameter("menuname");
        String mob= request.getParameter("mob");
        String nhalfp= request.getParameter("nhalfp");
        String nfullp= request.getParameter("nfullp");
        String price= request.getParameter("price");
        String email= request.getParameter("email");
        String adr= request.getParameter("adr");
        String name= request.getParameter("name");
        
        
        
        Class.forName("com.mysql.cj.jdbc.Driver");

//Create Connection Object

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","");

            
//Make the PreparedStatement object
            PreparedStatement ps2 = cn.prepareStatement("select min(userid)as iidd  from dregister where status=?");
           ps2.setString(1, "inactive");
           ResultSet rs2=ps2.executeQuery();
            if (rs2.next()) {
           userid=rs2.getString("iidd");
            }
            
            PreparedStatement ps3 = cn.prepareStatement("select email  from dregister where userid=?");
           ps3.setString(1, userid);
           ResultSet rs3=ps3.executeQuery();
            if (rs3.next()) {
           demail=rs3.getString(1);
            }

//Make the PreparedStatement object
PreparedStatement ps=cn.prepareStatement("insert into orders(restname,restid,menuname,hplate,fplate,TP,usermob,useremail,useradr,username,did) values(?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,restname);
ps.setString(2,restid);
ps.setString(3,menuname);
ps.setString(4,nhalfp);
ps.setString(5,nfullp);
ps.setString(6,price);
ps.setString(7,mob);
ps.setString(8,email);
ps.setString(9,adr);
ps.setString(10,name);
ps.setString(11, userid);
boolean b=ps.execute();


if(!b)
{     
    
    String to=demail;
        String sub="orrder";
        String msg="ORDER COME\nhttp://localhost:8080/Food_Restaurant/showorder.jsp?email="+to;
        
       Mailer.send(to, sub, msg);
       
       out.println("Mail send");
    
    out.println("<h3>Ordered Successfully</h3>");

RequestDispatcher rd=request.getRequestDispatcher("Home2");
rd.include(request, response);
}


PreparedStatement ps4=cn.prepareStatement("update dregister set status=? where userid=?");
ps4.setString(1,"active");
ps4.setString(2,userid);
boolean b4= ps4.execute();



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
