import java.io.*;
import java.sql.ResultSet;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;

public class placeorder extends HttpServlet 
{
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
    {
        
        PrintWriter out = response.getWriter();
        String address =request.getParameter("address");
        String city =request.getParameter("city");
        String number =request.getParameter("number");
        String name = request.getParameter("name");
        String username = request.getSession().getAttribute("username").toString();
        
        Date d=new Date();
        
        int totalprice=0;
        
        ResultSet rs= DBLoader.executequery("select * from cart where username='"+username+"'");
        
        while(rs.next())
        {
        int price = rs.getInt("price");
        int qty = rs.getInt("qty");
        totalprice+=(price*qty);
       }
        ResultSet rs1 = DBLoader.executequery("select * from orders");
        
        rs1.moveToInsertRow();
        rs1.updateString("address", address);
        rs1.updateString("city", city);
        rs1.updateString("username", username);
        rs1.updateString("datetime", d+"");
        rs1.updateInt("totalprice", totalprice);
        rs1.updateInt("totalofferprice", totalprice);
        rs1.insertRow();
        
        ResultSet rs2 = DBLoader.executequery("select MAX(oid) as max from orders");
        rs2.next();
        int max = rs2.getInt("max");
        
        ResultSet rs3 = DBLoader.executequery("select * from cart where username='"+username+"'");
        while(rs3.next())
        {
        int pid = rs3.getInt("pid");
        int qty = rs3.getInt("qty");
        int price = rs3.getInt("price");
       
        ResultSet rs4=DBLoader.executequery("select * from orderdetails");
        rs4.moveToInsertRow();
        rs4.updateInt("pid", pid);
        rs4.updateInt("oid", max);
        rs4.updateInt("price", price);
        rs4.updateInt("offerprice", price);
        rs4.updateInt("qty", qty);
        
        rs4.insertRow();
    
        rs3.deleteRow();
        }
        out.println("success");
        
    }
    catch(Exception e)
    {
    e.printStackTrace();
    }
    }

}
