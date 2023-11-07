package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("*.lo")
public class LoginController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginInterface command = null;
		
		String viewPage = "/WEB-INF/study2/login";
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
//		로그인 창
		if(com.equals("/login")) {
			viewPage += "/login.jsp";
		}
//	로그인 버튼
		else if(com.equals("/loginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			
			viewPage = "/include/message.jsp";
		}
//	회원 로그인 후 메인 창
		else if(com.equals("/memberMain")) {
			viewPage += "/memberMain.jsp";
		}
//		회원가입창
		else if(com.equals("/join")) {
			viewPage += "/join.jsp";
		}

//		회원가입 버튼
		else if(com.equals("/joinOk")) {
			command = new JoinOkCommand();
			command.execute(request, response);
			
			viewPage = "/include/message.jsp";
		}
		
//		로그인 후 개인 검색
		else if(com.equals("/MemberSearch")) {
			command = new MemberSearchCommand();
			command.execute(request, response);
			
			viewPage += "/memberSearch.jsp";
		}
//		로그인 후 전체 조회 검색
		else if(com.equals("/memberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			
			viewPage += "/memberList.jsp";
		}
//		로그인 후 회원 정보 수정
		else if(com.equals("/update")) {
			viewPage += "/update.jsp";
		}
//		회원 정보 수정완료 버튼
		else if(com.equals("/updateOk")) {
			command = new UpdateOkCommand();
			command.execute(request, response);
			
			viewPage = "/include/message.jsp";
		}
		
//		회원 탈퇴
		else if(com.equals("/deleteOk")) {
			command = new DeleteOkCommand();
			command.execute(request, response);
			
			viewPage = "/include/message.jsp";
		}
//		로그아웃 
		else if(com.equals("/logout")) {
			command = new LogoutCommand();
			command.execute(request, response);
			
			viewPage = "/include/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
