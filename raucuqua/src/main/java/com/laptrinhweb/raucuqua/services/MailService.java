package com.laptrinhweb.raucuqua.services;

import com.laptrinhweb.raucuqua.connection.GetConnection;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MailService {
//    private static String from = "raucuqua111@gmail.com";
//    private static String password = "gcmwycbdfrvorhpp";
    public static boolean sendMail(String to, String subject, String content){
        Session session = connect();
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress("raucuqua111@gmail.com"));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject(subject);

            // Now set the actual message
            message.setText(content,"UTF-8");

//            System.out.println("sending...");
            // Send message
            Transport.send(message);
            return true;
//            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();

        }
        return false;
    }
    public static Session connect(){
        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        //465, 587
        properties.put("mail.smtp.port", "587");
        //ssl to starttls
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");
        InputStream reader = GetConnection.class.getClassLoader().getResourceAsStream("email.properties");
        Properties myProp = new Properties();
        try {
            myProp.load(reader);

            System.out.println(myProp.getProperty("email"));
            System.out.println(myProp.getProperty("password"));
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                //pass: rau1@haha
                return new PasswordAuthentication(myProp.getProperty("email"), myProp.getProperty("password"));

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);
        return session;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        String email = "thuan0373535207@gmail.com";
        String content = "xin chao user 123, day la duong link de lay lai mat khau";
        MailService.sendMail(email,"xác nhận lấy mật khẩu từ trang raucuqua jdk 7",content);
    }
}
