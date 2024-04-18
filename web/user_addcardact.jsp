<%@page import="java.sql.*"%>
<%@page import="frauddetection.Dbconnection"%>
<%@ page session="true" %>
<%
   
   String user = session.getAttribute("user").toString();
    int id=0;
    String cname = request.getParameter("cname");
    String cno = request.getParameter("cno");
    String cvv = request.getParameter("cvv");
    String edate = request.getParameter("edate");
     int money=0;
    
    try{
       
       Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
       PreparedStatement ps = con.prepareStatement("insert into card values(?,?,?,?,?,?,?)");
        ps.setInt(1,id);
        ps.setString(2,cname);    
        ps.setString(3,cno);
        ps.setString(4,cvv);
        ps.setString(5,edate);
        ps.setString(6,user);
        ps.setInt(7,money);
       
        ps.executeUpdate();
response.sendRedirect("user_addcard.jsp?msg=success");

}
    catch(Exception e)
    {
        System.out.println("Error in user_addcard"+e.getMessage());
    }
%>

