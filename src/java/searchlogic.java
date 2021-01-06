import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;

public class searchlogic extends HttpServlet 
{
  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try 
        {
           PrintWriter out = response.getWriter();
           
           String keyword = request.getParameter("keyword");
           
           String jsondata = new RDBMS_TO_JSON().generateJSON("select * from products where name like '%"+keyword+"%'");
           
           out.println(jsondata);
           
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }

}
