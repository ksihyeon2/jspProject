package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/test8Ok")
public class Test8Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		/*
		String name = request.getParameter("name");
		String ageStr = request.getParameter("age");
		int age;
		
		if(name == null) {
			name = "";
		}
		if(ageStr == null || ageStr.equals("")) {
			age = 0;
		} else age = Integer.parseInt(ageStr);
		*/
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		
		String gender = request.getParameter("gender") == null ? "여자" : request.getParameter("gender");
		
//		String hobby = request.getParameter("hobby") == null ? "" : request.getParameter("hobby");
		String[] hobbys = request.getParameterValues("hobby"); 
		
		String job = request.getParameter("job").equals("") ? "" : request.getParameter("job");
		
		
		/*
		 * if (age < 20) { PrintWriter out = response.getWriter();
		 * out.println("<script>"); out.println("alert('미성년자는 가입하실 수 없습니다.')");
		 * out.println("history.back();"); out.println("</script>"); }
		 */
		PrintWriter out = response.getWriter();
			if (name.equals("") || age < 20 || job.equals("")) {
				out.println("<script>");
				out.println("alert('입력자료가 잘못되었습니다. 확인 후 다시 가입하세요.')");
				out.println("history.back();"); // 뒤로가기
				out.println("</script>");
//				return;
			}	else {
//				DB에 저장
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
				
//				DB저장 완료 후 jsp로 이동처리
				out.println("<script>");
				out.println("alert('회원 가입에 성공하셨습니다.')");
				out.println("location.href = '"+request.getContextPath()+"/study/1026/test8.jsp';");
				out.println("</script>");
			}
		
	}
}
