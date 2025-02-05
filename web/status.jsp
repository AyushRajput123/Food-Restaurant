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
            
                  HttpSession hs=request.getSession(false);
        String userid=(String)hs.getAttribute("userid");
            // Load the driver class			
            Class.forName("com.mysql.cj.jdbc.Driver");

            //Create Connection Object
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "");

            //Make the PreparedStatement object
            PreparedStatement psmt = cn.prepareStatement("update dregister set status=? where userid='"+userid+"'");
            psmt.setString(1, "inactive");
            
                        
            
            boolean b = psmt.execute();

            if (!b) {
                //out.println("Registered");
                //response.sendRedirect("customerLogin.html");
                out.println("status setted");
                RequestDispatcher rd=request.getRequestDispatcher("Home1");
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
