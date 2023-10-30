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

@WebServlet("/j1026/Test12Ok")
public class Test12Ok extends HttpServlet{
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
				response.sendRedirect(request.getContextPath()+"/study/1026/test12.jsp?flag=no");
			}	else {
				//System.out.println("name : " + name);
				//System.out.println("age : " + age);
				//System.out.println("gender : " + gender);
				String hobby = "";
				for(String h : hobbys) {
					hobby += h + " / ";
				}
				hobby = hobby.substring(0, hobby.length()-3);
				//System.out.println("hobby : " + hobby); 
				//System.out.println("job : " + job); 
				
				//response.sendRedirect(request.getContextPath()+"/study/1026/test11Res.jsp?name="+name+"&age="+age+"&gender=&hobby=&job="); response 방식
				
				// request 저장소에 전송하고자 하는 자료들을 모두 담아준다. : request("변수명", 전송값)
				request.setAttribute("name", name);				
				request.setAttribute("age", age);				
				request.setAttribute("gender", gender);				
				request.setAttribute("hobby", hobby);				
				request.setAttribute("job", job);				
				
				//String viewPage = "/study/1026/test12Msg.jsp";
				String viewPage = "/study/1026/test12Res.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				
				dispatcher.forward(request, response);
			}
		
	}
}
