/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.UpdateBean;
import java.sql.*;

/**
 *
 * @author HP
 */
public class UpdateDao {
    
    String query = "update users set uname=?,email=? where id=?";
    
    public boolean Update(UpdateBean bean) {
        
        String username=bean.getUsername();
        String email=bean.getEmail(); 
        String id = bean.getId();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","root");
            PreparedStatement st=conn.prepareStatement(query);
            st.setString(1,username);
            st.setString(2,email);
            st.setString(3,id);
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
