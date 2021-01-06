
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
public class addproduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            PrintWriter out = response.getWriter();

            String productname = request.getParameter("productname");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String offerprice = request.getParameter("offerprice");
            String brand = request.getParameter("brand");
            String categoryname = request.getParameter("categoryname");

            ResultSet rs = DBLoader.executequery("select * from products ");

            String absolutepath = request.getServletContext().getRealPath("/myuploads");
            Part filepart = request.getPart("myfile");
            String newname = System.currentTimeMillis() + "";
            String filename = FileUploader.savefileonserver(filepart, absolutepath, newname);

            String filepath = "myuploads/" + filename;

            String mid = request.getSession().getAttribute("mid").toString();

            rs.moveToInsertRow();
            rs.updateString("name", productname);
            rs.updateString("categoryname", categoryname);
            rs.updateString("brand", brand);
            rs.updateString("description", description);
            rs.updateInt("mid", Integer.parseInt(mid));

            rs.updateString("photo", filepath);
            rs.updateInt("price", Integer.parseInt(price));
            rs.updateInt("offerprice", Integer.parseInt(offerprice));
            rs.insertRow();

            out.println("success");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
