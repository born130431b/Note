package javaProject.controller.Study.Lv1;

public class Lv_1_16 {
	/*
	 * 정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.
	 * 
	 * 제한 사항
	 * n은 0 이상 3000이하인 정수입니다.
	 * 
	 * 입출력 예
	 * 12 = 28
	 * 5  = 6
	 * 
	 * class Solution {
		    public int solution(int n) {
		        int answer = 0;
		        return answer;
		    }
		}
	 */
	public static void main(String[] args) {
		System.out.println("약수의 합");
		Solution16 st = new Solution16();
		
		int n = 12;
		System.out.println(st.solution(n));
		
		int n2 =5;
		System.out.println(st.solution(n2));
		
	}

}



class Solution16 {
	public int solution(int n) {
        int answer = 0;
        
        for(int i = 1; i <= n; i++) {
    		answer += n % i == 0? i:0;
    	}
        
        return answer;
    }
}



