package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5_5Command implements Test5ReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dan = request.getParameter("dan") == null ? 1 : Integer.parseInt(request.getParameter("dan"));
		String str = "&nbsp;&nbsp;&nbsp;* "+dan+"단 *<br />";
		
		for(int i=1; i<=9; i++) {
			str += dan + " * " + i + " = " + dan*i + "<br />";
		}
		
		request.setAttribute("dan", dan);
		request.setAttribute("str", str);
	}
}