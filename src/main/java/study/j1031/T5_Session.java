package study.j1031;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet ("/j1031/t5_Session")
public class T5_Session extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("sMid", mid);
		
		response.sendRedirect(request.getContextPath()+"/study/1031_storage/t5_SessionTest.jsp");
	}
}
