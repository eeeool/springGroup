package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk4Command implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10; // 서버에 저장시킬 최대 파일 용량을 10Mbyte 제한
		String encoding = "UTF-8";
		
		// 파일 업로드 처리(객체가 생성됨과 동시에 파일이 업로드 된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드시킨 파일의 정보를 추출
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		String part = multipartRequest.getParameter("part");
		
		System.out.println("원본 파일명:" + originalFileName);
		System.out.println("서버저장 파일명: " + filesystemName);
		System.out.println("서버파일 저장 경로명: " + realPath);
		
		// BackEnd 파일 체크
		if (originalFileName != null && !originalFileName.equals("")) {
			request.setAttribute("message", "파일 전송 완료");			
		}
		else {
			request.setAttribute("message", "파일 전송 실패");						
		}
		
		request.setAttribute("url", "FileUpload1.st");
	}
}
