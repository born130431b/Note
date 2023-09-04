package javaProject.controller.Study.Lv02;

public class Lv_2_02 {
	/*
	 * x축과 y축으로 이루어진 2차원 직교 좌표계에 중심이 원점인 서로 다른 크기의 원이 두 개 주어집니다.
	 * 반지름을 나타내는 두 정수 r1, r2가 매개변수로 주어질 때, 두 원 사이의 공간에 x좌표와 y좌표가 모두 정수인 점의 개수를 return하도록 solution 함수를 완성해주세요.
	 * ※ 각 원 위의 점도 포함하여 셉니다.
	 * 
	 * 제한 사항
	 * 1 ≤ r1 < r2 ≤ 1,000,000
	 * 
	 * 입출력 예
	 * r1	r2	result
	 * 2	3	20
	 * 
	 * class Solution {
		    public long solution(int r1, int r2) {
		        long answer = 0;
		        return answer;
		    }
		}
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("두 원 사이의 정수 쌍");
		solutio2 st = new solutio2();
		
		int r1 = 2;
		int r2 = 3;
		System.out.println(st.solution(r1, r2));
		
		int r13 = 1;
		int r23 = 3;
		System.out.println(st.solution(r13, r23));
		
		int r12 = 1;
		int r22 = 2;
		System.out.println(st.solution(r12, r22));
		
		int r14 = 1;
		int r24 = 10;
		System.out.println(st.solution(r14, r24));
	}

}

class solutio2 {
	public long solution(int r1, int r2) {
		/*
		 * 0 = 0
		 * 1 = 0 + 5		1
		 * 2 = 8 + 5		8
		 * 3 = 24 + 5		16
		 * 4 = 48 + 5		24
		 * 
		 * 2 = 1
		 * 3 = 4
		 * 4 = 9
		 * 5 = 16
		 * 
		 * 안에는 r의 제곱
		 * 1 = 1 
		 * 2 = 4
		 * 3 = 9
		 * 4 = 16
		 * 
		 */
        long answer = 0L;

        for (int i = 1; i <= r2; i++) {
            int start = (int) Math.ceil(Math.sqrt((long) r1 * r1 - (long) i * i));
            int end = (int) Math.floor(Math.sqrt((long) r2 * r2 - (long) i * i));

            answer += end - start + 1;
        }

        return answer * 4;
    }
}








