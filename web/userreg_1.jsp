<script>
   function validateform(){  

var mobile = document.getElementById('txtphoneno');

 
  


 
 
  
  if (mobile.value == "" || mobile.value == null) {
            alert("Please enter your Mobile No.");
            return false;
        }
        if (mobile.value.length < 10 || mobile.value.length > 10) {
            alert("Mobile No. is not valid, Please Enter 10 Digit Mobile No.");
            return false;
        }



    }
    </script>
    <form name="myform" id="loginForm" action="userregact.jsp" method="post"  >
				<center>
<table>
   
        <tr>
            <th><font color="white" size="4">Username :</th>
              <th><input type="text" name="username" required placeholder= Username style="height:30px; width:170px"></input>
              </th>
        </tr>

        <tr>
              <th><font color="white" size="4">Password: </th>
              <th><input type="password" name="password1" required placeholder= Password style="height:30px; width:170px"></input>
              </th>
        </tr>
    
    
      <tr>  
               <th><font color="white" size="4">Gender: </th>
               <th><select id="s1" name="gen" required style="width: 175px;" class="text">
                <option value="">--Select--</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
             </select></th>
         
          </tr>
    
    
       <tr>
              <th><font color="white" size="4">Date of Birth :</th>
              <th><input type="date" name="dt"  placeholder= DOB style="height:30px; width:170px"></input>
              </th>
        </tr>
    
      
         <tr>
              <th><font color="white" size="4">Mobile No :</th>
              <th><input type="text" name="mobile" required id="txtphoneno" onkeypress="return isNumber(event)"  placeholder= MobileNo style="height:30px; width:170px"></input>
              </th>
        </tr>
   
       <tr>
              <th><font color="white" size="4">Email :</th>
              <th><input type="text" name="email" required placeholder= Email style="height:30px; width:170px"></input>
              </th>
        </tr>
    
       <tr>
              <th><font color="white" size="4">Address :</th>
              <th><input type="text" name="address" required placeholder= Address style="height:30px; width:170px"></input>
              </th>
        </tr>
    
	  <tr>
              <td>
                    <input type="submit" value="Register"  style="height:30px; width:65px" />
             </td>
           </tr>
 	
	</table>
                    </center>
     </form>