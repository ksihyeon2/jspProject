package study.j1026;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/Test5")
public class Test5 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String flag = request.getParameter("flag");
		
		System.out.println("name : " +name);
		System.out.println("age : " +age);
		System.out.println("flag : " +flag);
	}
	
	
//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("이곳은 doGet입니다.");
//	}
//	
//	protected void doPsot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("이곳은 doPost입니다.");
//	}
//	service와 doget,dopost를 다 생성해놓으면 service가 우선임
}
