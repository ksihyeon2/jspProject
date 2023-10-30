package study.j1030;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/j1030/logout")
public class Logout extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = request.getParameter("mid");
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('"+mid+"님 로그아웃 되셨습니다.');");
		out.println("location.href='"+request.getContextPath()+"/study/1030/login.jsp'");
		out.println("</script>");
		
	}
}
