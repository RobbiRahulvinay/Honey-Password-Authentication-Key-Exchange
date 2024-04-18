/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Efficient;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import databaseconnection.databasecon;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Upload extends HttpServlet {

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection co;
            PreparedStatement pstm = null;  
            PreparedStatement pstm1 = null;
             String username = "";
             String password1 = "";
             String gen = "";
            String dt = "";
            String mobile = "";
            String email = "";
            String address = "";
            String filename = "";
          //  String email = (String) request.getSession().getAttribute("email");
            try {
                boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
                if (!isMultipartContent) {
                    return;
                } 
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
    List<FileItem> fields = upload.parseRequest(request);
    Iterator<FileItem> it = fields.iterator();
    if (!it.hasNext()) {
    return;
    }
    while (it.hasNext()) {
    FileItem fileItem = it.next();
    if (fileItem.getFieldName().equals("username")) {
    username = fileItem.getString();
    System.out.println("username" + username);
    }

    if (fileItem.getFieldName().equals("password1")) {
    password1 = fileItem.getString();
    System.out.println("password" + password1);
    }
    
    if (fileItem.getFieldName().equals("gen")) {
    gen = fileItem.getString();
    System.out.println("gen" + username);
    }
    
    if (fileItem.getFieldName().equals("dt")) {
    dt = fileItem.getString();
    System.out.println("dt" + dt);
    }
    
    if (fileItem.getFieldName().equals("mobile")) {
    mobile = fileItem.getString();
    System.out.println("mobile" + mobile);
    }
    
    if (fileItem.getFieldName().equals("email")) {
    email = fileItem.getString();
    System.out.println("email" + email);
    }
    
    if (fileItem.getFieldName().equals("address")) {
    address = fileItem.getString();
    System.out.println("address" + address);
    }
    
    if (fileItem.getFieldName().equals("filename")) {
    filename = fileItem.getString();
    System.out.println("filename" + filename);
    }
    
    
    else {

    }
    boolean isFormField = fileItem.isFormField();
    if (isFormField) {
    } else {
    try {
    co = databasecon.getconnection();
    pstm = co.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?,?)");
   
    System.out.println("getD " + fileItem.getName());
    String str = getStringFromInputStream(fileItem.getInputStream());
   
    KeyGenerator keyGen = KeyGenerator.getInstance("AES");
    keyGen.init(128);
    SecretKey secretKey = keyGen.generateKey();
    System.out.println("secret key:" + secretKey);
   
     byte[] be = secretKey.getEncoded();//encoding secretkey
     String skey = Base64.encode(be);
     
      String cipher = new encryption().encrypt(str, secretKey);
    
     pstm.setString(1, username);
     pstm.setString(2, password1);
     pstm.setString(3,gen);
     pstm.setString(4,dt);
      pstm.setString(5,mobile);
       pstm.setString(6,email);
        pstm.setString(7,address);
         pstm.setString(8,"Normal");
          pstm.setString(9,skey);
         pstm.setString(10,cipher);
         pstm.setString(11,str);
   //  pstm.setString(4,"Pending");
 
   
    
     int i = pstm.executeUpdate();
     if (i == 1) {
         response.sendRedirect("user.jsp?m1=success");
     } else {
         response.sendRedirect("userreg.jsp?msg1=failed");
     }
     
     
     co.close();
    } catch (Exception e) {
     out.println(e.toString());
    }
    }
    }
    } catch (FileUploadException e) {
    } catch (Exception ex) {
    Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
    }
    } finally {
        out.close();
    }
    }
    }

    private static String getStringFromInputStream(InputStream is) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                }
            }
        }
        return sb.toString();
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

    private long[] splitToNChar(String str, int len) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
