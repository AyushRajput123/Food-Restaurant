<%@ page 
    language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*, javax.servlet.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guru File Upload</title>
</head>
<body>
    
<%
   File file ;
   int maxFileSize = 5000 * 1024;
   //int maxMemSize = 5000 * 1024;
   String filePath = "C:/Users/ftt/Documents/NetBeansProjects/Food Restaurant/web/upload_image/";
String id=null;
   String contentType = request.getContentType();
   Connection cn=null;
   String fileName="";
   try {
            
            

            // Load the driver class			
            Class.forName("com.mysql.cj.jdbc.Driver");

            //Create Connection Object
             cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "");

            //Make the PreparedStatement object
            PreparedStatement psmt = cn.prepareStatement("select max(id)as iidd from menuitem");
           
                        
            
           ResultSet rs=psmt.executeQuery();
           

            if (rs.next()) {
          id=rs.getString("iidd");
          //out.println(id);
    }

       
    


        } catch (Exception e) {
            out.println(e.toString());
        }
   
   
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
try{ 
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxFileSize);
      factory.setRepository(new File("c:\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      //out.println("11111111111111111111111");
      
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
        // out.println("22222222222222222222222222");
         while(i.hasNext()) 
         {
            FileItem fi = (FileItem)i.next();
            
            if ( !fi.isFormField() )  {
                String fieldName = fi.getFieldName();
                 fileName = fi.getName();
                
                //String userId=(String)session.getAttribute("userid");
                fileName=id+"_"+fileName;
                
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                file = new File( filePath + fileName) ;
                fi.write( file ) ;
                //out.println("Uploaded Filename: " + filePath + fileName + "<br>");
            
    
    }
    
    
    PreparedStatement ps2=cn.prepareStatement("update menuitem set image=? where id=?");
    ps2.setString(1, fileName);
    ps2.setString(2,id);
    boolean b=ps2.execute();
    if(b==false)
    {
    out.println("RECEPI INSERTED");
    RequestDispatcher rd=request.getRequestDispatcher("Home3");
        rd.include(request, response);
    }
         }
       //close connection
            cn.close();  
      }
      catch(Exception ex) {
         out.println(ex.getMessage());
      }
   }
   else{
      
      out.println("<p>No file uploaded</p>"); 
      
   }
%>
</body>
</html>