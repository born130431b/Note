package javaProject.controller.Study;

import java.util.Arrays;
import java.util.stream.*;

public class Lv_0_14 {
	/*
	 * 문자열 배열 strArr가 주어집니다.
	 * 모든 원소가 알파벳으로만 이루어져 있을 때, 배열에서 홀수번째 인덱스의 문자열은 모든 문자를 대문자로,
	 * 짝수번째 인덱스의 문자열은 모든 문자를 소문자로 바꿔서 반환하는 solution 함수를 완성해 주세요.
	 * 
	 * 제한사항
	 * 1 ≤ strArr ≤ 20
	 * 1 ≤ strArr의 원소의 길이 ≤ 20
	 * strArr의 원소는 알파벳으로 이루어진 문자열 입니다.
	 * 
	 * 입출력 예
	 * ["AAA","BBB","CCC","DDD"] = ["aaa","BBB","ccc","DDD"]
	 * ["aBc","AbC"] = 	["abc","ABC"]
	 * 
	 * class Solution {
    public String[] solution(String[] strArr) {
        String[] answer = {};
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("배열에서 문자열 대소문자 변환하기");
		
		Solution14 st = new Solution14();
		
		String[] str = {"AAA","BBB","CCC","DDD"};
		System.out.println(Arrays.toString(st.solution(str)));
		String[] str2 = {"aBc","AbC"};
		System.out.println(Arrays.toString(st.solution(str2)));
	}

}

class Solution14 {
    public String[] solution(String[] strArr) {
        return IntStream.range(0, strArr.length)
        				.mapToObj(i -> i % 2 == 0 ? strArr[i].toLowerCase() : strArr[i].toUpperCase())
        				.toArray(String[]::new);
    }
}








