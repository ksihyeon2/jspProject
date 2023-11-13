package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MInforCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberVO> vos = dao.getMemberList(1, 1, 99);
		
		for(MemberVO vo : vos) {
			if(vo.getIdx() == idx) {
				request.setAttribute("vo", vo);
			}
		}
	}
}
