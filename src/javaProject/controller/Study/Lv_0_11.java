package javaProject.controller.Study;

public class Lv_0_11 {
	/*
	 * 문자열 myString과 pat가 주어집니다.
	 * myString의 부분 문자열중 pat로 끝나는 가장 긴 부분 문자열을 찾아서 return 하는 solution 함수를 완성해 주세요.
	 * 
	 * 제한사항
	 * 5 ≤ myString ≤ 20
	 * 1 ≤ pat ≤ 5
	 * 	   pat은 반드시 myString의 부분 문자열로 주어집니다.
	 * myString과 pat에 등장하는 알파벳은 대문자와 소문자를 구분합니다.
	 * 
	 * 입출력 예
	 * myString		pat		result
	 * "AbCdEFG"	"dE"	= "AbCdE"
	 * "AAAAaaaa"	"a"		= "AAAAaaaa"
	 * 
	 * class Solution {
    public String solution(String myString, String pat) {
        String answer = "";
        return answer;
    }
}
	 */
	public static void main(String[] args) {
		System.out.println("특정 문자열로 끝나는 가장 긴 부분 문자열 찾기");
		
		Solution11 st = new Solution11();
		
		System.out.println(st.solution("AbCdEFG", "dE"));	// "AbCdE"
		System.out.println(st.solution("AAAAaaaa", "a"));	// "AAAAaaaa"
		System.out.println(st.solution( "", "a"));			// ""
		System.out.println(st.solution("AAAAaaaa", ""));	// "AAAAaaaa"
		System.out.println(st.solution("AAAAaaaa", " "));	// ""
		System.out.println(st.solution(" a a a a a ", "a"));// " a a a a a"
		System.out.println(st.solution(" a a a a a ", " "));// " a a a a a "
		
	}

}


class Solution11 {
    public String solution(String myString, String pat) {
    	
    	return myString.substring(0, myString.lastIndexOf(pat) + pat.length());
    	
    	
//        int chk = 0;
//        String answer = "";
//        for(int i=0; i<myString.length(); i++) {
//            if(myString.substring(i).startsWith(pat)){
//                chk = i;
//            }
//        }
//        for(int i=0; i<chk + pat.length(); i++) {
//            answer += myString.charAt(i);
//        }
//        return answer;
    }
}