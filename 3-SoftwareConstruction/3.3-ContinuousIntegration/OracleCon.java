import java.sql.*;  
import oracle.jdbc.driver.*;

class OracleCon {
    public static void main(final String[] args) {
		try{  
            // load the driver class  
            DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            // create connection object
            Connection con=DriverManager.getConnection(  
                                  "jdbc:oracle:thin:@https://185.235.218.67:1521/XEPDB1",
				   			      args[0], // get login as 1th command line parameter
							      args[1]); // get password as 2nd command line parameter
            // create the statement object  
            Statement stmt=con.createStatement();   
            // execute query  
            ResultSet rs=stmt.executeQuery("select * from emp");  
		    // get result
            while(rs.next())  
                System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));    
            // close the connection object  
            con.close();  
        }
		catch(Exception e){ 
		    System.out.println(e);
		}  
    }    
}  

