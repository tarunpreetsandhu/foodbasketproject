
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
import vmm.DBLoader;
import java.sql.*;
import vmm.sendsms;

public class forgotpassword extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            PrintWriter out = response.getWriter();
            
            String username = request.getParameter("username");
            
            ResultSet rs = DBLoader.executequery("select * from users where username='" + username + "'");
            if (rs.next()) {
                int otp = (int) (999 + (10000 - 999) * Math.random());
                
                new sendsms().send("Your OTP is +" + otp, rs.getString("phoneno"));
            //hello    
                out.println(otp);
                
            } else {
                out.println("fail");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
