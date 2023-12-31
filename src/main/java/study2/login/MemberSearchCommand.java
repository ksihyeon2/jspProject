package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberSearchCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginSearch(mid);
		
		request.setAttribute("vo", vo);
		if(vo.getName() != null) {
			request.setAttribute("mso", "NO");
			request.setAttribute("url", "memberMidSearch.lo?mid="+mid);
		} else {
			request.setAttribute("mso", "검색하신 회원이 없습니다.");
			request.setAttribute("url", "memberMain.lo");			
		}
	}
}
