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
    int amount=Integer.parseInt(request.getParameter("amount"));
    
    int money=0;
     
    Connection con=Dbconnection.getConnection();
     
    PreparedStatement pst=con.prepareStatement("select * from card where user='"+user+"' and cname ='"+cname+"' and cno='"+cno+"' and cvv='"+cvv+"' and edate='"+edate+"' ");
    ResultSet rs=pst.executeQuery();
        
    if(rs.next())
    {
            
    money=rs.getInt("money");
            
            
     }
     
    int finalamount= amount+money;
     
     
    try{
       
       
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("update card set money="+finalamount+" where user='"+user+"' and cname ='"+cname+"' and cno='"+cno+"' and cvv='"+cvv+"' and edate='"+edate+"' ");
        ps.executeUpdate();
response.sendRedirect("user_addcard.jsp?msg=success");

}
    catch(Exception e)
    {
        System.out.println("Error in user_addcard"+e.getMessage());
    }
%>

