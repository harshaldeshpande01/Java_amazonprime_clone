<%-- 
    Document   : welcome
    Created on : 23-May-2020, 10:21:26 AM
    Author     : HP
--%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Http 1.1
    response.setHeader("Pragma", "no-cache"); // Http 1.0
    response.setHeader("Expires", "0"); // Proxy server
    
    if(session.getAttribute("username") == null)
    {
        response.sendRedirect("index.jsp"); //session login user not back to index.jsp page or not type direct in url
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="CSS/style.css" />
    <title>Movies</title>
  </head>
  <body>
    <div class="container">
      <form>
        <div class="form-group">
          <input
            type="text"
            class="form-control"
            id="exampleInputEmail1"
            aria-describedby="emailHelp"
            placeholder="Search..."
          />
        </div>

        <button type="submit" class="btn" id="search">
          Search
        </button>
        <a class="link" href="Logout">Logout</a>
      </form>

      <div id="movies-searchable"></div>
      <div id="movies-container"></div>
    </div>

    <script src="Script/APItransaction.js"></script>
    <script src="Script/app.js"></script>
  </body>
</html>
