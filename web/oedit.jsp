<%-- 
    Document   : edit
    Created on : Mar 29, 2024, 12:17:55 PM
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
        String userid=request.getParameter("iidd");
         String name=null ,email=null ,mob=null,adr=null;
          try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","");
        Statement smt=cn.createStatement();
        
ResultSet rs=smt.executeQuery("select * from rregister where userid="+userid);
while(rs.next())
{
   name=rs.getString(2);
   email=rs.getString(3);
   mob=rs.getString(5);
   adr=rs.getString(6);
}
//Close the connection

cn.close();   
        }
        catch(Exception e)
        { out.println(e.getMessage());
        }
       
        %>
        <form action="owner_Update.jsp" method="post">
            <pre>
            <input type="text" name="userid" value="<%=userid%>" readonly>
            <input type="text" name="name" value="<%=name%>">
            <input type="text" name="email" value="<%=email%>" readonly>
            <input type="text" name="mob" value="<%=mob%>" >
            <input type="text" name="adr" value="<%=adr%>">
            <input type="submit" name="input" value="UPDATE">
            </pre>
       </form>
    </body>
</html>
