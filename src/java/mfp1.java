/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

/**
 *
 * @author ASUS
 */
public class mfp1 extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            PrintWriter out = response.getWriter();
            String np = request.getParameter("np");
            String cp = request.getParameter("cp");
            String mid = request.getParameter("mid");
            ResultSet rs = DBLoader.executequery("select * from merchants where mid='" + mid + "'");

            if (rs.next()) {
                rs.updateString("password", np);
                rs.updateRow();
                out.println("success");
            } else {
                out.println("fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
