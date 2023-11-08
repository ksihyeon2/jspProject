package study2.ajax2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserDeleteCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.getIdxSearch(idx);
		
		String res = "";
		if(vo.getMid() != null) {
			res = dao.setUserDelete(idx);
		} 
//		else {
//			if(res == "0") {
//				str = "회원 정보 삭제 실패.";
//			} else {
//				str = "회원 정보 삭제되었습니다.";
//			}
//		}
		response.getWriter().write(res);
	}
}
