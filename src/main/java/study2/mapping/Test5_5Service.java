package study2.mapping;

public class Test5_5Service {

	public String gugudan(int dan) {
		String str = "&nbsp;&nbsp;&nbsp;*" +dan+ "단*<br />";
		for(int i=1; i<=9; i++) {
			str += dan + " * " + i + " = " + dan*i + "<br />";
		}
		
		return str;
	}
}
