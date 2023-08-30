package javaProject.controller.Study.Lv0;

public class Lv_0_23 {
	/*
	 * 약수의 개수가 세 개 이상인 수를 합성수라고 합니다. 자연수 n이 매개변수로 주어질 때 n이하의 합성수의 개수를 return하도록 solution 함수를 완성해주세요.
	 * 
	 * 제한사항
	 * 1 ≤ n ≤ 100
	 * 
	 * 입출력 예
	 * 10 = 5
	 * 15 = 8
	 * 
	 * class Solution {
		    public int solution(int n) {
		        int answer = 0;
		        return answer;
		    }
		}
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("삼각형의 완성조건 (2)");
		Solution23 st = new Solution23();
		
		int n = 10;
		System.out.println(st.solution(n));
		
		int n2 = 15;
		System.out.println(st.solution(n2));
	}
}

class Solution23 {
	 public int solution(int n) {
	        int answer = 0;
	        for(int i=4; i<=n; i++) {
	            if(i%2 == 0) {
	                answer++;
	            } else if(i%3 == 0) {
	                answer++;
	            } else if(i%5 == 0 && i != 5) {
	                answer++;
	            } else if(i%7 == 0 && i!= 7) {
	                answer++;
	            }
	        }
	        return answer;
	    }
}





