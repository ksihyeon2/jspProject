package study.j1030;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/j1030/loginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String mSw = "";
		
		//DB에서 회원인증처리 한다. (현재 DB연결 안 되어 있어서 이곳에서 아이디=admin, 비밀번호=1234로 체크)
		if((mid.equals("admin") && pwd.equals("1234")) || mid.equals("hkd1234") && pwd.equals("1234")) {
			mSw = "Ok";
		} else {
			mSw = "No";
		}
		
		response.sendRedirect(request.getContextPath()+"/study/1030/main.jsp?mid="+mid+"&mSw="+mSw);
	}
}
