package study2.apiTest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

public class ApiDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	String sql = "";
	
	private ApiVO vo = null;

	// DAO객체의 생성과 동시에 DB 접속처리 한다.
	public ApiDAO() {
		String url = "jdbc:mysql://localhost:3306/javaProject";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~~" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("Database 연동 실패~~");
		}
	}
	
	// 사용한 객체의 반납(conn 객체 반납)
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
	}
	
	// pstmt 객체 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	// rs 객체 반납
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}

//	범죄자 등록
	public void setSaveCrimeData(ApiVO vo) {
		try {
			sql = "insert into crime values(default,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getYear());
			pstmt.setString(2, vo.getPolice());
			pstmt.setInt(3, vo.getRobbery());
			pstmt.setInt(4, vo.getMurder());
			pstmt.setInt(5, vo.getTheft());
			pstmt.setInt(6, vo.getViolence());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

//	년도별 list
	public int getSearchYear(int year) {
		int res = 0;
		try {
			sql = "select * from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}
	
//	범죄자 등록 삭제
	public int setDeleteCrimeDate(int year) {
		int res = 0;
		try {
			sql = "delete from crime where year=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

//	년도별 리스트 찾기
	public ArrayList<ApiVO> getSearchList(int year) {
		ArrayList<ApiVO> vos = new ArrayList<ApiVO>();
		try {
			sql = "select * from crime where year=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ApiVO vo = new ApiVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setRobbery(rs.getInt("robbery"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("violence"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

//	경찰서 지역 찾기
	public ArrayList<ApiVO> getPoliceCheck(String police) {
		ArrayList<ApiVO> vos = new ArrayList<ApiVO>();
		try {
			sql = "select * from crime where police like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+police+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ApiVO vo = new ApiVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setRobbery(rs.getInt("robbery"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("violence"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public ApiVO getAnalyze(int year) {
		vo = new ApiVO();
		try {
			sql = "select year, sum(robbery) as totRobbery, sum(murder) as totMurder, sum(theft) as totTheft, sum(violence) as totViolence, avg(robbery) as avgRobbery, "
					+ "avg(murder) as avgMurder, avg(theft) as avgTheft, avg(violence) as avgViolence from crime where year=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setYear(rs.getInt("year"));
				vo.setTotRobbery(rs.getInt("totRobbery"));
				vo.setTotMurder(rs.getInt("totMurder"));
				vo.setTotTheft(rs.getInt("totTheft"));
				vo.setTotViolence(rs.getInt("totViolence"));
				vo.setAvgRobbery(rs.getInt("avgRobbery"));
				vo.setAvgMurder(rs.getInt("avgMurder"));
				vo.setAvgTheft(rs.getInt("avgtheft"));
				vo.setAvgViolence(rs.getInt("avgViolence"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	public ApiVO getPoliceAnalyze(String police) {
		vo = new ApiVO();
		try {
			sql = "select year, sum(robbery) as totRobbery, sum(murder) as totMurder, sum(theft) as totTheft, sum(violence) as totViolence, avg(robbery) as avgRobbery, "
					+ "avg(murder) as avgMurder, avg(theft) as avgTheft, avg(violence) as avgViolence from crime where police=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+police+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setYear(rs.getInt("year"));
				vo.setTotRobbery(rs.getInt("totRobbery"));
				vo.setTotMurder(rs.getInt("totMurder"));
				vo.setTotTheft(rs.getInt("totTheft"));
				vo.setTotViolence(rs.getInt("totViolence"));
				vo.setAvgRobbery(rs.getInt("avgRobbery"));
				vo.setAvgMurder(rs.getInt("avgMurder"));
				vo.setAvgTheft(rs.getInt("avgtheft"));
				vo.setAvgViolence(rs.getInt("avgViolence"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

}
