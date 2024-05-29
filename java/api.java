import java.sql.*;

public class api {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/locationvoiliers";
        String username = "jeff";
        String password = "toor";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "SHOW TABLES";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String tableName = rs.getString(1);
                System.out.println(tableName);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}