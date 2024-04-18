<%@page import="Efficient.mail"%>
<%@page import="Efficient.encryption"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.*"%>
<%@page import="frauddetection.Dbconnection"%>
<%@ page session="true" %>
<%
   
   
   
    String username = request.getParameter("username");
    String password1 = request.getParameter("password1");
    String gen = request.getParameter("gen");
    String dt = request.getParameter("dt");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    
    
       KeyGenerator keyGen = KeyGenerator.getInstance("AES");
    keyGen.init(128);
    SecretKey secretKey = keyGen.generateKey();
    System.out.println("secret key:" + secretKey);
   
     byte[] be = secretKey.getEncoded();//encoding secretkey
     String skey = Base64.encode(be);
     
      String cipher = new encryption().encrypt(username, secretKey);
      
      
        mail m = new mail();
   String msg ="YOur Secret Key is :"+skey  ;
   m.secretMail(msg,email,email);
   
   
       
       Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
       PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");
       
        ps.setString(1,username);    
        ps.setString(2,password1);
        ps.setString(3,gen);
        ps.setString(4,dt);
        ps.setString(5,mobile);
        ps.setString(6,email);
        ps.setString(7,address);
        ps.setString(8,"Normal");
        ps.setString(9,skey);
        ps.setString(10,cipher);
        ps.executeUpdate();
response.sendRedirect("user.jsp?msg=success");
out.println("user Register Successfully");

   
%>

