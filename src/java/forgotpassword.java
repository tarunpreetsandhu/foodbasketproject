
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
                
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        
                        try {
                            String urlParameters = "username=harjot&password=UIIF6NMV&message=Your OTP is +" + otp + "&phone_numbers=" + rs.getString("phoneno");
                            byte[] postData = urlParameters.getBytes(StandardCharsets.UTF_8);
                            int postDataLength = postData.length;
                            String request = "http://server1.vmm.education/VMMCloudMessaging/AWS_SMS_Sender";
                            URL url = new URL(request);
                            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                            conn.setDoOutput(true);
                            conn.setInstanceFollowRedirects(false);
                            conn.setRequestMethod("POST");
                            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                            conn.setRequestProperty("charset", "utf-8");
                            conn.setRequestProperty("Content-Length", Integer.toString(postDataLength));
                            conn.setUseCaches(false);
                            try (DataOutputStream wr = new DataOutputStream(conn.getOutputStream())) {
                                wr.write(postData);
                            }
                            DataInputStream dis = new DataInputStream(conn.getInputStream());
                            while (true) {
                                String s = dis.readLine();
                                if (s == null) {
                                    break;
                                }
                                System.out.println(s);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }).start();
                
                out.println(otp);
                
            } else {
                out.println("fail");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
