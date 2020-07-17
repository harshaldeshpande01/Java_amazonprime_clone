/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.LoginBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author HP
 */
public class LoginDao {
    
    String query = "select * from users where uname=? and pass=?";
    
    public boolean check(LoginBean loginBean) {
        
        String username=loginBean.getUsername();
        String password=loginBean.getPassword();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","root");
            PreparedStatement st=conn.prepareStatement(query);
            st.setString(1,username);
            st.setString(2,password);
            ResultSet rs=st.executeQuery();
            if(rs.next()) {
                return true;
            }
            st.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }
    
}
