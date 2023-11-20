package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsListCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part") == null ? "전체" : request.getParameter("part");
		
		PdsDAO dao = new PdsDAO();
		
//		페이징 처리
		
		ArrayList<PdsVO> vos = dao.getPdsList(part);
		
		request.setAttribute("vos", vos);
		request.setAttribute("part", part);
	}
}
