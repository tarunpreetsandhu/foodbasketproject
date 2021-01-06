import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm2.FileUploader;

@MultipartConfig
public class addcategory extends HttpServlet

{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        try 
        {

            PrintWriter out = response.getWriter();

            String categoryname = request.getParameter("categoryname");
            String description = request.getParameter("description");
           
            ResultSet rs = DBLoader.executequery("select * from categories where categoryname='"+categoryname+"'");

            if (rs.next())
            {

                out.println("alreadyexist");
            } 
            else 
            {

               String absolutepath= request.getServletContext().getRealPath("/myuploads");
               Part filepart= request.getPart("myfile");
               String newname=System.currentTimeMillis()+"";
               String filename=FileUploader.savefileonserver(filepart, absolutepath, newname);
               
               String filepath="myuploads/"+filename;
               
               rs.moveToInsertRow();
               rs.updateString("categoryname", categoryname);
               rs.updateString("description", description);
               rs.updateString("photo", filepath);
               rs.insertRow();
               
               out.println("success");
               
            }

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

    }

}
