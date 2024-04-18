<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="frauddetection.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
   <?php   
    if ((isset($_GET['Message'])!=null)) {
         echo '<script type ="text/JavaScript">';  
            echo 'alert("Login Sucess")';  
            echo '</script>';  
    }
?>  
<body>
	<div class="templatemo_container">
    	<div id="templatemo_header">
        	<div id="templatemo_logo_area">
            	<div id="templatemo_logo_left">
                &nbsp;
                </div>
                    <h1><font size="4">HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication</h1>
               
                <div id="templatemo_logo_right">
                &nbsp;
                </div>
			</div>
        
        </div>
        <div id="templatemo_top_section">
       	  <div id="templaetmo_top_section_top">
          	<div id="templatemo_top_section_glow">
            	<div id="templatemo_menu">
                    <div id="templatemo_menu_left">
                    </div>
                   <ul>
                            <li><a href="admin_home.jsp">Home</a></li>
                            <li><a href="admin_addproducts.jsp">Add Products</a></li>
                            <li><a href="admin_viewproducts.jsp">View Products</a></li>
                            <li><a href="admin_viewusers.jsp" class="current">View Fraud Users</a></li>
                            <li><a href="index.html">Logout</a></li>
                    </ul>
		        </div>      
                <br><br>
                <h1>Abstract</h1>  
                <a href="#"><img src="images/card1.jpg" alt="Free CSS Templates" border="0" /></a>
           	  <p>Due to the rise and rapid growth of E-Commerce, use of HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentications for online purchases has dramatically increased and it caused an explosion in the HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication fraud. As HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication becomes the most popular mode of payment for both online as well as regular purchase, cases of fraud associated with it are also rising. In real life, fraudulent transactions are scattered with genuine transactions and simple pattern matching techniques are not often sufficient to detect those frauds accurately. Implementation of efficient fraud detection systems has thus become imperative for all HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication issuing banks to minimize their losses. Many modern techniques based on Artificial Intelligence, Data mining, Fuzzy logic, Machine learning, Sequence Alignment, Genetic Programming etc., has evolved in detecting various HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication fraudulent transactions. A clear understanding on all these approaches will certainly lead to an efficient HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication system. This paper presents a survey of various techniques used in HPAKE Honey Password-Authenticated Key Exchange for Fast and Safer Online Authentication mechanisms and evaluates each methodology based on certain design criteria.</p>
                
            	  <div class="cleaner"></div>
    		</div><!-- end of glow -->
        	</div>
            <div id="templaetmo_top_section_bottom"></div>

        </div>
				
        
            
            <center>
               <h1>View User Details</h1>
	<% 

try{ 
	Connection con = null;
        con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from user");
        ResultSet rs=pst.executeQuery();
        %>
        
          <table style="width:60%" border="2">
         
        <tr style="color: #24f0c9">
        <th>User Name</th>
        <th>Gender</th>
        <th>DOB</th>
        <th>Mobile No</th>
        <th>Email</th>
        <th>Address</th>
        <th>Status</th>
        <th>Block</th>
        </tr>

<%
       
	    while(rs.next()){
            %><tr style="color: white">
                <th><%=rs.getString(1)%></th>
                <th><%=rs.getString(3)%></th>
                <th><%=rs.getString(4)%></th>
                <th><%=rs.getString(5)%></th>
                <th><%=rs.getString(6)%></th>
                <th><%=rs.getString(7)%></th>
                <th><%=rs.getString(8)%></th>
                 <td><a href="admin_viewusers1.jsp?email=<%=rs.getString(6)%>"><font color="#0d637d" size="3">Block</font></a> </td>
       
           </tr>
       <%  }
        
        %> </table>

         <% }
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
         <br><br><br><br>
            
       
             
             
            
        <div class="cleaner"></div>

	</div><!-- End Of Container -->
    
    
    <div id="templatemo_footer">
    	<a href="#"></a>
    </div>

</body>
</html>