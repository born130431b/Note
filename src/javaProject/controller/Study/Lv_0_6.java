package javaProject.controller.Study;

import java.util.*;

public class Lv_0_6 {
	/*
	 * 문자열 myString이 주어집니다.
	 * myString을 문자 "x"를 기준으로 나눴을 때 나눠진 문자열 각각의 길이를 순서대로 저장한 배열을 return 하는 solution 함수를 완성해 주세요.
	 * 
	 * 제한사항
	 * 1 ≤ myString의 길이 ≤ 100,000
	 * myString은 알파벳 소문자로 이루어진 문자열입니다.
	 * 
	 * 입출력 예
	 * "oxooxoxxox" = [1, 2, 1, 0, 1, 0]
	 * "xabcxdefxghi" = [0, 3, 3, 3]
	 * 
	 * class Solution {
    public int[] solution(String myString) {
        int[] answer = {};
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("x 사이의 개수");
		Solution6 solution = new Solution6();
		
		System.out.println("oxooxoxxox : " 	 + Arrays.toString(solution.solution("oxooxoxxox")));
		System.out.println("xabcxdefxghi : " + Arrays.toString(solution.solution("xabcxdefxghi")));
		System.out.println("aaaaxxxx : " 	 + Arrays.toString(solution.solution("aaaaxxxx")));
		System.out.println("xxxxaaaa : " 	 + Arrays.toString(solution.solution("xxxxaaaa")));
		System.out.println("aaaa : " 		 + Arrays.toString(solution.solution("aaaa")));
		System.out.println("xxxx : " 		 + Arrays.toString(solution.solution("xxxx")));
		System.out.println("빈거 : " 			 + Arrays.toString(solution.solution("")));
		
	}

}

class Solution6 {
    public int[] solution(String myString) {
    	
//    	int[] answer = new int[(int) myString.chars().filter(s -> s == 'x').count() + 1];
//    	String[] result =  myString.split("x");
//    	
//    	for(int i=0; i<result.length; i++) {
//    		answer[i] += result[i].length();
//    	}
//        
//        return answer;
    	
    	return Arrays.stream(myString.split("x", myString.length()))
                .mapToInt(x -> x.length())
                .toArray();
    	
    }
}





