import java.io.*;
import java.sql.*;
import vmm.DBLoader;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminloginresponse extends HttpServlet 
{
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try 
        {
           PrintWriter out = response.getWriter();
           String username = request.getParameter("username");
           String password = request.getParameter("password");
           
           ResultSet rs = DBLoader.executequery("select * from admin where username ='"+username+"'and password='"+password+"'");
           HttpSession session = request.getSession();
           
           if(rs.next())
           {
                session.setAttribute("adminusername", username);
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
