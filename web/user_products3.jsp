<%@page import="frauddetection.Mail"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="frauddetection.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%
    String user = session.getAttribute("user").toString();
    int id=Integer.parseInt(request.getParameter("id"));
    String pname = request.getParameter("pname");
    String pdes = request.getParameter("pdes");
    int quan=Integer.parseInt(request.getParameter("quan"));
    int total=Integer.parseInt(request.getParameter("total"));
    String cno = request.getParameter("cno");
    String cvv = request.getParameter("cvv");
    String edate = request.getParameter("edate");
    
    Connection con = Dbconnection.getConnection();
    
    
     
    
          
        PreparedStatement pst2=con.prepareStatement("select * from card where cno='"+cno+"'");
        ResultSet rs3=pst2.executeQuery(); 
        
        PreparedStatement pst3=con.prepareStatement("select * from card where cno='"+cno+"'");
        ResultSet rs4=pst3.executeQuery();
          
        if(rs3.next())  {
            
           String usermail=rs3.getString("user");
           String username=rs3.getString("cname");
            
            
            
          Mail m = new Mail();
          String msg ="Card Holder Name:"+username+"\nCard No :"+cno+"\nMessage :"+"The card has been used for purchasing.If it is you ignore the message. ";
          m.secretMail(msg,usermail,usermail);   
            
        }
          
    
    try{
       
        String cardno=null;
        String cardcvv=null;
        String cardedate=null;
        int cardmoney=0;
        int j=0;
        
       
      
       
       Statement st2 = con.createStatement();
       Statement st1 = con.createStatement();
       ResultSet rs1 = st1.executeQuery("select * from card where user='"+user+"'");
       
       
      ResultSet rs2 = st2.executeQuery("select * from fraud where user='"+user+"'");
         
        while (rs2.next()) {
              j++;
        }
       
       if(j>=3){
           
      PreparedStatement ps3 = con.prepareStatement("update user set status1='Malicious' where email='"+user+"' ");   
      ps3.executeUpdate();      
         
      if(rs4.next())  {
            
           String usermail=rs3.getString("user");
           String username=rs3.getString("cname");
      Mail m = new Mail();
          String msg ="Card Holder Name:"+username+"\nCard No :"+cno+"\nMessage :"+"The card has been misused.If it is you ignore the message. ";
          m.secretMail(msg,usermail,usermail); 
      
      }
       }
       
       
       
       
       if(rs1.next()){
           
           cardno=rs1.getString("cno");
           cardcvv=rs1.getString("cvv");
           cardedate=rs1.getString("edate");
           cardmoney=rs1.getInt("money");
                  }
       

       Statement st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from products where id="+id+"");
                  int i =0;
                    if ( rs.next() )
                    {
                     
                  i = rs.getInt("pquantity");
                    } 
        
        
        if(cno.equals(cardno)&&cvv.equals(cardcvv)&&edate.equals(cardedate)){
        
        if(total<=cardmoney){
        
        
        if(quan<=i){
        
     
       PreparedStatement ps = con.prepareStatement("insert into purchase values(?,?,?,?,?,?,?,?)");
        ps.setInt(1,id);
        ps.setString(2,pname); 
        ps.setString(3,pdes);
        ps.setInt(4,quan);
        ps.setInt(5,total);
        ps.setString(6,cno);
        ps.setString(7,cvv);
        ps.setString(8,user);
        ps.executeUpdate();
                   
       int k = i-quan;
       int finalamount=cardmoney-total;
       
       
       
        
      PreparedStatement ps1 = con.prepareStatement("update products set pquantity ="+k+" where id = '"+id+"' ");   
      ps1.executeUpdate();  
      
      PreparedStatement ps2 = con.prepareStatement("update card set money ="+finalamount+" where cno='"+cno+"' and cvv='"+cvv+"' and edate='"+edate+"' ");   
      ps2.executeUpdate();
      
     response.sendRedirect("userhome.jsp?msg2=success");

    }
 else{
            
          response.sendRedirect("userhome.jsp?MSG1=Failed");  
 }        
        
     
 }
else{
            
          response.sendRedirect("userhome.jsp?amount=Failed");  
  }         
        
 }
         
        
        
        else{
            
           
          
        PreparedStatement psa = con.prepareStatement("insert into fraud values(?,?,?)");
        psa.setString(1,user);
        psa.setInt(2,id); 
        psa.setString(3,pname);
        psa.executeUpdate(); 
         response.sendRedirect("userhome.jsp?CARD=Failed"); 
        }        
    }
    catch(Exception e)
    {
        System.out.println("Error in customerpurchase"+e.getMessage());
    }
%>

