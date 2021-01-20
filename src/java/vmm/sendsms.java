
package vmm;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;


public class sendsms {
    
    public void send(String message,String phoneno)
    {
        
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        
                        try {
                            String urlParameters = "username=harjot&password=UIIF6NMV&message="+message + "&phone_numbers=" + phoneno;
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
    }
    
}
