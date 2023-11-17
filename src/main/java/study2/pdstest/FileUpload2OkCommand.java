package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 10;  //서버에 저장싴키 파일의 최대 용량을 10MByte로 제한(1회 저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드 처리(객체가 생성되면서 바로 파일이 업로드 처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드 된 파일의 정보 추출
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		System.out.println("원본 파일명 : " + originalFileName);
		System.out.println("서버의 저장 경로 : " + realPath);
		System.out.println("서버의 저장된 파일명 : " + filesystemName);
		
		if(originalFileName != null && !originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");			
		} else {
			request.setAttribute("msg", "파일 업로드가 실패되었습니다.");			
		}
		
		request.setAttribute("url", "fileUpload2.st");
	}
}
