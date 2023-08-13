package javaProject.controller.Practice;

import java.util.*;

public class preactice2 {

	public static void main(String[] args) {
//		testStringArray (); // String[] 에 splite
//		testTrim();
		testTrim2();
		
		
		
		
		
	}
	
	public static void testTrim2() {
		String str = "1    개월";
		System.out.println("str : |" + str + "|");
		String[] arStrNormalSpace = str.split(" ");
		System.out.println("split(\" \")");
		for (int i = 0; i < arStrNormalSpace.length; i++) {
			System.out.println("[" + i + "] = ^" + arStrNormalSpace[i] + "^");
		}
		
		System.out.println("split(\"\\\\s\")");
		String[] arStrRegexSingleSpace = str.split("\\s");
		for (int i = 0; i < arStrRegexSingleSpace.length; i++) {
			System.out.println("[" + i + "] = ^" + arStrRegexSingleSpace[i] + "^");
		}
		
		System.out.println("split(\"\\\\s+\")");
		String[] arStrRegexMultiSpace = str.split("\\s+");
		for (int i = 0; i < arStrRegexMultiSpace.length; i++) {
			System.out.println("[" + i + "] = ^" + arStrRegexMultiSpace[i] + "^");
		}
	}
	
	public static void testTrim() {
		String myString = "    i    love     you     ";
		
		System.out.println(myString.trim());	// trim은 양끝 공백만 제거
		
		
		 System.out.println(
					 Arrays.toString(
							 myString.trim().split("\\s+")
					 )
				 );
	}
	
	
	
	
	
	public static void testStringArray () {
		String str = "123 4 5 67 890 ";
		System.out.println(str.length());
		String[] LimitExceed = str.split(" ", str.length());
		
		System.out.println("길이는 : " + str.split(" ", str.length()).length);
		
		System.out.println("LimitExceed.length : " + LimitExceed.length);
		
		for(int i = 0; i < LimitExceed.length; i++)
			System.out.println(i + "배열 : " + LimitExceed[i]);
			
	
//		String[] LimitThree = str.split(" ", 3);
//		String[] LimitExceed = str.split(" ", 10);
//		String[] LimitZero = str.split(" ", 0);
//		String[] LimitMinus = str.split(" ", -1);
		
//		System.out.println("----LimitThree----");
//		for(int i = 0; i < LimitThree.length; i++)
//			System.out.println(i + "배열 : " + LimitThree[i]);
//
//		System.out.println("----LimitExceed----");
//		for(int i = 0; i < LimitExceed.length; i++)
//			System.out.println(i + "배열 : " + LimitExceed[i]);
//
//		System.out.println("----LimitZero----");
//		for(int i = 0; i < LimitZero.length; i++)
//			System.out.println(i + "배열 : " + LimitZero[i]);
//
//		System.out.println("----LimitMinus----");
//		for(int i = 0; i < LimitMinus.length; i++)
//			System.out.println(i + "배열 : " + LimitMinus[i]);
	}
}

