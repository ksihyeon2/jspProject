package study2.ajax1;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class JavaFileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		String fileName = request.getParameter("file") == null ? "" : request.getParameter("file");
		
		File file = new File(realPath+fileName);
		
		/* 프로토콜형식에 맞도록 헤더에 정보를 제공해 준다. */
		String mimeType =  request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");   // 2진 바이너리 형식
		}
		
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(fileName.getBytes("UTF-8"), "8859_1");
		} else {
			downLoadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		FileInputStream fis = new FileInputStream(file);  
		// FileOutputStream fos = new FileOutputStream(file);  // 서버에 보낼때 사용
		
//		클라이언트에게 보내려면 서블릿을 사용해서 보내야 함
		ServletOutputStream sos = response.getOutputStream();
		
//		전송할 객체를 생성한 후, 실제 전송은 Byte 단위로 처리한다.
		byte[] b = new byte[2048];
		
		int data = 0;
		while((data = fis.read(b,0,b.length)) != -1) {
			sos.write(b,0,data);
		}
		sos.flush();
//		여기까지 다운로드가 완료
		
		sos.close();
		fis.close();
	}
}
