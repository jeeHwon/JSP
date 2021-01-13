package jspPJ.dao;

import java.time.LocalDate;
import java.util.ArrayList;

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
	
	public ArrayList<String> view_day(int year, int month, int day){
		LocalDate inday = LocalDate.of(year, month, day);
		LocalDate after100days = inday.plusDays(100);
		LocalDate after1Years = inday.plusYears(1);
		LocalDate after10Years = inday.plusYears(10);
		
		ArrayList<String> list = new ArrayList<String>();
		list.add(inday.toString());
		list.add(after100days.toString());
		list.add(after1Years.toString());
		list.add(after10Years.toString());
		
		return list;
		
	}
	
}
