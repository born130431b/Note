package javaProject.controller.Study.Lv1;

public class Lv_1_08 {
	/*
	 * 양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다.
	 * 예를 들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다.
	 * 자연수 x를 입력받아 x가 하샤드 수인지 아닌지 검사하는 함수, solution을 완성해주세요.
	 * 
	 * 제한 조건
	 * x는 1 이상, 10000 이하인 정수입니다.
	 * 
	 * 입출력 예
	 * x	return
	 * 10	true
	 * 12	true
	 * 11	false
	 * 13	false
	 * 
	 * class Solution {
		    public boolean solution(int x) {
		        boolean answer = true;
		        return answer;
		    }
		}
	 */
	public static void main(String[] args) {
		System.out.println("하샤드 수");
		Solution8 st = new Solution8();
		int x = 10;
		System.out.println(st.solution(x));

		int x2 = 12;
		System.out.println(st.solution(x2));

		int x3 = 11;
		System.out.println(st.solution(x3));

		int x4 = 13;
		System.out.println(st.solution(x4));

		int x5 = 2001;
		System.out.println(st.solution(x5));

		int x6 = 1230;
		System.out.println(st.solution(x6));
	}

}


class Solution8 {
    public boolean solution(int x) {
    	int temp = 0;
    	int chk = x;
    	while(chk > 0) {
    		temp += chk % 10;
    		chk /= 10;
    	}
    	
        return x % temp == 0;
    }
}





