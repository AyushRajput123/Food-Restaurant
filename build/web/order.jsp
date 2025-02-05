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
        String adr=(String)hs.getAttribute("adr");
        String userid=(String)hs.getAttribute("userid");
        String mob=(String)hs.getAttribute("mob");
        String name=(String)hs.getAttribute("name");
       String id =request.getParameter("id");
       // Load the driver class
Class.forName("com.mysql.cj.jdbc.Driver");

//Create Connection Object

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rest","root","");


Statement smt=cn.createStatement();

//Execute the query
ResultSet rs=smt.executeQuery("select * from menuitem where id="+id);
%>
<form action="Orders">
    
    <pre>
   <h1>CONFIRM ORDER</h1>
<%
while(rs.next())
{
    
    String menuname=rs.getString(2);
    String halfp=rs.getString(3);
    String fullp=rs.getString(4);
   String restid=rs.getString(5);
    String restname=rs.getString(6);

  %> 
  <input type="hidden" name="restid" id="restid" value="<%=restid%>">
  <input type="hidden" name="mob" id="mob" value="<%=mob%>">
  <input type="hidden" name="email" id="email" value="<%=email%>">
  <input type="hidden" name="adr" id="adr" value="<%=adr%>">
  <input type="hidden" name="name" id="adr" value="<%=name%>">
  <label>RESTAURANT NAME</label>
  <input type="text" name="restname" value="<%=restname%>" readonly >
  <label>MENU NAME</label>
  <input type="text" name="menuname" value="<%=menuname%>" readonly >
  <label>HALF PLATE PRICE</label>
  <input type="text" name="halfp" id="halfp" value="<%=halfp%>" readonly >
  <label>FULL PLATE PRICE</label>
  <input type="text" name="fullp" id="fullp" value="<%=fullp%>" readonly >
  <label> NO. OF HALF PLATE</label>
  <input type="number" name="nhalfp" id="nhalfp" onclick="return valid()"  placeholder="no. of plate" >
  <label> NO. OF FULL PLATE</label>
  <input type="number" name="nfullp" id="nfullp" onclick="return valid()" placeholder="no. of plate" >
  <label>TOTAL PRICE</label>
  <input type="text" name="price" id="price"  readonly >
  <input type="submit" value="confirm order">
  <%
  }

out.println("</form>");
out.println("</pre>");
//Close the connection

cn.close();   
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }  
            
 %>
<script>
    function valid()
            {
                pwd=document.getElementById("nhalfp").value;
                pwd2=document.getElementById("nfullp").value;
                pwd3=document.getElementById("halfp").value;
                pwd4=document.getElementById("fullp").value;
               
                    var priceh=pwd3*pwd;
                pricefh=pwd4*pwd2;
                var price= priceh+pricefh;
                document.getElementById("price").value = price;
                    return false;
               
            }
 </script>
    </body>
</html>
