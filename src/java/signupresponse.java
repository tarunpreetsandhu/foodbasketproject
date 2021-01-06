import java.io.*;
import java.sql.*;
import vmm.DBLoader;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm2.FileUploader;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class signupresponse extends HttpServlet 
{
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try 
        {
           PrintWriter out = response.getWriter();
           String username = request.getParameter("username");
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           String phoneno = request.getParameter("phoneno");
           
           String absolutepath = request.getServletContext().getRealPath("/myuploads");
           Part filepart = request.getPart("userphoto");
           String filename = FileUploader.savefileonserver(filepart, absolutepath);
           
           String filepath = "myuploads/" + filename;
           
           ResultSet rs = DBLoader.executequery("select * from users where username ='"+username+"'");
        
           if(rs.next())
           {
                out.println("FAIL!!!");
           }
           else
           {
               rs.moveToInsertRow();
               rs.updateString("username", username);
               rs.updateString("password", password);
               rs.updateString("phoneno", phoneno);
               rs.updateString("email", email);
               rs.updateString("photo", filepath);
               rs.insertRow();
               out.println("SUCCESS!!!");
           }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}
