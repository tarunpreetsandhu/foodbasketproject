import java.io.*;
import java.sql.*;
import vmm.DBLoader;
import javax.servlet.*;
import javax.servlet.http.*;

public class addtocartlogic extends HttpServlet 
{
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try 
        {
           PrintWriter out = response.getWriter();
           String pid = request.getParameter("pid");
           String name = request.getParameter("name");
           String price = request.getParameter("price");
           HttpSession session = request.getSession();
           
           if(session.getAttribute("username")== null)
           {
           out.println("notloggedin");
           }
           else
           {
           String username = session.getAttribute("username").toString();
           
           ResultSet rs = DBLoader.executequery("select * from cart where pid='"+pid+"'and username ='"+username+"'");
         
           if(rs.next())
           {
               int qty= rs.getInt("qty");
               qty++;
               rs.updateInt("qty", qty);
               rs.updateRow();
           }
           else
           {
                rs.moveToInsertRow();
                rs.updateInt("pid", Integer.parseInt(pid));
                rs.updateString("productname", name);
                rs.updateInt("price", Integer.parseInt(price));
                rs.updateInt("qty", 1);
                rs.updateString("username",username);
                rs.insertRow();
                
           }
           out.println("success");
        } 
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
    }
