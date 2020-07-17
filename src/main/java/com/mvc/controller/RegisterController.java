/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.PasswordHash;
import com.mvc.dao.RegisterDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 *
 * @author HP
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname=request.getParameter("txt_username");
        String email=request.getParameter("txt_email");   
        String pass=request.getParameter("txt_password");
        
//        PasswordHash hash = new PasswordHash();
//        byte[] salt = hash.getSalt();
//         
//        String securePassword = hash.get_SHA_1_SecurePassword(pass, salt);
//        System.out.println(securePassword);
        
        RegisterBean registerBean=new RegisterBean(); //this class contain  seeting up all received values from register.jsp page to setter and getter method for application require effectively
        registerBean.setUsername(uname);
        registerBean.setEmail(email);
        registerBean.setPassword(pass);
        
        RegisterDao dao = new RegisterDao();
        boolean check = dao.insertUser(registerBean);
        if(check) {
            response.sendRedirect("postRegistration.jsp");
        }
        else{
            response.sendRedirect("failedLogin.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

