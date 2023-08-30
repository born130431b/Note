package javaProject.controller.Study.Lv0;

public class Lv_0_16 {
	/*
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("원하는 문자열 찾기");
		String myString = "AbCdEfG";
		String pat = "aBc";
		
		System.out.println(myString.toLowerCase().contains(pat.toLowerCase())? 1:0);
		
	}

}
