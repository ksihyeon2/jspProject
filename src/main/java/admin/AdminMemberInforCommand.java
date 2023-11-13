package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdminMemberInforCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int level = request.getParameter("level") == null ? 99 : Integer.parseInt(request.getParameter("level"));
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberVO> vos = dao.getMemberList(pag, pageSize, level);
		
		for(MemberVO vo : vos) {
			if(vo.getIdx() == idx) {
				request.setAttribute("vo", vo);
			}
		}
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("level", level);
	}
}
