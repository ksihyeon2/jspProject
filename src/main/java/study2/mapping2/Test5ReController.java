package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("*.re")
public class Test5ReController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test5ReInterface command = null;
		
		String viewPage = "/WEB-INF/study2/mapping2";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/test5")) {
			viewPage += "/test5.jsp";
		}
		else if(com.equals("/test5_2")) {
			viewPage += "/test5_2.jsp";
		}
		else if(com.equals("/test5_3")) {
			viewPage += "/test5_3.jsp";
		}
		else if(com.equals("/test5_4")) {
			command = new Test5_4Command();
//			command는 request와 response를 생성한 인터페이스이기 때문에 클래스를 생성하여 command에 담게 되면 자동으로 구현객체로 생성됨
			command.execute(request, response);
			viewPage += "/test5.jsp";
		}
		else if(com.equals("/test5_5")) {
			command = new Test5_5Command();
			command.execute(request, response);
			viewPage += "/test5_5.jsp";
		}
		else if(com.equals("/test5_6")) {
			command = new Test5_6Command();
			command.execute(request, response);
			//viewPage += "/test5.jsp";
			viewPage = "/include/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
