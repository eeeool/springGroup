package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class GuestUpdateCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx").equals("")) ? 0: Integer.parseInt(request.getParameter("idx"));
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage");
		
		GuestDAO dao = new GuestDAO();
		
		//int res = dao.setGuestUpdate(idx, content, email, homePage);
		
		//response.getWriter().write(res + "");
		response.getWriter().write("");
	}
}
