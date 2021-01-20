
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;
import vmm.sendsms;

public class changestatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            String mid = request.getParameter("mid");
            String status = request.getParameter("status");

            ResultSet rs = DBLoader.executequery("select * from merchants where mid='" + mid + "'");
 
            rs.next();
            rs.updateString("status", status);
            rs.updateRow();

            out.println("success");

            
            if (status.equals("active")) {
                new sendsms().send("Your account has been approved by Admin. You can now login with your ID " + rs.getString("mid"), rs.getString("phoneno"));
           
            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
