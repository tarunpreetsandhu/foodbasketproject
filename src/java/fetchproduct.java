
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.RDBMS_TO_JSON;

public class fetchproduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String mid = request.getSession().getAttribute("mid").toString();

            PrintWriter out = response.getWriter();
            String jsondata = new RDBMS_TO_JSON().generateJSON("select * from products where mid=" + mid);
            out.println(jsondata);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
