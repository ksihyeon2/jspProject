package study2.apiTest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class PoliceCheckCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String police = request.getParameter("police") == null ? "" : request.getParameter("police");
		
		ApiDAO dao = new ApiDAO();
		
		ArrayList<ApiVO> vos = dao.getPoliceCheck(police);
		ApiVO analyzeVo = dao.getPoliceAnalyze(police);
		
		request.setAttribute("vos", vos);
		request.setAttribute("police", police);
		request.setAttribute("analyzeVo", analyzeVo);
	}
}
