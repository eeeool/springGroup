package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Pds3Command {
	public void execute(HttpServletRequest request, HttpServletResponse reponse) throws ServletException, IOException {
		System.out.println("이곳은 Pds3Command 객체입니다.");
		request.setAttribute("msg", "이곳은 Pds3Command 객체입니다.");
	}

}
