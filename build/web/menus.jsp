<%-- 
    Document   : menus
    Created on : Mar 20, 2024, 8:38:56 PM
    Author     : AyushRajput
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

//Execute the query
ResultSet rs=smt.executeQuery("select * from menuitem");
%>
<table border='2'>
<caption><h2>MENUS</h2></caption>
<tr><th>id</th><th>menu name</th><th>half plate</th><th>full plate</th><th>restaurant id</th><th>restaurant name</th><th>ORDER NOW</th><th>Image</th></tr>

<%
while(rs.next())
{
    String id=rs.getString(1);
    String menuname=rs.getString(2);
    String halfp=rs.getString(3);
    String fullp=rs.getString(4);
    String restid=rs.getString(5);
    String restname=rs.getString(6);
String image=rs.getString(7);
  %>  
  <tr><td><%=id%></td><td><%=menuname%></td><td><%=halfp%></td><td><%=fullp%></td><td><%=restid%></td><td><%=restname%></td><td><a href="order.jsp?id=<%=id%>">order now</a></td><td><img src="upload_image/<%=image%>" width="30%" height="20%"></td></tr>
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
