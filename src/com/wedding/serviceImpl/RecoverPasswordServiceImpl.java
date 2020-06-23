package com.wedding.serviceImpl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.wedding.service.RecoverPasswordService;

public class RecoverPasswordServiceImpl implements RecoverPasswordService{

	@Override
	public void sendEmail(String email) {
		Properties p = new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", 587);
		// Get mail session
		Session s = Session.getInstance(p,
				 new javax.mail.Authenticator() {
				 protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication("dinhngocuyenphuong1802@gmail.com", "@dinhngocup1802");
				 }
				});
		try
	    {
	      MimeMessage msg = new MimeMessage(s);
	      //set message header and content
	      String username = "phuongdinh1802@gmail.com";
	      msg.setFrom(new InternetAddress("dinhngocuyenphuong1802@gmail.com"));
	      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
	      msg.setSubject("Recover Password");
	      msg.setText("Hi Manager!\n\n I'm " + email + ". \nCould you please reset my password?\n\n Thank you.\n Best regards	");
	      System.out.println("Message is ready");
	      //send email
    	  Transport.send(msg);  

	      System.out.println("Email Sent Successfully!!");
	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }
		
	}

}
