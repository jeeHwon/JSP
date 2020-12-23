package jspPJ;

import java.time.LocalDate;

public class Etc {
	// 자주 사용되는 기능 static 처리해 필요시 호출(날짜 가져오기)
	public static String date() {
		LocalDate today = LocalDate.now();
		return today.toString();
	}
}
