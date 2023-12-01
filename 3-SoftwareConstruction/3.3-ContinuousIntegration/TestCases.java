import java.sql.*;
import oracle.jdbc.driver.*;

public class TestCases {
    public static void main(String[] args) {
        int testCaseResult = 0; // 0 = Passed, -1 = Failed

        try {
            // Load Oracle JDBC driver
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

            // Open connection to the database
            Connection connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@185.235.218.67:1521/XEPDB1",
                    args[0], // get login as 1st command line parameter
                    args[1]); // get password as 2nd command line parameter

            // Prepare the PL/SQL call for the function
            CallableStatement callableStatement = connection.prepareCall("{? = call observeHumidity(?,?,?,?,?)}");
            callableStatement.registerOutParameter(1, Types.VARCHAR);

            // Test Case 1.1: Correct test
            System.out.print("TC1.1: ");
            callableStatement.setInt(2, 20);
            callableStatement.setInt(3, 7);
            callableStatement.setInt(4, 20);
            callableStatement.setInt(5, 0);
            callableStatement.setInt(6, -10);
            callableStatement.setInt(7, 5);

            callableStatement.executeUpdate();

            // Analyze TestCase-result
            if ("1".equals(callableStatement.getString(1))) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // Clear parameters for the next test case
            callableStatement.clearParameters();

            // Test Case 1.2: Temperature out of bounds
            System.out.print("TC1.2: ");
            callableStatement.setInt(2, 52);
            callableStatement.setInt(3, 7);
            callableStatement.setInt(4, 20);
            callableStatement.setInt(5, 0);
            callableStatement.setInt(6, -10);
            callableStatement.setInt(7, 5);

            callableStatement.executeUpdate();

            // Analyze TestCase-result
            if ("Значення параметрів виходять за допустимі межі".equals(callableStatement.getString(1))) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // Clear parameters for the next test case
            callableStatement.clearParameters();

            // Test Case 1.3: Elasticity out of bounds
            System.out.print("TC1.3: ");
            callableStatement.setInt(2, 20);
            callableStatement.setInt(3, 0);
            callableStatement.setInt(4, 20);
            callableStatement.setInt(5, 0);
            callableStatement.setInt(6, -10);
            callableStatement.setInt(7, 5);

            callableStatement.executeUpdate();

            // Analyze TestCase-result
            if ("Значення параметрів виходять за допустимі межі".equals(callableStatement.getString(1))) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // Clear parameters for the next test case
            callableStatement.clearParameters();

            // Repeat the above structure for TC1.4, TC1.5, TC1.6, and TC1.7...

            // Test Case 1.4: Relative humidity out of bounds
            System.out.print("TC1.4: ");
            callableStatement.setInt(2, 20);
            callableStatement.setInt(3, 7);
            callableStatement.setInt(4, 120);
            callableStatement.setInt(5, 0);
            callableStatement.setInt(6, -10);
            callableStatement.setInt(7, 5);

            callableStatement.executeUpdate();

            // Analyze TestCase-result
            if ("Значення параметрів виходять за допустимі межі".equals(callableStatement.getString(1))) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // Clear parameters for the next test case
            callableStatement.clearParameters();

            // Test Case 1.5: Wet bulb deficit less than 0
            System.out.print("TC1.5: ");
            callableStatement.setInt(2, 20);
            callableStatement.setInt(3, 7);
            callableStatement.setInt(4, 20);
            callableStatement.setInt(5, -5);
            callableStatement.setInt(6, -10);
            callableStatement.setInt(7, 5);

            callableStatement.executeUpdate();

            // Analyze TestCase-result
            if ("Значення параметрів виходять за допустимі межі".equals(callableStatement.getString(1))) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // Clear parameters for the next test case
            callableStatement.clearParameters();

            // Repeat the above structure for TC1.6 and TC1.7...

            // Test Case 1.6: Dew point out of bounds
            System.out.print("TC1.6: ");
            callableStatement.setInt(2, 20);
            callableStatement.setInt(3, 7);
            callableStatement.setInt(4, 20);
            callableStatement.setInt(5, 0);
            callableStatement.setInt(6, 111111);
            callableStatement.setInt(7, 5);

            callableStatement.executeUpdate();

            // Analyze TestCase-result
            if ("Значення параметрів виходять за допустимі межі".equals(callableStatement.getString(1))) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // Clear parameters for the next test case
            callableStatement.clearParameters();

            // Test Case 1.7: Sensible temperature out of bounds
            System.out.print("TC1.7: ");
            callableStatement.setInt(2, 20);
            callableStatement.setInt(3, 7);
            callableStatement.setInt(4, 20);
            callableStatement.setInt(5, 0);
            callableStatement.setInt(6, -10);
            callableStatement.setInt(7, 111111);

            callableStatement.executeUpdate();

            // Analyze TestCase-result
            if ("Значення параметрів виходять за допустимі межі".equals(callableStatement.getString(1))) {
                System.out.println("Passed");
            } else {
                System.out.println("Failed");
                testCaseResult = -1;
            }

            // Clear parameters for the next test case
            callableStatement.clearParameters();

            // Close the connection
            connection.close();

        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        }

        System.exit(testCaseResult);
    }
}
