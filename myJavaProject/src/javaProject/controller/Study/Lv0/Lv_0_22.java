package javaProject.controller.Study.Lv0;

public class Lv_0_22 {
	/*
	 * 선분 세 개로 삼각형을 만들기 위해서는 다음과 같은 조건을 만족해야 합니다.
	 * 가장 긴 변의 길이는 다른 두 변의 길이의 합보다 작아야 합니다.
	 * 삼각형의 두 변의 길이가 담긴 배열 sides이 매개변수로 주어집니다. 나머지 한 변이 될 수 있는 정수의 개수를 return하도록 solution 함수를 완성해주세요.
	 * 
	 * 제한사항
	 * sides의 원소는 자연수입니다.
	 * sides의 길이는 2입니다.
	 * 1 ≤ sides의 원소 ≤ 1,000
	 * 
	 * 입출력 예
	 * [1, 2]	1
	 * [3, 6]	5
	 * [11, 7]	13
	 * 
	 * class Solution {
		    public int solution(int[] sides) {
		        int answer = 0;
		        return answer;
		    }
		}
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("삼각형의 완성조건 (2)");
		Solution22 st = new Solution22();
		
		int[] sides = {1, 2};
		System.out.println(st.solution(sides));
		
		int[] sides2 = {3, 6};
		System.out.println(st.solution(sides2));
		
		int[] sides3 = {11, 7};
		System.out.println(st.solution(sides3));
		
		int[] sides4 = {100, 100};
		System.out.println(st.solution(sides4));
		
	}
}

class Solution22 {
	public int solution(int[] sides) {
        switch (Integer.compare(sides[0], sides[1])) {
            case 1: return sides[1] * 2 - 1;
            case 0: return sides[1] * 2 - 1;
            case -1: return sides[0] * 2 - 1;
            default: return 0;
        }
    }
}





