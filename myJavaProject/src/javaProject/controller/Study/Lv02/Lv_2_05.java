package javaProject.controller.Study.Lv02;

public class Lv_2_05 {
	/*
	 * 가로 길이가 2이고 세로의 길이가 1인 직사각형 모양의 타일이 있습니다.
	 * 이 직사각형 타일을 이용하여 세로의 길이가 3이고 가로의 길이가 n인 바닥을 가득 채우려고 합니다.
	 * 타일을 채울 때는 다음과 같이 2가지 방법이 있습니다.
	 * 		타일을 가로로 배치 하는 경우
	 * 		타일을 세로로 배치 하는 경우
	 * 예를들어서 n이 8인 직사각형은 다음과 같이 채울 수 있습니다.
	 * 직사각형의 가로의 길이 n이 매개변수로 주어질 때, 이 직사각형을 채우는 방법의 수를 return 하는 solution 함수를 완성해주세요.
	 * 
	 * 제한사항
	 * 가로의 길이 n은 5,000이하의 자연수 입니다.
	 * 경우의 수가 많아 질 수 있으므로, 경우의 수를 1,000,000,007으로 나눈 나머지를 return해주세요.
	 * 
	 * 입출력 예
	 * n	result
	 * 4	11
	 * 
	 * class Solution {
		    public int solution(int n) {
		        int answer = 0;
		        return answer;
		    }
		}
	 */
	public static void main(String[] args) {
		System.out.println("3 x n 타일링");
		solution5 st = new solution5();
		
		int n = 4;
		System.out.println(st.solution(n));
		
		int n2 = 6;
		System.out.println(st.solution(n2));
		
		int n3 = 8;
		System.out.println(st.solution(n3));
		
		int n4 = 5000;
		System.out.println(st.solution(n4));
	}

}

class solution5 {
	public int solution(int n) {
		/* 
		 * n = (n-2 * 3) + (n-4 * 2 + 2)
		 * 
		 * 점화식....
		 * 
		 */
		if (n % 2 != 0) return 0;

        long[] area = new long[n+1];
        area[2] = 3;
        long sum = 0;

        for (int i = 4; i <= n; i += 2) {
        	area[i] = (area[i - 2] * 3 + (sum * 2 + 2)) % 1000000007L;
            sum += area[i - 2] % 1000000007L;
        }

        return (int) area[n];
    }
}










