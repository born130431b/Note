package javaProject.controller.Study;

import java.util.*;

public class Lv_0_04 {
	/*
	 * 문자열 binomial이 매개변수로 주어집니다.
	 * binomial은 "a op b" 형태의 이항식이고 a와 b는 음이 아닌 정수, op는 '+', '-', '*' 중 하나입니다.
	 * 주어진 식을 계산한 정수를 return 하는 solution 함수를 작성해 주세요.
	 * 
	 * 제한사항
	 * 0 ≤ a, b ≤ 40,000
	 * 0을 제외하고 a, b는 0으로 시작하지 않습니다.
	 * 
	 * 입출력 예
	 * "43 + 12" = 	55
	 * "0 - 7777" = -7777
	 * "40000 * 40000" = 1600000000
	 * 
	 * class Solution {
    public int solution(String binomial) {
        int answer = 0;
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("간단한 식 계산하기");
		Solution4 solution = new Solution4();
		
		System.out.println(solution.solution("43 + 12"));
		System.out.println(solution.solution("0 - 7777"));
		System.out.println(solution.solution("40000 * 40000"));
	}

}


class Solution4 {
    public int solution(String binomial) {
    	String[] calculate = new String[binomial.split(" ").length];
    	//String[] cal = binomial.split(" ");
    	
    	int answer = 0;
    	
    	calculate = binomial.split(" ");
    	if(calculate[1].equals("+")) {
    		answer = Integer.parseInt(calculate[0]) + Integer.parseInt(calculate[2]); 
    	} else if(calculate[1].equals("-")) {
    		answer = Integer.parseInt(calculate[0]) - Integer.parseInt(calculate[2]); 
    	} else {
    		answer = Integer.parseInt(calculate[0]) * Integer.parseInt(calculate[2]); 
    	}
        
        return answer;
    }
}





