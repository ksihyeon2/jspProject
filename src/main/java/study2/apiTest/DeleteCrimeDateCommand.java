package study2.apiTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class DeleteCrimeDateCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = request.getParameter("year") == null ? 0 : Integer.parseInt(request.getParameter("year"));
		ApiDAO dao = new ApiDAO();
		
		int res = dao.getSearchYear(year);
		
		if(res != 0) {
			res = dao.setDeleteCrimeDate(year);
		} else {
			res = -1;
		}
		
		response.getWriter().write(res+"");
	}
}
