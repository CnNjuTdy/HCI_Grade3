package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	public static Connection getConn(){
		Connection conn = null;
		try{		
			Class.forName("com.mysql.jdbc.Driver");
//			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/elsdb?", "root", "");
//			conn = DriverManager.getConnection("jdbc:mysql://114.212.42.64:3306/?user=root&useSSL=false", "root", "123456");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hci?user=root&useSSL=false", "root", "8888");


		}catch (Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn){
		if (conn != null){
			try{
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	
}
