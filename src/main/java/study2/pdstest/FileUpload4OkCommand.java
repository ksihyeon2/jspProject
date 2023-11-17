package study2.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload4OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 10;  //서버에 저장싴키 파일의 최대 용량을 10MByte로 제한(1회 저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드 처리(객체가 생성되면서 바로 파일이 업로드 처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드 된 파일의 정보 추출
		
//		열거형 자료 enumeration으로 담기
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String originalFileName = ""; 
		String filesystemName = "";
		
//		자료가 있는지 hasMoreElements로 확인 후 있으면 nextElement로 담음
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			originalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName = multipartRequest.getFilesystemName(file);

			System.out.println("원본 파일명 : " + originalFileName);
			System.out.println("서버의 저장 경로 : " + realPath);
			System.out.println("서버의 저장 파일명 : " + filesystemName);
		}
		
		if(originalFileName != null && !originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");			
		} else {
			request.setAttribute("msg", "파일 업로드가 실패되었습니다.");			
		}
		
		request.setAttribute("url", "fileUpload4.st");
	}
}
