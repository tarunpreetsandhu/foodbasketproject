
import java.io.*;
import java.sql.*;
import vmm.DBLoader;
import javax.servlet.*;
import javax.servlet.http.*;

public class merchantsignin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String mid = request.getParameter("mid");
            String password = request.getParameter("password");

            ResultSet rs = DBLoader.executequery("select * from merchants where mid ='" + mid + "'and password='" + password + "'");
            HttpSession session = request.getSession();

            if (rs.next()) {
                String status = rs.getString("status");
                if (status.equals("active")) {

                    session.setAttribute("mid", mid);
                    out.println("success");
                } else {
                    out.println("pending");

                }
            } else {
                out.println("fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
