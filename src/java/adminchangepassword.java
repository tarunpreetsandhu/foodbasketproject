
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class adminchangepassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String username = request.getParameter("username");
            String opassword = request.getParameter("opassword");
            String npassword = request.getParameter("npassword");

            ResultSet rs = DBLoader.executequery("select * from admin where username='" + username + "'and password='" + opassword + "'");

            if (rs.next()) {
              
                rs.updateString("password", npassword);
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
