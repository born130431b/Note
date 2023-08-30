package javaProject.controller.Study.Lv0;

public class Lv_0_12 {
	/*
	 * 영소문자로 이루어진 문자열 my_string과 영소문자 1글자로 이루어진 문자열 alp가 매개변수로 주어질 때,
	 * my_string에서 alp에 해당하는 모든 글자를 대문자로 바꾼 문자열을 return 하는 solution 함수를 작성해 주세요.
	 * 
	 * 제한사항
	 * 1 ≤ my_string의 길이 ≤ 1,000
	 * 
	 * 입출력 예
	 * my_string		alp		result
	 * "programmers"	"p"		= "Programmers
	 * "lowercase"		"x"		= "lowercase"
	 * 
	 * class Solution {
    public String solution(String my_string, String alp) {
        String answer = "";
        return answer;
    }
}
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("특정한 문자를 대문자로 바꾸기");
		
		Solution12 st = new Solution12();
		
		System.out.println(st.solution("programmers", "p"));
		System.out.println(st.solution("lowercase", "x"));
		System.out.println(st.solution("aBaBabab", "a"));
	}

}


class Solution12 {
    public String solution(String my_string, String alp) {
        return my_string.replace(alp, alp.toUpperCase());
    }
}