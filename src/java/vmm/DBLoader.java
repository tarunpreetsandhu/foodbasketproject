package vmm;
import java.sql.*;
public class DBLoader
{
    public static ResultSet executequery(String sql)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully!!");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/foodbasket","root", "system");
            System.out.println("Connection build");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement created");
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("ResultSet created");
            return rs;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
}

