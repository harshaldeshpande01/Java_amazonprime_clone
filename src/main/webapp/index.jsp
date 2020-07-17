<%-- 
    Document   : index.jsp
    Created on : 22-May-2020, 9:01:02 PM
    Author     : HP
--%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Http 1.1
    response.setHeader("Pragma", "no-cache"); // Http 1.0
    response.setHeader("Expires", "0"); // Proxy server
    if(session.getAttribute("username")!=null)
    {
        response.sendRedirect("welcome.jsp"); //session login user not back to index.jsp page or not type direct in url
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script language="javascript">
        function validate()
	{
            var username = document.LoginForm.txt_username; //get form name "LoginForm" and textbox name "txt_username" store in variable username
            var password = document.LoginForm.txt_password; //get form name "LoginForm" and textbox name "txt_password" store in variable password
				
            if (username.value == null || username.value == "") //check username textbox not blank
            {
		window.alert("please enter username ?"); //alert message
		username.style.background = '#f08080'; //set textbox color
		username.focus();
		return false;
            }
            if (password.value == null || password.value == "") //check password textbox not blank
            {
		window.alert("please enter password ?"); //alert message
		password.style.background = '#f08080'; //set textbox color
		password.focus();
		return false;
            }
	}		
	</script>
        <link rel="stylesheet" type="text/css" href="CSS/index.css">
    </head>
    <body>            
        <div class="joinOuterContainer">
            <div class="joinInnerContainer">
                <p style="font-family: monospace" class="heading brand-logo text-white">LOGIN</p>
                <p class="head text-muted">Don't have an account? <a class="text-primary" href="register.jsp">Register</a></p>
                <form method="post" action="LoginController" name="LoginForm" onsubmit="return validate();">
                <div>
                  <input style="border-radius: 6px; border-color: #23282d" placeholder="Username" name="txt_username" class="joinInput" type="text" />
                </div>
                <div>
                  <input style="border-radius: 6px; border-color: #23282d" placeholder="Password" name="txt_password" class="joinInput mt-20" type="password" />
                </div>
                    <button style="border-radius: 6px; border-color: black; width: 99%; padding: 15px; margin-top: 20px;" class="btn btn-primary" name="btn_login" type="submit">SIGN IN</button>
                </form>
            </div>
        </div>
            
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
