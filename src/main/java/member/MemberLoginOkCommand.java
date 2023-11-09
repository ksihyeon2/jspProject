package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(!vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디를 다시 확인 후 로그인 해주세요.");
			request.setAttribute("url", "memberLoing.mem");
			return;
		}
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호를 다시 확인 후 로그인 해주세요.");
			request.setAttribute("url", "memberLoing.mem");
			return;
		}
		
//		로그인 성공시 처리할 내용(1.세션 저장, 2.쿠키 저장, 3.방문횟수(총방문횟수,오늘방문횟수), 4.포인트 누적 .. )
		String strLevel = "";
		if(vo.getLevel() == 0) {
			strLevel = "관리자";
		} else if (vo.getLevel() == 1) {
			strLevel = "준회원";
		} else if (vo.getLevel() == 2) {
			strLevel = "정회원";
		} else if (vo.getLevel() == 3) {
			strLevel = "우수회원";			
		}

		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("strLevel", strLevel);
		
//		처리 완료 후 메세지 출력 후 회원 메인창으로 전송한다.
		request.setAttribute("msg", vo.getNickName() + "님 환영합니다.");
		request.setAttribute("url", "memberMain.mem");
		
	}
}
