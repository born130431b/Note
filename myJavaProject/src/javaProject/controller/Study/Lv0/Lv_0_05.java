package javaProject.controller.Study.Lv0;

import java.util.*;

public class Lv_0_05 {
	/*
	 * 문자열 myString이 주어집니다. "x"를 기준으로 해당 문자열을 잘라내 배열을 만든 후 사전순으로 정렬한 배열을 return 하는 solution 함수를 완성해 주세요.
	 * 단, 빈 문자열은 반환할 배열에 넣지 않습니다.
	 * 
	 * 제한사항
	 * 1 ≤ myString ≤ 100,000
	 * myString은 알파벳 소문자로 이루어진 문자열입니다.
	 * 
	 * 입출력 예
	 * "axbxcxdx" = 	["a","b","c","d"]
	 * "dxccxbbbxaaaa" = ["aaaa","bbb","cc","d"]
	 * 
	 * class Solution {
    public String[] solution(String myString) {
        String[] answer = {};
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("문자열 잘라서 정렬하기");
		Solution5 solution = new Solution5();
		
		System.out.println(Arrays.toString(solution.solution("axbxcxdx")));
		System.out.println(Arrays.toString(solution.solution("dxccxbbbxaaaa")));
		System.out.println(Arrays.toString(solution.solution("xxxx")));
		System.out.println(Arrays.toString(solution.solution("aaaaxxxx")));
		System.out.println(Arrays.toString(solution.solution("xxxxaaaa")));
		System.out.println(Arrays.toString(solution.solution("aaaa")));
	}

}

class Solution5 {
	public String[] solution(String myString) {
		return Arrays.stream(myString.split("x"))
				 	  .filter(s -> !s.isEmpty())
				 	  .sorted()
				 	  .toArray(String[]::new);
		
//		 String[] splitArr = myString.split("x");
//	     ArrayList<String> resultList = new ArrayList<>();
//	        
//	     for (String str : splitArr) {
//	    	 if (!str.isEmpty()) {
//	    		 resultList.add(str);
//	    	 }
//	     }
//	        
//	     String[] answer = resultList.toArray(new String[resultList.size()]);
//	     Arrays.sort(answer);
//	     
//	     return answer;
    }
}




