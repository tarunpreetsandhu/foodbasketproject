import java.io.*;
import java.sql.*;
import vmm.DBLoader;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm2.FileUploader;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class merchantsignupresponse extends HttpServlet 
{
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try 
        {
           PrintWriter out = response.getWriter();
           String name = request.getParameter("name");
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           String phoneno = request.getParameter("phoneno");
           String address = request.getParameter("address");
           String city = request.getParameter("city");
           
           String absolutepath = request.getServletContext().getRealPath("/myuploads");
           Part filepart = request.getPart("myfile");
           String filename = FileUploader.savefileonserver(filepart, absolutepath);
           
           String filepath = "myuploads/" + filename;
           
           ResultSet rs = DBLoader.executequery("select * from merchants" );
              
               rs.moveToInsertRow();
               rs.updateString("name", name);
               rs.updateString("password", password);
               rs.updateString("phoneno", phoneno);
               rs.updateString("email", email);
               rs.updateString("address", address);
               rs.updateString("city", city);
               rs.updateString("photo", filepath);
               rs.insertRow();
               out.println("success");
     
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}
