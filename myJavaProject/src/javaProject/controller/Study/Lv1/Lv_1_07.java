package javaProject.controller.Study.Lv1;

public class Lv_1_07 {
	/*
	 * 두 정수 left와 right가 매개변수로 주어집니다.
	 * left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.
	 * 
	 * 제한사항
	 * 1 ≤ left ≤ right ≤ 1,000
	 * 
	 * 입출력 예
	 * left	right	result
	 * 13	 17		 43
	 * 24	 27		 52
	 * 
	 * class Solution {
		    public int solution(int left, int right) {
		        int answer = 0;
		        return answer;
		    }
		}
	 */
	public static void main(String[] args) {
		System.out.println("약수의 개수와 덧셈");
		Solution7 st = new Solution7();
		int left = 13;
		int right = 17;
		System.out.println(st.solution(left, right));

		int left2 = 24;
		int right2 = 27;
		System.out.println(st.solution(left2, right2));

		int left3 = 24;
		int right3 = 24;
		System.out.println(st.solution(left3, right3));

		int left4 = 11;
		int right4 = 11;
		System.out.println(st.solution(left4, right4));
	}

}

class Solution7 {
    public int solution(int left, int right) {
    	int answer = 0;
    	for(int i = left; i <= right; i++) {
        	int chk=0;
    		for(int j=1; j<=i; j++) {
    			if(i%j == 0) {
    				chk++;
    			}
    		}
    		answer += chk % 2 == 0? +i : - i;
    	}
        return answer;
    }
}






