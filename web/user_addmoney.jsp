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
    <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('User Card Added Successfully');</script>
        <%}
            if (request.getParameter("msg1") != null) {%>
        <script>alert('Login Failed ');</script> 
        
        <%}
        %>
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
                            <li><a href="userhome.jsp">Home</a></li>
                            <li><a href="user_card.jsp" class="current">Account Details</a></li>
                            <li><a href="user_viewmoney.jsp">View Products</a></li>
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
				
        <%
            
          String cname=null; 
          
            
        String user = session.getAttribute("user").toString();
        
        Connection con = null;
        con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from card where user='"+user+"'");
        ResultSet rs=pst.executeQuery();
        
        if(rs.next())
        {
            
         cname=rs.getString("cname");
            
            
        }
        
        %>
            
                 <center>
	<h1>Add Money</h1>
    <br><br>
    
           <form name="f" action="user_addmoneyact.jsp" method="post" >  <center>
<table>
   
        <tr>
            <th><font color="white" size="4">Card Holder Name :</th>
            <th><input type="text" name="cname"  value="<%=cname%>" readonly="" style="height:30px; width:170px"></input>
              </th>
        </tr>

        <tr>
              <th><font color="white" size="4">Card Number: </th>
              <th><input type="text" name="cno"  placeholder= "Card Number" style="height:30px; width:170px"></input>
              </th>
        </tr>
    
      <tr>
              <th><font color="white" size="4">CVV: </th>
              <th><input type="text" name="cvv"  placeholder= "CVV" style="height:30px; width:170px"></input>
              </th>
        </tr>
    
    
         <tr>
              <th><font color="white" size="4">Expiry Date :</th>
              <th><input type="text" name="edate"  placeholder= "MM/YY" style="height:30px; width:170px"></input>
              </th>
        </tr>
   
        <tr>
              <th><font color="white" size="4">Amount :</th>
              <th><input type="text" name="amount"  placeholder= "Amount" style="height:30px; width:170px"></input>
              </th>
        </tr>
              
              
              
	  <tr>
              <td>
                    <input type="submit" value="ADD"  style="height:30px; width:65px"/>
             </td>
           </tr>
 	
	</table>
                    </center>
     </form>
        
    
        <hr> 
            
         <br><br>   
       
            
        <div class="cleaner"></div>

	</div><!-- End Of Container -->
    
    
    <div id="templatemo_footer">
    	<a href="#"></a>
    </div>

</body>
</html>