package javaProject.controller.Study.Lv0;

import java.util.stream.IntStream;

public class Lv_0_10 {
	/*
	 * 문자열 myString과 pat이 주어집니다. myString에서 pat이 등장하는 횟수를 return 하는 solution 함수를 완성해 주세요.
	 * 
	 * 제한사항
	 * 1 ≤ myString ≤ 1000
	 * 1 ≤ pat ≤ 10
	 * 
	 * 입출력 예
	 * myString		pat		result
	 * "banana"		"ana"	= 2
	 * "aaaa"		"aa"	= 3
	 * 
	 * class Solution {
    public int solution(String myString, String pat) {
        int answer = 0;
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("문자열이 몇 번 등장하는지 세기");
		
		Solution10 st = new Solution10();
		
		System.out.println(st.solution("banana","ana"));
		System.out.println(st.solution("aaaa","aa"));
		
	}

}

class Solution10 {
	public int solution(String myString, String pat) {
        
		return (int) IntStream.range(0, myString.length())
							  .filter(i -> myString.substring(i).startsWith(pat))
							  .count();
		
//		String chk = "";
//        int answer = 0;
//        for(int i=0; i<myString.length(); i++) {
//            for(int j=i; j<pat.length()+i; j++){
//                if(myString.length() -i < pat.length()) {
//                    break;
//                }
//               chk += myString.charAt(j);
//            }
//            if(chk.equals(pat)) {
//                answer += 1;
//            }
//           chk = "";
//        }
//        return answer;
    }
}