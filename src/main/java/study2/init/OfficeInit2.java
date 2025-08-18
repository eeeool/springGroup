package study2.init;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/springGroup")
@WebServlet(urlPatterns = "/javaGroup", initParams = {@WebInitParam(name="className", value="영업과"), @WebInitParam(name="mid", value="hkd1234")})
public class OfficeInit2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 /springGroup 서블릿 입니다.");
		
		// web.xml에서 넘어온 초기값을 세션에 담아준다.
		String className = getInitParameter("className");
		String mid = getInitParameter("mid");
	
		// application 객체 사용하기위한 생성처리
		ServletContext application = request.getServletContext();
		application.setAttribute("aTest", "값Test");
		
		// session 객체 사용하기위한 생성처리
		request.setAttribute("className", className);
		request.setAttribute("mid", mid);
		
		String viewPage = "/WEB-INF/study2/init/login.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
