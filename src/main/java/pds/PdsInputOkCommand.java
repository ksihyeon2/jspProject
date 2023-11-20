package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	사진 업로드를 우선 파일에 담고 그 다음 DB에 저장해주어야 함
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024 * 30;  //서버에 저장시킨 파일의 최대 용량을 30MByte로 제한(1회 저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드 처리(객체가 생성되면서 바로 파일이 업로드 처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		//	열거형 자료 enumeration으로 담기
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = ""; 
		String filesystemName = "";
		
		//	자료가 있는지 hasMoreElements로 확인 후 있으면 nextElement로 담음
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) + "/";
				filesystemName += multipartRequest.getFilesystemName(file) + "/";
			}
		}
//		System.out.println("원본 파일명 : " + originalFileName);
//		System.out.println("서버의 저장 경로 : " + realPath);
//		System.out.println("서버의 저장 파일명 : " + filesystemName);
		originalFileName = originalFileName.substring(0,originalFileName.length()-1);
		filesystemName = filesystemName.substring(0,filesystemName.length()-1);
		
//		업로드 시킨 파일을 DB에 저장시키기 위해서 전송된 폼의 내용들을 모두 변수에 담기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
		int fileSize = multipartRequest.getParameter("fileSize") == null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
		String part = multipartRequest.getParameter("part") == null ? "" : multipartRequest.getParameter("part");
		String pwd = multipartRequest.getParameter("pwd") == null ? "" : multipartRequest.getParameter("pwd");
		String openSw = multipartRequest.getParameter("openSw") == null ? "" : multipartRequest.getParameter("openSw");
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
		String hostIp = multipartRequest.getParameter("hostIp") == null ? "" : multipartRequest.getParameter("hostIp");
		
//		비밀번호 암호화(SHA256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
//		가공처리 된 모든 자료들을 VO에 담아서 DB로 넘겨준다.
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fileSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setPwd(pwd);
		vo.setOpenSw(openSw);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInputOk(vo);
		
		if(res != 0) {
			request.setAttribute("msg", "자료가 업로드 되었습니다.");
			request.setAttribute("url", "pdsList.pds");
		} else {
			request.setAttribute("msg", "자료 업로드에 실패하셨습니다.");
			request.setAttribute("url", "pdsInput.pds");
		}
	}
}
