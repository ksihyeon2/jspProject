package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString");
		
		BoardDAO dao = new BoardDAO();
		
//		게시글 조회수 1 증가 시키기(중복 불허)
		HttpSession session = request.getSession();
		ArrayList<String> boardContentIdx = (ArrayList) session.getAttribute("sBoardContentIdx");
		if(boardContentIdx == null) {
			boardContentIdx = new ArrayList<String>();
		}
		
		String imsiContentIdx = "board" + idx;
//		contains 는 참과 거짓으로 해당 boardContentIdx에 imsiContentIdx이 포함되어 있는지 확인하기
//		indexOf 사용해도 됨
		if(!boardContentIdx.contains(imsiContentIdx)) {
			dao.setBoardReadNumPlus(idx);			
			boardContentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sBoardContentIdx", boardContentIdx);
		
		BoardVO vo = dao.getBoardContent(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
//		이전글 다음글 처리
		BoardVO preVo = dao.getPreNextSearch(idx, "preVo");
		BoardVO nextVo = dao.getPreNextSearch(idx, "nextVo");
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
	}
}
