package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Board3Command {
	public void execute(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Board3Command 객체 입니다.");
		request.setAttribute("msg", "이곳은 Board3Command 객체 입니다.");
	}
}
