package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/test9Ok")
public class Test9Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		Front에서 넘어온 값을 변수에 답아준다.
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender") == null ? "여자" : request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby"); 
		String job = request.getParameter("job").equals("") ? "" : request.getParameter("job");
		
//		기본적으로 다시 체크해야 할 것들을 체크해 준다.(잘못된 자료는 다시 돌려보냄. 정상적인 자료는 DB에 저장)
		PrintWriter out = response.getWriter();
			if (name.equals("") || age < 20 || job.equals("")) {
				out.println("<script>");
				out.println("alert('입력자료가 잘못되었습니다. 확인 후 다시 가입하세요.')");
				out.println("history.back();");
				out.println("</script>");
			}	else {
				System.out.println("name : " + name);
				System.out.println("age : " + age);
				System.out.println("gender : " + gender);
				String hobby = "";
				for(String h : hobbys) {
					hobby += h + " / ";
				}
				hobby = hobby.substring(0, hobby.length()-3);
				System.out.println("hobby : " + hobby); 
				System.out.println("job : " + job); 
				
//				DB에 저장완료 후 jsp로 이동처리
//				out.println("<script>");
//				out.println("alert('회원 가입에 성공하셨습니다.')");
//				out.println("location.href = '"+request.getContextPath()+"/study/1026/test8.jsp';");
//				out.println("</script>");
				
//				response.sendRedirect(request.getContextPath()+"/study/1026/test9.jsp?flag=ok");  // Front의 location.href 방식과 같은 방식
//				백엔드에 와서 처리 하고 바로 해당 경로로 감
				
				// 한글인 경우는 인코딩 문제로 브라우저에서 에러로 처리됨.
				name = URLEncoder.encode(name, "UTF-8");
				response.sendRedirect(request.getContextPath()+"/study/1026/test9.jsp?flag="+name);
				
				
			}
		
	}
}
