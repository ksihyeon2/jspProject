package study2.ajax1;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class Calendar2Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		오늘 날짜 처리(저장)
		Calendar calToday = Calendar.getInstance();  // 싱글톤(싱글톤 객체를 부를때는 타입으로 해서 getinstance로 부름)
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
		
//		화면(뷰)에 보여줄 해당 '년/월'을 세팅
		int yy = request.getParameter("yy") == null ? toYear : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm") == null ? toMonth : Integer.parseInt(request.getParameter("mm"));
		
//		이전 월을 클릭 시 1월(0)은 음수가 넘어오기에, 년도를 -1 빼주고, 월은 12월(11)로 세팅. 
//		다음 월을 클릭 시 12월(11)은 13이 넘어오기에, 년도를 +1 빼주고, 월은 1월(0)로 세팅.
		if(mm < 0) {
			yy--;
			mm = 11;
		}
		if(mm > 11) {
			yy ++;
			mm = 0;
		}
//		선택한 해당 '년/월'의 1일을 기준으로 날짜를 세팅해준다.(처음에는 오늘 날짜, 즉 '년/월/1'로 세팅)
		calToday.set(yy, mm, 1);
		
//		앞에서 세팅한 해당 '년/월/1'의 요일값을 숫자로 가져온다.(일:1, 월:2, 화:3, 수:4, ... ) : 시작테이블의 1일이 들어갈 첫 열을 찾아주기 위함
		int startWeek = calToday.get(Calendar.DAY_OF_WEEK);
		
//		해당 '년/월'의 마지막 일자를 가져온다.
		int lastDay = calToday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
//		출력된 달력의 '앞쪽/뒷쪽'의 빈 공간을 해당 월의 '이전달/다음달'의 날짜로 채우기
		int prevYear = yy;
		int prevMonth = mm-1;
		int nextYear = yy;
		int nextMonth = mm+1;
		
		if(prevMonth == -1) {
			prevYear--;
			prevMonth = 11;
		}
		if(nextMonth == 12) {
			nextYear++;
			nextMonth = 0;
		}
		
//		현재 월의 이전 월에 해당하는 마지막 날자를 구한다.(11월이라면 10월의 마지막 일자인 31을 구한다.)
		calToday.set(prevYear, prevMonth, 1);
		int prevLastDay = calToday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
//		다음 월의 1일에 해당하는 요일을 숫자로 구한다.
		calToday.set(nextYear, nextMonth, 1);
		int nextStartWeek = calToday.get(Calendar.DAY_OF_WEEK);
		

//		화면에 보여줄 달력의 해당 내역(년/월/요일숫자) 저장소에 저장처리
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
//		현재 달의 '전월/다음월'의 변수 저장
		request.setAttribute("prevYear", prevYear);
		request.setAttribute("prevMonth", prevMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		request.setAttribute("prevLastDay", prevLastDay);
		request.setAttribute("nextStartWeek", nextStartWeek);
		
//		오늘 날짜를 저장소에 담아서 보낸다.
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
	}
}
