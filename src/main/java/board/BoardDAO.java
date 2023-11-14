package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class BoardDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	BoardVO vo = null;
	
//pstmt 객체 반납
	public void pstmtClose() {
		try {
			if(pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {}
	}
	
//rs 객체 반납
	public void rsClose() {
		try {
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {}
		pstmtClose();
	}

//	게시판 전체 리스트
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "select * from board order by idx desc limit ?,?";
//			limit 시작, 건 수
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

//	게시글 저장
	public int setBoardInputOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values (default,?,?,?,?,?,?,default,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getHomePage());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getHostIp());
			pstmt.setString(8, vo.getOpenSw());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
//	전체 게시글의 건 수 구해오기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

//	게시물 한 건 상세보기
	public BoardVO getBoardContent(int idx) {
		vo = new BoardVO();
		try {
			sql = "select * from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

//	조회수 1씩 증가 시키기
	public void setBoardReadNumPlus(int idx) {
		try {
			sql = "update board set readNum = readNum+1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			pstmtClose();
		}
	}

//	좋아요 수 1씩 증가 시키기(중복 불허)
	public int setBoardGoodCheck(int idx) {
		int res = 0;
		try {
			sql = "update board set good = good+1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
//	좋아요 수 1씩 증가 시키기(중복 허용)
	public int setBoardGoodCheckPlus(int idx) {
		int res = 0;
		try {
			sql = "update board set good = good+1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
//	좋아요 수 1씩 감소 시키기(중복 허용)
	public int setBoardGoodCheckMinus(int idx) {
		int res = 0;
		try {
			sql = "update board set good = good-1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

// 게시글 수정
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "update board set title=?, email=?, homePage=?,content=?, hostIp=?, openSw=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomePage());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setString(6, vo.getOpenSw());
			pstmt.setInt(7, vo.getIdx());		
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

//	게시물 삭제
	public int setBoardDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " +e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}


}
