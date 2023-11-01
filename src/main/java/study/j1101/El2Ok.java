package study.j1101;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/j1101/el2Ok")
public class El2Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String[] hobbys = request.getParameterValues("hobby");
		// 배열의 기본값은 null 이기 때문에 null값 체크 안 해도 됨
		
		String hobby = "";
		for(String h : hobbys) {
			hobby += h + "/";
		}
		hobby = hobby.substring(0, hobby.length()-1);
		
		if(!name.equals("")) {
			request.setAttribute("name", name);
			request.setAttribute("hobby", hobby);
			request.setAttribute("hobbys", hobbys);
			
			String viewPage = "/study/1101_JSTL/el2.jsp";
//		Dispatcher에서는 /이 webapp임
			/*
			 * RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			 * dispatcher.forward(request, response);
			 */
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}
}
