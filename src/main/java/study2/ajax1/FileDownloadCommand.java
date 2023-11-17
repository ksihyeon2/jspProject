package study2.ajax1;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
//		해당 파일 경로에 들어있는 정보 리스트 불러옴
		String[] files = new File(realPath).list();
		for(String file : files) {
			System.out.println("file : "+file);
		}
		
		request.setAttribute("files", files);
	}
}
