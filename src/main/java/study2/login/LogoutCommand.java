package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginDAO;

public class LogoutCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		dao.connClose();
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		session.invalidate();
		
		request.setAttribute("msg", mid+"님 로그아웃 되셨습니다.");
		request.setAttribute("url", request.getContextPath()+"/login/login.lo");
	}
}
