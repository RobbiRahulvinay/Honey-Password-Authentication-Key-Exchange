<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="frauddetection.Dbconnection"%>
<%@ page session="true" %>
<%
   
   
    int id=0;
    String pname = request.getParameter("pname");
    String pquantity = request.getParameter("pquantity");
    String pprice = request.getParameter("pprice");
    String pdes = request.getParameter("pdes");
    String image = request.getParameter("image");
    
    try{
       
       Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
       PreparedStatement ps = con.prepareStatement("insert into products values(?,?,?,?,?,?)");
        ps.setInt(1,id);
        ps.setString(2,pname);    
        ps.setString(3,pquantity);
        ps.setString(4,pdes);
        ps.setString(5,pprice);
        ps.setString(6,image);
       
        ps.executeUpdate();
response.sendRedirect("admin_addproducts.jsp?msg=success");

}
    catch(Exception e)
    {
        System.out.println("Error in admin_addproducts"+e.getMessage());
    }
%>

