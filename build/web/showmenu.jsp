<%-- 
    Document   : menus
    Created on : Mar 20, 2024, 8:38:56 PM
    Author     : AyushRajput
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import=" javax.servlet.RequestDispatcher" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
                  try
    {
    
       HttpSession hs=request.getSession(false);
        String email=(String)hs.getAttribute("email");
        String name=(String)hs.getAttribute("name");
        String userid=(String)hs.getAttribute("userid");
        // Load the driver class

Class.forName("com.mysql.cj.jdbc.Driver");

//Create Connection Object

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","");


Statement smt=cn.createStatement();

String restid=(String)session.getAttribute("userid");

//Execute the query
ResultSet rs=smt.executeQuery("select * from menuitem where restid="+restid);

%>
<table border='2'>
<caption><h2>My Menu</h2></caption>
<tr><th>ID</th><th>RESTAURANT NAME</th><th>RESTAURANT ID</th><th>MENU NAME</th><th>NO.OF HALF PLATE</th><th>NO. OF FULL PLATE</th><th>Item Image</th></tr>
<%
while(rs.next())
{
        
    String id=rs.getString(1);
    String menuname=rs.getString(2);
    String nhalfp=rs.getString(3);
    String nfullp=rs.getString(4);
    
    String restName=rs.getString(6);
    String itemImage=rs.getString(7);
    

  %>  
<tr><td><%=id%></td><td><%=restName%></td><td><%=restid%></td><td><%=menuname%></td><td><%=nhalfp%></td><td><%=nfullp%></td><td><img src="upload_image/<%=itemImage%>" width="8%" height="8%"></td></tr>
<%
  }

out.println("</table>");
//Close the connection

cn.close();   
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }  
            
 %>
    </body>
</html>
