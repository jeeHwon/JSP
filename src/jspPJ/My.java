package jspPJ;

public class My {
	public String print() {
		return "오늘은 월요일!";
	}
	public static int sumStartToEnd(int endNum) {
		int hap = 0;
		for (int i=0; i<=endNum; i++){
		hap += i;
		}		
		return hap;
	}
	public int sumStartToEnd(int start, int end) {
		int hap = 0;
		for (int i=start; i<=end; i++) {
			hap += i;
		}
		return hap;
	}
	public int sumStartToEnd(Dto d) {
		int hap = 0;
		int start = d.getStart();
		int end = d.getEnd();
		for (int i=start; i<=end; i++) {
			hap += i;
		}
		return hap;
		
	}
}
