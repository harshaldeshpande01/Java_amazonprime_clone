/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.RegisterBean;
import java.sql.*;
/**
 *
 * @author HP
 */
public class RegisterDao {
    
    String query = "insert into users(uname,pass,email) values(?,?,?)";
    
    public boolean insertUser(RegisterBean registerBean) {
        
        String username=registerBean.getUsername();
        String email=registerBean.getEmail();
        String password=registerBean.getPassword();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","root");
            PreparedStatement st=conn.prepareStatement(query);
            st.setString(1,username);
            st.setString(2,password);
            st.setString(3,email);
            int i = st.executeUpdate();
            st.close();
            conn.close();
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }
    
}
