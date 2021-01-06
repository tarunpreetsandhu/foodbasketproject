
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
public class addproductgallery extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            PrintWriter out = response.getWriter();

         
            String caption = request.getParameter("caption");
            String pid = request.getParameter("pid");

            ResultSet rs = DBLoader.executequery("select * from productgallery");

            String absolutepath = request.getServletContext().getRealPath("/myuploads");
            Part filepart = request.getPart("myfile");
            String newname = System.currentTimeMillis() + "";
            String filename = FileUploader.savefileonserver(filepart, absolutepath, newname);

            String filepath = "myuploads/" + filename;

            

            rs.moveToInsertRow();
            rs.updateString("caption", caption);
            rs.updateString("pid", pid);
            rs.updateString("photo", filepath);

            rs.insertRow();

            out.println("success");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
