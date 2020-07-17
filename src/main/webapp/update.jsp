<!DOCTYPE html>
<html>
    <head>
        <title>Update Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body style="background-color: #1a202c; color: white">
        <nav class="navbar navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Admin</a>
        <form action="Logout">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Logout</button>
        </form>
    </nav>
    <center>
        <h2 style="color: white; margin-bottom: 20px; margin-top: 30px;">Update User</h2>
    <a href="admin.jsp">Go Back ?</a>
    <form method="post" action="UpdateController">
    <br>
    </center>
    <label style="margin-left: 620px" for="formGroupExampleInput">User Id (Read only)</label>
    <center>
    <input style="width: 300px; height: 40px" type="text" name="id" value="<%=request.getParameter("id")%>" readonly/>
    </center>
    <br>
    <label style="margin-left: 620px" for="formGroupExampleInput">Username :</label>
    <br>
    <center>
    <input style="width: 300px; height: 40px" type="text" name="username" value="<%=request.getParameter("username")%>">
    </center>
    <br>
    <label style="margin-left: 620px" for="formGroupExampleInput">Email Id :</label>
    <center>
    <input style="width: 300px; height: 40px" type="email" name="email" value="<%=request.getParameter("email")%>">
    <br><br>
    <button style="width: 300px;" class="btn btn-primary" type="submit">Update</button>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </center>
    </body>
</html>
