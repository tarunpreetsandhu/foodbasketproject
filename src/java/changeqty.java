import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class changeqty extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            PrintWriter out=response.getWriter();
            String cid=request.getParameter("cid");
            String type=request.getParameter("type");
            
            ResultSet rs=DBLoader.executequery("select * from cart where cid="+cid);
            
            if(rs.next())
            {
            if(type.equals("decrease"))
            {
                int qty = rs.getInt("qty");
                if(qty==1)
                {
                    rs.deleteRow();
                }
                else
                {
                    qty--;
                    rs.updateInt("qty", qty);
                    rs.updateRow();
                }
            }
            else
            {
                int qty=rs.getInt("qty");
                qty++;
                rs.updateInt("qty", qty);
                rs.updateRow();
            }
            
                out.println("success");
            
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }

}
