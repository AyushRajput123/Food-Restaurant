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
        //String email=(String)hs.getAttribute("email");
       // String name=(String)hs.getAttribute("name");
        String userid=(String)hs.getAttribute("userid");
        // Load the driver class

Class.forName("com.mysql.cj.jdbc.Driver");

//Create Connection Object

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","");


Statement smt=cn.createStatement();
//Execute the query
ResultSet rs=smt.executeQuery("select * from orders where did='"+userid+"'");

%>
<table border='2'>
<caption><h2>ORDERS</h2></caption>
<tr><th>ID</th><th>RESTAURANT NAME</th><th>RESTAURANT ID</th><th>MENU NAME</th><th>NO.OF HALF PLATE</th><th>NO. OF FULL PLATE</th><th>TOTAL PRICE</th><th>MOBILE</th><th>EMAIL</th><th>ADDRESS</th><th>NAME</th></tr>
<%
while(rs.next())
{
        
    String orderid=rs.getString(1);
    String restname=rs.getString(2);
    String restid=rs.getString(3);
    String menuname=rs.getString(4);    
    String nhalfp=rs.getString(5);
    String nfullp=rs.getString(6);
    String price=rs.getString(7);    
    String mob=rs.getString(8);
    String email=rs.getString(9);
    String adr=rs.getString(10);
    String name=rs.getString(11);    
  %>  
<tr><td><%=orderid%></td><td><%=restname%></td><td><%=restid%></td><td><%=menuname%></td><td><%=nhalfp%></td><td><%=nfullp%></td><td><%=price%></td><td><%=mob%></td><td><%=email%></td><td><%=adr%></td><td><%=name%></td></tr>
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

 