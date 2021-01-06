import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class merchantlogout extends HttpServlet 
{
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        request.getSession().removeAttribute("mid");
        response.sendRedirect("index.jsp");
    }

}
