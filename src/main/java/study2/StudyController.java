package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage ="/WEB-INF/study2";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		if(com.equals("/ajaxTest1")) {
			viewPage += "/ajax1/ajaxTest1.jsp";
		}
		else if(com.equals("/ajaxTest1Ok")) {
			command = new AjaxTest1OkCommand();
			command.execute(request, response);
			
			viewPage = "/include/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
