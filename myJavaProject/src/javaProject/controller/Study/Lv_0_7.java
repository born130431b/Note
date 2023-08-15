package javaProject.controller.Study;

import java.util.Arrays;

public class Lv_0_7 {
	/*
	 * 단어가 공백 한 개로 구분되어 있는 문자열 my_string이 매개변수로 주어질 때,
	 * my_string에 나온 단어를 앞에서부터 순서대로 담은 문자열 배열을 return 하는 solution 함수를 작성해 주세요.
	 * 
	 * 제한사항
	 * my_string은 영소문자와 공백으로만 이루어져 있습니다.
	 * 1 ≤ my_string의 길이 ≤ 1,000
	 * my_string의 맨 앞과 맨 뒤에 글자는 공백이 아닙니다..
	 * 
	 * 입출력 예
	 * "i love you" = ["i", "love", "you"]
	 * "programmers" = ["programmers"]
	 * 
	 * class Solution {
    public String[] solution(String my_string) {
        String[] answer = {};
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("공백으로 구분하기 1");
		
		Solution7 solution = new Solution7();
		
		System.out.println(Arrays.toString(solution.solution("i love you")));
		System.out.println(Arrays.toString(solution.solution("programmers")));
		
	}

}

class Solution7 {
    public String[] solution(String my_string) {
       
        return my_string.split(" ");
    }
}