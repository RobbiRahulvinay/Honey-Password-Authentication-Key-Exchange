<%@page import="Efficient.mail"%>
<%@page import="Efficient.encryption"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.*"%>
<%@page import="frauddetection.Dbconnection"%>
<%@ page session="true" %>
<%
   
   
   
    String email = request.getParameter("email");
    String skey = request.getParameter("skey");
   
      
      
        mail m = new mail();
   String msg ="YOur Secret Key is :"+skey  ;
   m.secretMail(msg,email,email);
   
   
       
     
response.sendRedirect("vus.jsp?msg=success");

   
%>

