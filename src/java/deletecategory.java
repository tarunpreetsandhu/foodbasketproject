
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class deletecategory extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try 
        {
            PrintWriter out = response.getWriter();

            String categoryname = request.getParameter("categoryname");

            ResultSet rs = DBLoader.executequery("select * from categories where categoryname='" + categoryname + "'");

            if (rs.next()) 
            {
                rs.deleteRow();
                out.println("success");
            } 
            else
            {
                out.println("fail");
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }

}
