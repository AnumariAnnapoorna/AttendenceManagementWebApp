package org.Major.CollegeAttendence;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;  
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;  
  
public class Mailer {  
public static void send(String to,String subject,String msg){  
  
final String user="xxxx";  
final String pass="xxxxxxxx";  

Properties props = new Properties();  
props.put("mail.smtp.auth", "true");  
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.gmail.com");  
props.put("mail.smtp.port", "587");
props.put("mail.smtp.ssl.trust", "*");
Session session = Session.getInstance(props,  
 new javax.mail.Authenticator() {  
  protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication(user,pass);  
   }  
}); 

try {  
 Message message = new MimeMessage(session);  
 message.setFrom(new InternetAddress(to));  
 message.addRecipients(Message.RecipientType.TO,InternetAddress.parse(to));  
 message.setSubject(subject);  
 message.setText(msg);    
   
 Transport.send(message);  
  
 System.out.println("Done");  
  
 } catch (MessagingException e) {  
    throw new RuntimeException(e);  
 }  
      
}
}


 
