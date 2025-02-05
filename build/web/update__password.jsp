<%-- 
    Document   : update_password
    Created on : 15-Mar-2024, 5:43:55 pm
    Author     : SHASHWAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String email=request.getParameter("email");
            %>
        
        
         <h2>Password Update</h2>
        <form action="UpdaPassword" method="post">
            <pre>
            <input type="text" name="email" value="<%=email%>" readonly>
            <input type="text" name="pwd" id="pwd1" placeholder="Enter new password"><!-- comment -->
            <input type="text"  id="pwd2" placeholder="Enter  confirm password">
           <span id="one"></span>
             <input type="submit" onclick="return valid()" value="Update Password">
            </pre>
        </form>
            <script>
                 function valid()
            {
                pwd=document.getElementById("pwd").value;
                pwd2=document.getElementById("pwd2").value;
               
                if(pwd==pwd2)
                {
                    return true;
                }
                else
                {
                    document.getElementById("one").innerHTML="pwd or confirm pwd not match";
                    return false;
                }}
            </script>
    </body>
</html>
