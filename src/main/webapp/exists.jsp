<%-- 
    Document   : exists
    Created on : 24-May-2020, 12:13:49 PM
    Author     : HP
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp", "root", "root");
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM users WHERE " +
                    "uname = ?");
            ps.setString(1,request.getParameter("username"));
            ResultSet res = ps.executeQuery();
            if(res.first()){
                out.print("User name is taken !!");
            }else{
                out.print("");
            }
        }catch (Exception e){
            System.out.println(e);  
        }
%>

