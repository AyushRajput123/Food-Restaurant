    import java.util.Properties;    
    import javax.mail.*;    
    import javax.mail.internet.*;    
    class Mailer{  
        static String from="ayushrajput3172@gmail.com";
        static String pwd="megk zmep ohxc rpfm";
        public static void send(String to,String sub,String msg){  
              //Get properties object    
              Properties props = new Properties(); 
              props.put("mail.smtp.ssl.enable", "true");
props.put("mail.smtp.ssl.protocols", "TLSv1.2");
            //System.out.println("11111111111111111111");
/*
              props.put("mail.smtp.host", "smtp.gmail.com");    
              props.put("mail.smtp.socketFactory.port", "465");    
              props.put("mail.smtp.socketFactory.class",    
                        "javax.net.ssl.SSLSocketFactory");    
              props.put("mail.smtp.auth", "true");    
              props.put("mail.smtp.port", "465");  
*/


props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.ssl.enable", "true");
props.put("mail.smtp.ssl.required", "true");
props.put("mail.smtp.ssl.protocols", "TLSv1.2");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

              //get Session   
              Session session;
            session = Session.getDefaultInstance(props,    
                    new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(from,pwd);
                        }    
                    });
              //compose message    
              try {   
              //    System.out.println("222222222222222222222");
               MimeMessage message = new MimeMessage(session);
              //System.out.println("3333333333333333");
               message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
               //System.out.println("444444444444444444");
               message.setSubject(sub);    
               //System.out.println("55555555555555555555");
               message.setText(msg);    
               //System.out.println("66666666666666666");
               //send message  
               Transport.send(message);    
               //System.out.println("77777777777777777777777777777777");
               System.out.println("message sent successfully");    
              } catch (MessagingException e) {throw new RuntimeException(e);}    
          
              
          
    }  
      
    }    