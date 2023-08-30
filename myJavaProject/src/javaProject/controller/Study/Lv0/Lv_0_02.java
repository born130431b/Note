package javaProject.controller.Study.Lv0;

import java.util.*;

public class Lv_0_02 {
	/* https://school.programmers.co.kr/learn/courses/30/lessons/181862
	 * 임의의 문자열이 주어졌을 때 문자 "a", "b", "c"를 구분자로 사용해 문자열을 나누고자 합니다.
	 * 예를 들어 주어진 문자열이 "baconlettucetomato"라면 나눠진 문자열 목록은 ["onlettu", "etom", "to"] 가 됩니다.
	 * 문자열 myStr이 주어졌을 때 위 예시와 같이 "a", "b", "c"를 사용해 나눠진 문자열을 순서대로 저장한 배열을 return 하는 solution 함수를 완성해 주세요.
	 * 단, 두 구분자 사이에 다른 문자가 없을 경우에는 아무것도 저장하지 않으며, return할 배열이 빈 배열이라면 ["EMPTY"]를 return 합니다.
	 * 
	 * 제한사항
	 * 1 ≤ myStr의 길이 ≤ 1,000,000
	 * myStr은 알파벳 소문자로 이루어진 문자열 입니다.
	 * 
	 * 입출력 예
	 * "baconlettucetomato" = ["onlettu", "etom", "to"] 
	 * "abcd" = ["d"]
	 * "cabab" = ["EMPTY"]
	 * 
	 * class Solution {
    public String[] solution(String myStr) {
        String[] answer = {};
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("세 개의 구분자");
		Solution2 solution = new Solution2();
		System.out.println(solution.solution2("baconlettucetomato"));

	}

}

class Solution2 {
    public List solution(String myStr) {
    	
    	List<String> answer = new ArrayList<String>();
    	String temp = "";
    	
    	for(int i=0; i<myStr.length();i++) {
    		char chk = myStr.charAt(i);
    		if(chk == 'a' || chk == 'b' || chk == 'c') {
    			if(temp != "") {
    				answer.add(temp);
        			temp = "";
    			}
    		} else {
    			temp += myStr.charAt(i);
    		}
    	}
    	
    	if(temp == "") {
    		answer.add("EMPTY");
    	} else {
        	answer.add(temp);
    	}
        
        return answer;
    }
    
   public String[] solution2(String myStr) {
	   String[] arr = Arrays.stream(myStr.split("[abc]+")).filter(str -> !str.isEmpty()).toArray(String[]::new);
       return arr.length == 0 ? new String[] { "EMPTY" } : arr;
   }
}




