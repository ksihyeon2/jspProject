package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString");
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag")); // 페이지 수
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize")); // 한 페이지당 나타낼 수
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> vos = dao.getBoardContentSearch(search,searchString);
		
		String searchTitle = "";
		if(search.equals("title")) {
			searchTitle = "글제목";
		}
		else if(search.equals("nickName")) {
			searchTitle = "작성자";
		}
		else {
			searchTitle = "글내용";
		}
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("searchCount", vos.size());
		request.setAttribute("searchString", searchString);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}
}
