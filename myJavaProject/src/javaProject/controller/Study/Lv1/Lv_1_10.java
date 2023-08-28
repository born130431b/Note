package javaProject.controller.Study.Lv1;

public class Lv_1_10 {
	/*
	 * 두 문자열 s와 skip, 그리고 자연수 index가 주어질 때, 다음 규칙에 따라 문자열을 만들려 합니다. 암호의 규칙은 다음과 같습니다.
	 * 		문자열 s의 각 알파벳을 index만큼 뒤의 알파벳으로 바꿔줍니다.
	 * 		index만큼의 뒤의 알파벳이 z를 넘어갈 경우 다시 a로 돌아갑니다.
	 * 		skip에 있는 알파벳은 제외하고 건너뜁니다.
	 * 예를 들어 s = "aukks", skip = "wbqd", index = 5일 때, a에서 5만큼 뒤에 있는 알파벳은 f지만 [b, c, d, e, f]에서 'b'와 'd'는 skip에 포함되므로 세지 않습니다.
	 * 따라서 'b', 'd'를 제외하고 'a'에서 5만큼 뒤에 있는 알파벳은 [c, e, f, g, h] 순서에 의해 'h'가 됩니다. 나머지 "ukks" 또한 위 규칙대로 바꾸면 "appy"가 되며 결과는 "happy"가 됩니다.
	 * 두 문자열 s와 skip, 그리고 자연수 index가 매개변수로 주어질 때 위 규칙대로 s를 변환한 결과를 return하도록 solution 함수를 완성해주세요.
	 * 
	 * 제한사항
	 * 5 ≤ s의 길이 ≤ 50
	 * 1 ≤ skip의 길이 ≤ 10
	 * s와 skip은 알파벳 소문자로만 이루어져 있습니다.
	 * 		skip에 포함되는 알파벳은 s에 포함되지 않습니다.
	 * 1 ≤ index ≤ 20
	 * 
	 * 입출력 예
	 * 	 s		 skip    index    result
	 * "aukks"	 "wbqd"	   5	  "happy"
	 * 
	 * class Solution {
	    	public String solution(String s, String skip, int index) {
		        String answer = "";
		        return answer;
		    }
		}
	 */
	public static void main(String[] args) {
		System.out.println("둘만의 암호");
		Solution10 st = new Solution10();
		String s = "aukks";
		String skip = "wbqd";
		int index = 5;
		System.out.println(st.solution(s, skip, index));

		String s2 = "abcdefglmnopqrstuvwxyz";
		String skip2 = "hijk";
		int index2 = 20;
		System.out.println(st.solution(s2, skip2, index2));

		String s3 = "aukksaukksaukksaukksaukksaukksaukks";
		String skip3 = "wbqd";
		int index3 = 20;
		System.out.println(st.solution(s3, skip3, index3));

		String s4 = "zzzzzzzaaa";
		String skip4 = "wbqd";
		int index4 = 1;
		System.out.println(st.solution(s4, skip4, index4));
		
	}

}

class Solution10 {
    public String solution(String s, String skip, int index) {
        String answer = "";
        for(int i=0; i<s.length(); i++) {
            char temp = s.charAt(i);
            String chk = "";
           for(int j=0; j<skip.length(); j++) {
               if(chk.contains(skip.substring(j, j+1))) {
                   continue;
               }
               chk += skip.substring(j, j+1);
               if(temp + index > 122) {
                   temp -= index;
                   if(temp < skip.charAt(j) && (temp + index) > skip.charAt(j)) {
                       temp += 1;
                   }
                   temp += index;
               } else {
                   if(temp <= skip.charAt(j) && (temp + index) >= skip.charAt(j)) {
                       temp += 1;
                   }
               }
               
           }
           temp += index;
            if(temp > 122) {
                temp -= 26;
            }
           answer += temp;
        }
        return answer;
    }
}