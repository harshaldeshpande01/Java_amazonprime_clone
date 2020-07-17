<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Http 1.1
    response.setHeader("Pragma", "no-cache"); // Http 1.0
    response.setHeader("Expires", "0"); // Proxy server
    
    if(session.getAttribute("username") == null)
    {
        response.sendRedirect("index.jsp"); //session login user not back to index.jsp page or not type direct in url
    }
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<html>
<head>
<title>Admin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: #1a202c">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="welcome.jsp">Movies<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="Logout">Logout</a>
            </li>
          </ul>
        </div>
      </nav>
<!--    <nav class="navbar navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Admin</a>
        <form action="Logout">
            <button class="btn btn-primary" type="submit">Movies</button>
        </form>
        <form action="Logout">
            <button class="btn btn-primary" type="submit">Logout</button>
        </form>
    </nav>-->
    <center>
        <h2 class="text-white" style="margin-bottom: 20px; margin-top: 30px;">Manage Users</h2>
    </center>
        
        <%
        try {
        String connectionURL = "jdbc:mysql://localhost:3306/awp";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "root");
        statement = connection.createStatement();
        String QueryString = "SELECT * from users";
        rs = statement.executeQuery(QueryString);
        %>
        <TABLE class="table table-striped table-bordered table-dark">
            <TR>
            <TH class="text-primary">User Id</TH>
            <TH class="text-primary">Username</TH>
            <TH class="text-primary">Email Id</TH>
            <TH class="text-primary">Update</TH>
            <TH class="text-primary">Delete</TH>
            </TR>
        </thead>
        <%
        while (rs.next()) {
        %>
        <TR>
        <TD><%=rs.getString(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(4)%></TD>
        <TD><a class="text-white" href="update.jsp?id=<%=rs.getString(1)%>&&username=<%=rs.getString(2)%>&&email=<%=rs.getString(4)%>">Update</a></button></TD>
        <TD><a class="text-white" href="deleted.jsp?id=<%=rs.getString(1)%>">Delete</a></TD>
        </TR>
        <% } %>
        <%
        // close all the connections.
        rs.close();
        statement.close();
        connection.close();
        } catch (Exception ex) {
        %>
        </font>
        <font size="+3" color="red"></b>
        <%
        out.println("Unable to connect to database.");
        }
        %>
        </TABLE>
        </font>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
</body>
</html>