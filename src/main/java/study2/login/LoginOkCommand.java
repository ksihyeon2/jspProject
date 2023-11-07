package study2.login;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		if(vo.getMid() != null) {
		// 날짜 비교
					Date today = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String strToday = sdf.format(today);
//					System.out.println("strToday" + strToday);
					
					if(strToday.equals(vo.getLastDate().substring(0,10))) {
//						오늘 다시 방문한 경우
						vo.setTodayCount(vo.getTodayCount()+1);
						if(vo.getTodayCount() <= 5) vo.setPoint(vo.getPoint()+10);
					}
					else {
//						오늘 처음 방문한 경우
						vo.setTodayCount(1);
						vo.setPoint(vo.getPoint()+10);
					}
					
					// 3.DB작업(변경된 내용들을 DB에 저장(갱신))
					dao.setLoginUpdate(vo);
					
					// 1.세션처리
					HttpSession session = request.getSession();
					session.setAttribute("sMid", mid);
					session.setAttribute("sName", vo.getName());
					session.setAttribute("sPoint", vo.getPoint());
					session.setAttribute("sLastDate", vo.getLastDate());
					session.setAttribute("sTodayCount", vo.getTodayCount());
					
					
					// 2.쿠키저장
					String idSave = request.getParameter("idSave")==null ? "off" : "on";
					Cookie cookieMid = new Cookie("cMid", mid);
					cookieMid.setPath("/");
					if(idSave.equals("on")) {
						cookieMid.setMaxAge(60*60*24*7);
					}
					else {
						cookieMid.setMaxAge(0);
					}
					response.addCookie(cookieMid);
			
//			메세지 처리
			request.setAttribute("msg", vo.getName() + "님 로그인 되셨습니다.");
			request.setAttribute("url", request.getContextPath()+"/memberMain.lo");
		}
		else {
			request.setAttribute("msg", "로그인에 실패하셨습니다. 다시 확인 후 로그인 해주세요.");
			request.setAttribute("url", request.getContextPath()+"/login.lo");			
		}
	}
}
