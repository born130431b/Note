package javaProject.controller.Study.Lv0;

public class Lv_0_15 {
	/*
	 * 알파벳으로 이루어진 문자열 myString이 주어집니다.
	 * 모든 알파벳을 소문자로 변환하여 return 하는 solution 함수를 완성해 주세요.
	 * 
	 * 제한사항
	 * 1 ≤ myString의 길이 ≤ 100,000
	 * myString은 알파벳으로 이루어진 문자열입니다.
	 * 
	 * 입출력 예
	 * "aBcDeFg" = "abcdefg"
	 * "aaa" = "aaa"
	 * 
	 * class Solution {
    public String solution(String myString) {
        String answer = "";
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("소문자로 바꾸기");
		Solution15 st = new Solution15();
		
		System.out.println(st.solution("aBcDeFg"));
		System.out.println(st.solution("aaa"));
	}

}

class Solution15 {
    public String solution(String myString) {
        return myString.toLowerCase();
    }
}