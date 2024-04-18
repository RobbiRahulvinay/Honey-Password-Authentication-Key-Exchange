<%@page import="java.sql.*"%>
<%@page import="frauddetection.Dbconnection"%>
<%@ page session="true" %>
<%
   
   
  String email = request.getParameter("email");
   
    
    try{
       
       Connection con=Dbconnection.getConnection();
       Statement st = con.createStatement();
       PreparedStatement ps = con.prepareStatement("update user set status1='Block' where email='"+email+"'");
     
        ps.executeUpdate();
response.sendRedirect("admin_viewusers.jsp?msg=success");

}
    catch(Exception e)
    {
        System.out.println("Error in admin_viewusers"+e.getMessage());
    }
%>

