package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	GuestVO vo = null;
	
	public GuestDAO() {
		String url = "jdbc:mysql://localhost:3306/javaProject";
		String user = "root";
		String pwd = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pwd);
			} catch (ClassNotFoundException e) {
			System.out.println("Driver 검색 실패 : " + e.getMessage());
		} catch (SQLException e) {
				System.out.println("DB 연동 실패 : " + e.getMessage());
			}
	}
	
	public void connClose() {
		try {
			conn.close();
		} catch (SQLException e) {}
	}
	
	public void pstmtClose() {
		try {
			if(pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {}
	}
	
	public void rsClose() {
		try {
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {}
		pstmtClose();
	}

//	방명록 전체 리스트
	public ArrayList<GuestVO> getGuestList() {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setHostIp(rs.getString("hostIp"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 :" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
}
