package study2.pdsTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class AllFileDeleteCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String files[] = request.getParameterValues("file[]");
		String realPath = request.getServletContext().getRealPath("/images/pdsTest/");
		
		String res = "0";
		
		if (files != null) {
			for (String f : files) {
				File file = new File(realPath + f);
				if (file.exists()) {
					file.delete();
					res = "1";
				}
			}
		}
		
		response.getWriter().write(res);
	}
}
