import java.io.*;
import java.sql.*;
import vmm.DBLoader;
import javax.servlet.*;
import javax.servlet.http.*;

public class deletecartitem extends HttpServlet 
{
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try 
        {
           PrintWriter out = response.getWriter();
           String cid = request.getParameter("cid");
           
           ResultSet rs = DBLoader.executequery("select * from cart where cid ='"+cid+"'");
           
           if(rs.next())
           {
                rs.deleteRow();
                out.println("success");
           }
           else
           {
                out.println("failed");
           }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}
