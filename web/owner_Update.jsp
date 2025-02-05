<%-- 
    Document   : User_Update
    Created on : Apr 1, 2024, 10:30:17 PM
    Author     : AyushRajput
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
            String userid = request.getParameter("userid");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mob = request.getParameter("mob");
            String adr = request.getParameter("adr");
            

            // Load the driver class			
            Class.forName("com.mysql.cj.jdbc.Driver");

            //Create Connection Object
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "");

            //Make the PreparedStatement object
            PreparedStatement psmt = cn.prepareStatement("update rregister set name=?,mob=?,adr=? where userid='"+userid+"'");
            psmt.setString(1, name);
            psmt.setString(2, mob);
            psmt.setString(3, adr);
                        
            
            boolean b = psmt.execute();

            if (!b) {
                //out.println("Registered");
                //response.sendRedirect("customerLogin.html");
                out.println(" update success");
                RequestDispatcher rd=request.getRequestDispatcher("Home3");
                rd.include(request, response);
            }

            //close connection
            cn.close();
        } catch (Exception e) {
            out.println(e.toString());
        }
            %>
    </body>
</html>
