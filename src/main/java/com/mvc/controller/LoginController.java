/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author HP
 */
public class LoginController extends HttpServlet {

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
        String pass=request.getParameter("txt_password"); 
        
        LoginBean loginBean=new LoginBean(); //this class contain seeting up all received values from index.jsp page to setter and getter method for application require effectively 
        loginBean.setUsername(uname); 
        loginBean.setPassword(pass);
        
        LoginDao dao = new LoginDao();
        boolean check = dao.check(loginBean);
        if(check) {
            HttpSession session = request.getSession();
            session.setAttribute("username",uname);
            if(uname.equals("Admin")) {
               response.sendRedirect("admin.jsp"); 
            }
            else {
               response.sendRedirect("welcome.jsp");   
            }
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

