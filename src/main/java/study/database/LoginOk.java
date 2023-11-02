package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet ("/database/loginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		String mid = requset.getParameter("mid") == null ? "" : requset.getParameter("mid");
		String pwd = requset.getParameter("pwd") == null ? "" : requset.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid,pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) {
//			회원 인증 성공
//			1. 자주 사용하는 변수(객체) 세션에 저장(아이디, 성명, 닉네임 ..) 2. 쿠키에 아이디 저장 또는 제거
//			3. DB에 처리할 내용들(최종 방문 일, 포인트 누적, 오늘 방문 일수 누적 ..  )
			
//			방문 포인트 처리하기 (최종 접속일 / 방문카운트도 함께 업데이트 처리)
//			하루의 방문 포인트는 매번 10포인트씩. 단, 최대 50포인트 지급 인정
			
//		1. 세션처리
			HttpSession session = requset.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount());
			
//			2. 쿠키 저장
			
//			3. DB 작업
			
//			정상 로그인 체크 이후 모든 처리가 끝나면 정상처리 메세지 출력 후 memberMain.jsp로 보낸다.
			out.println("<script>");
			out.println("alert('"+vo.getName()+"님 로그인 되었습니다.')");
			out.println("location.href='"+requset.getContextPath()+"/study/database/memberMain.jsp'");
			out.println("</script>");
		} else {
//			회원 인증 실패시는 다시 로그인 창으로 보낸다.
			out.println("<script>");
			out.println("alert('로그인 실패<br />다시 확인 후 로그인 해주세요.')");
			out.println("location.href='"+requset.getContextPath()+"/study/database/login.jsp'");
			out.println("</script>");
		}
	}
}
