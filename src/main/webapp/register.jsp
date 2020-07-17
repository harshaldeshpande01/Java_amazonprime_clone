<%-- 
    Document   : register
    Created on : 22-May-2020, 9:17:46 PM
    Author     : HP
--%>

<%
    if(session.getAttribute("username")!=null)
    {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script language="javascript">
            function checkExist(){
                var xmlhttp = new XMLHttpRequest();
                var username = document.getElementById("uname").value;
                var url = "exists.jsp?username=" + username;
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                        document.getElementById("isE").innerHTML = xmlhttp.responseText;
                        document.getElementById("isE").style.color = "red";
                    }
                };
                try{
                    xmlhttp.open("GET",url,true);
                    xmlhttp.send();
                }catch(e){alert("unable to connect to server");
                }
            }
            
            function validate()
            {
                var user_name= /^[a-z A-Z 0-9]+$/; //pattern allowed alphabet a-z or A-Z 
                var email_valid= /\S+@\S+\.\S+/; //pattern allowed alphabet a-z or A-Z 
                var password_valid=/^[A-Z a-z 0-9]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9 and 6 to 12 range

                var uname = document.getElementById("uname"); //textbox id uname
                var email = document.getElementById("email"); //textbox id email
                var password = document.getElementById("password"); //textbox id password
                var confirm = document.getElementById("confirm");
                var p = password.value;
                var c = confirm.value;

                if(!user_name.test(uname.value) || uname.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
                {
                    alert("Invalid Username....! (Use non-empty username with no special characters)"); //alert message
                    uname.focus();
                    uname.style.background = '#f08080'; //set textbox color
                    return false;                    
                }
                if(!email_valid.test(email.value) || email.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
                {
                    alert("Invalid Email_ID....!"); //alert message
                    email.focus();
                    email.style.background = '#f08080'; //set textbox color
                    return false;                    
                }
                if(!password_valid.test(password.value) || password.value=='') //apply if condition using test() method match the parameter for pattern passoword allow 6 to 12 range 
                {
                    alert("Password Must Be 6 to 12 character"); //alert message
                    password.focus();
                    password.style.background = '#f08080'; //set textbox color
                    return false;                    
                }
                if(p == c)
                {
                    return true;
                }
                else {
                    alert("Passwords dont match"); //alert message
                    return false;
                }
            }		
	</script>
        <link rel="stylesheet" type="text/css" href="CSS/index.css">
    </head>
    <body>
        <div class="joinOuterContainer">
            <div class="joinInnerContainer">
                <p style="font-family: monospace" class="heading brand-logo">REGISTER</p>
                <p class="head text-muted">Already have an account? <a class="text-primary" href="index.jsp">Login</a></p>
                <form method="post" action="RegisterController" onsubmit="return validate();">
                <div>
                  <input style="border-radius: 6px; border-color: black" placeholder="Username" onblur="checkExist();" name="txt_username" class="joinInput" type="text" id="uname" /><span id="isE"></span>
                </div>
                <div>
                  <input style="border-radius: 6px; border-color: black" placeholder="Email Id" name="txt_email" class="joinInput mt-20" type="text" id="email" />
                </div>
                <div>
                  <input style="border-radius: 6px; border-color: black" placeholder="Password" name="txt_password" class="joinInput mt-20" type="password" id="password"/>
                </div>
                <div>
                  <input style="border-radius: 6px; border-color: black" placeholder="Confirm" name="confirm_password" class="joinInput mt-20" type="password" id="confirm"/>
                </div>
                  <button style="width: 99%; padding: 15px; border-color: black; margin-top: 20px;" class="btn btn-primary" name="btn_login" type="submit">Sign Up</button>
                </form>
            </div>
        </div>
        </center>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

