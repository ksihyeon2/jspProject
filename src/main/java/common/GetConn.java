package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaProject";
	private String user = "root";
	private String pwd = "1234";
	
	private static GetConn instance = new GetConn();
	
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패"+e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 연동 실패"+e.getMessage());
		}
	}
	
//	GetConn객체를 외부에서 연결해서 사용해주기 위한 메소드를 public선언자로 만들어준다.
	public Connection getConn() {
		return conn;
	}
	
	public static GetConn getInstance() {
		return instance;
	}
}
