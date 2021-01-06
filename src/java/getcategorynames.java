import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.RDBMS_TO_JSON;

public class getcategorynames extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try 
        {
           PrintWriter out = response.getWriter();
           String jsondata = new RDBMS_TO_JSON().generateJSON("select categoryname from categories");
           out.println(jsondata);
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

   

}
