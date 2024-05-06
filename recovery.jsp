<%@page import="com.util.db.SendMail"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnrecover")!=null) //Login button clicked
{
	String email=request.getParameter("txtuser");
	ResultSet rs=db.getRows("select * from Signup where EmailID=?", email);
		if(rs.next()){ //true/false
			//Get password and sent to email
			String pass=rs.getString(4);
			String message="Hi "+email+", Welcome to Online Shopping Recovery System<br>Your Password is "+pass;
			SendMail.send(email, "Bus Reservation System - Password Recovery", message);			
		}else{
			msg="Invalid EmailID or EmailID is not exists in database... Try again...";
		}
	
}

%>
<!-- Login Page Specific Contents -->
<div class="container">
<form method="post" id="form1">
<div class="col-5 offset-3">
<br/>
<br/>
<h2>Password Recovery::</h2>
<div class="form-group">
Email Address
<input type="text" name="txtuser" id="txtuser" class="form-control" placeholder="Enter Username"/>
</div>

<br/>
<input type="submit" name="btnrecover" value="Submit" class="btn btn-primary"/>
</div>
</form>
</div>
<%@ include file="footer.jsp"%>
 <script>
 $(function(){
	$("#form1").validate({
		rules:{
			txtuser:{
				required:true
			},
			txtpass:{
				required:true
			}
		},
		messages:{
			txtuser:{
				required:"UserName is required"
			},
			txtpass:{
				required:"Password is required"
			}
		}
		
	}); 
 });
 
 </script>
 