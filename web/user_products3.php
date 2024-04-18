<?php

require'database.php';
session_start();
        $id = (int) $_POST['id']; 
        $pname =  $_POST['pname'];  
        echo $pname;
        print $pname;
        $pdes =  $_POST['pdes']; 
        $quan = (int) $_POST['quan'];
       
        $total = (int) $_POST['total'] ;
         $edate=  $_POST['edate']; 
          $cno =  $_POST['cno']; 
           $cvv =  $_POST['cvv']; 
        $email = $_SESSION['email'] ;
      $Database = new Database(); 
         $db = $Database->connect();
         $sql1 = "select * from card where cno='$cno'";
   
        $result = mysqli_query($db, $sql1);
         $sql2 = "select * from card where cno='$cno'";
       
         $result1 = mysqli_query($db, $sql2);      
         
       
        
         
          
        if($row = mysqli_fetch_array($result))  {
            
           print "hhhhhhhhhhhhhhhhhhhhhhhhhhhhh";
            $usermail=$row['user'];
           $username=$row['cname'];
            
            
            
         // Mail m = new Mail();
         // String msg ="Card Holder Name:"+username+"\nCard No :"+cno+"\nMessage :"+"The card has been used for purchasing.If it is you ignore the message. ";
         // m.secretMail(msg,usermail,usermail);   
            
        }
          
    
    try{
       
        $cardno=null;
        $cardcvv=null;
        $cardedate=null;
        $cardmoney=0;  //int
        $j=0;  //init
        
        print "hhhhhhhhhhhhhhhhhhhhhhhhhhhhh";
      
       
     //  Statement st2 = con.createStatement();
     //  Statement st1 = con.createStatement();
     //  ResultSet rs1 = st1.executeQuery("select * from card where user='"+user+"'");
       $sql2 = "select * from card where user='$user'";
       
         $result2 = mysqli_query($db, $sql2);   
       $sql3 = "select * from fraud where user='$user'";
       
         $result3 = mysqli_query($db, $sql3);   
     // ResultSet rs2 = st2.executeQuery("select * from fraud where user='"+user+"'");
         
        while ($row1 = mysqli_fetch_array($result3)) {
              $j++;
              print 'uuuuuuuuuuuuu';
              echo j;
        }
       
       if($j>=3){
            
       $sql4 = "update user set status1='Malicious' where email='$user' ";
         $result4 = mysqli_query($db, $sql4); 
         echo $sql4;
     
      if($row2 = mysqli_fetch_array($result1))  {
            
           $usermail=$row2['user']; 
           $username=$row2['cname'];  
      //Mail m = new Mail();
         // String msg ="Card Holder Name:"+username+"\nCard No :"+cno+"\nMessage :"+"The card has been misused.If it is you ignore the message. ";
         // m.secretMail(msg,usermail,usermail); 
       print 'The card has been misused.If it is you ignore the message';
      }
       }
       
       
       
       
       if($row3 = mysqli_fetch_array($result2)){
           
           $cardno=$row3['cno'];
           $cardcvv=$row3['cvv']; 
           $cardedate=$row3['edate']; 
           $cardmoney= $row3['money'];
                  }
       
       $sql5 = "select * from products where id='$id'";
       $result5 = mysqli_query($db, $sql5); 
        $i=0;
       
      if ( $row4 = mysqli_fetch_array($result5) )
                    {
                     
                         $i = $row4['pquantity']; 
                    }            
                    
        
        
        if(strcmp($cno,$cardno)&& strcmp($cvv,$cardcvv)&&strcmp($edate,$cardedate)){
        
        if($total<=$cardmoney){
        
        
        if($quan<=i){
        
                        $sql6 = "insert into purchase(id,pname,pdes,quan,total,cno,
                                        cvv,user) values('$id','$pname','$pdes','$quan','$total','$cno','$cvv','$user')";
                         $result6 = mysqli_query($db, $sql6); 
                         
       $k = $i-$quan;
       $finalamount=$cardmoney-$total;     
       
        $sql7 = "update products set pquantity ='$k' where id = '$id' ";
        $result7 = mysqli_query($db, $sql7);
                         
                         
         $sql7 = "update products set pquantity ='$k' where id = '$id' ";
        $result7 = mysqli_query($db, $sql7);
        
      $sql8 = "update card set money ='$finalamount' where cno='$cno' and cvv='$cvv' and edate='$edate' ";
        $result8 = mysqli_query($db, $sql8);
        
       $Message = urlencode("success..!");
         header("location:userhome.php?Message=".$Message); 
      
     

    }
 else{
            $Message = urlencode("Failed..!");
         header("location:userhome.php?Message=".$Message); 
           
 }        
        
     
 }
else{
            $Message = urlencode("Failed..!");
         header("location:userhome.php?Message=".$Message); 
           
          
  }         
        
 }
         
        
        
        else{
            
           $sql9 = "insert into fraud(user,id,pname) values('$user','$id','$pname')";
        $result9 = mysqli_query($db, $sql9);
          
         $Message = urlencode("Failed..!");
         header("location:userhome.php?Message=".$Message); 
         
        }        
    }
    
 catch (Exception $e) {
        $e->getMessage();
    }
 

