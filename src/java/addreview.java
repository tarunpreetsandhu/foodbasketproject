
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.DBLoader;

public class addreview extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            if (request.getSession().getAttribute("username") != null) {

                String username = request.getSession().getAttribute("username").toString();
                String rating = request.getParameter("rating");
                String review = request.getParameter("review");
                String pid = request.getParameter("pid");

                ResultSet rs = DBLoader.executequery("select * from ratings");

                rs.moveToInsertRow();
                rs.updateString("review", review);
                rs.updateInt("rating", Integer.parseInt(rating));
                rs.updateInt("pid", Integer.parseInt(pid));
                rs.updateString("username", username);

                rs.insertRow();
                out.println("success");
            } else {
                out.println("notloggedin");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
