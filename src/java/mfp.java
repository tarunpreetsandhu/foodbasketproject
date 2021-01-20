
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;
import vmm.sendsms;

public class mfp extends HttpServlet {

  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            PrintWriter out = response.getWriter();
            
            String mid = request.getParameter("mid");
            
            ResultSet rs = DBLoader.executequery("select * from merchants where mid='" + mid + "'");
            if (rs.next()) {
                int otp = (int) (999 + (10000 - 999) * Math.random());
                
                new sendsms().send("Your OTP is +" + otp, rs.getString("phoneno"));
              
                out.println(otp);
                
            } else {
                out.println("fail");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
