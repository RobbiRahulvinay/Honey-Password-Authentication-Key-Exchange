<%@page import="java.sql.*"%>
<%@page import="frauddetection.Dbconnection"%>
<%@ page session="true" %>
<%
   
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    
    try{
       
        
        Connection  con = Dbconnection.getConnection();
        Statement st =con.createStatement();
        
        ResultSet rs = st.executeQuery("select * from admin where username='"+username+"' and password='"+password+"'");
      
        if(rs.next())
        {
        	  
            response.sendRedirect("admin_home.jsp?m1=success");
      
        }
       else 
        {
            response.sendRedirect("admin.jsp?m2=LoginFail");
                }
	    }
        
 
    
    catch(Exception e)
    {
      
    }
%>



