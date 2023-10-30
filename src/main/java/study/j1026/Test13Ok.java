package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/Test13Ok")
public class Test13Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender") == null ? "여자" : request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby"); 
		String job = request.getParameter("job").equals("") ? "" : request.getParameter("job");
		
			if (name.equals("") || age < 20 || job.equals("")) {
				response.sendRedirect(request.getContextPath()+"/study/1026/test13.jsp?flag=no");
			}	else {
				String hobby = "";
				for(String h : hobbys) {
					hobby += h + " / ";
				}
				hobby = hobby.substring(0, hobby.length()-3);
				
				

				Test13VO vo = new Test13VO();
				vo.setName(name);
				vo.setAge(age);
				vo.setGender(gender);
				vo.setHobby(hobby);
				vo.setJob(job);
				
				request.setAttribute("vo", vo);				
				
				String viewPage = "/study/1026/test13Res.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				
				dispatcher.forward(request, response);
			}
		
	}
}
