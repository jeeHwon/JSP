package jspPJ.dao;

import java.time.LocalDate;

public class Dao {
	
	//날짜 반환 method
	public String getDate() {
		LocalDate today = LocalDate.now();
		String yy = today.getYear() + "년";
		String mm = today.getMonthValue() + "월";
		String dd = today.getDayOfMonth() + "일";
		
		return yy+mm+dd;
	}
	
	//점수 입력 받아 합을 반환 method
	public int getTotal(int kor, int eng, int mat) {
		int total = kor + eng + mat;
		
		return total;
	}
	
}
