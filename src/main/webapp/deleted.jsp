<%-- 
    Document   : deleted
    Created on : 26-May-2020, 11:51:48 AM
    Author     : HP
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>
            Deleted Page
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body style="background-color: #1a202c">
        <nav class="navbar navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Admin</a>
        <form action="Logout">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Logout</button>
        </form>
        </nav>
        <%
        String id = request.getParameter("id");
        try {
        String connectionURL = "jdbc:mysql://localhost:3306/awp";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionURL, "root", "root");
        statement = connection.createStatement();
        String sql = "DELETE FROM users " +
                   "WHERE id =" + id;
        int i = statement.executeUpdate(sql); 
        statement.close();
        connection.close();
        } catch (Exception ex) {
        %>
        <font size="+3" color="red"></b>
        <%
        out.println("Unable to connect to database.");
        }
        %>
        </font>
        <center>
        <h4 style="margin-top: 100px" class="text-white" >User with id = <%=request.getParameter("id")%> has been deleted from database !</h4>
        <a href =" admin.jsp">Go back ?</a>
        </center>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>     
        
</html>