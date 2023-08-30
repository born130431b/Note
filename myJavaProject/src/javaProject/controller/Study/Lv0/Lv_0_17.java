package javaProject.controller.Study.Lv0;

import java.util.stream.IntStream;

public class Lv_0_17 {
	/*
	 * 정수가 담긴 리스트 num_list가 주어질 때,
	 * 리스트의 길이가 11 이상이면 리스트에 있는 모든 원소의 합을 10 이하이면 모든 원소의 곱을 return하도록 solution 함수를 완성해주세요.
	 * 
	 * 제한사항
	 * 2 ≤ num_list의 길이 ≤ 20
	 * 1 ≤ num_list의 원소 ≤ 9
	 * 
	 * 입출력 예
	 * [3, 4, 5, 2, 5, 4, 6, 7, 3, 7, 2, 2, 1]	 = 51
	 * [2, 3, 4, 5] = 120
	 * 
	 * class Solution {
    public int solution(int[] num_list) {
        int answer = 0;
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("길이에 따른 연산");
		
	}

}

class Solution17 {
    public int solution(int[] num_list) {
    	
    	IntStream stream = IntStream.of(num_list);
        return num_list.length>10?stream.sum():stream.reduce(1, (a, b) -> a * b);
    	
//        int answer = 0;
//        int answer2 = 1;
//        for(int init : num_list) {
//            if(num_list.length > 10) {
//                answer += init;
//            } else {
//                answer2 *= init;
//            }
//        }
//        return answer == 0? answer2:answer;
    }
}