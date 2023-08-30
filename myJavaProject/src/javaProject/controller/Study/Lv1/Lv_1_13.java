package javaProject.controller.Study.Lv1;

public class Lv_1_13 {
	/*
	 * 숫자로 이루어진 문자열 t와 p가 주어질 때, t에서 p와 길이가 같은 부분문자열 중에서, 이 부분문자열이 나타내는 수가 p가 나타내는 수보다 작거나 같은 것이 나오는 횟수를 return하는 함수 solution을 완성하세요.
	 * 예를 들어, t="3141592"이고 p="271" 인 경우, t의 길이가 3인 부분 문자열은 314, 141, 415, 159, 592입니다.
	 * 이 문자열이 나타내는 수 중 271보다 작거나 같은 수는 141, 159 2개 입니다.
	 * 
	 * 제한사항
	 * 1 ≤ p의 길이 ≤ 18
	 * p의 길이 ≤ t의 길이 ≤ 10,000
	 * t와 p는 숫자로만 이루어진 문자열이며, 0으로 시작하지 않습니다.
	 * 
	 * 입출력 예
	 *     t			  p		result
	 * "3141592"		"271"	2
	 * "500220839878"	"7"		8
	 * "10203"			"15"	3
	 * 
	 * class Solution {
		    public int solution(String t, String p) {
		        int answer = 0;
		        return answer;
		    }
		}
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("크기가 작은 부분문자열");
		Solution13 st = new Solution13();
		
		String t = "3141592";
		String p = "271";
		System.out.println(st.solution(t, p));
		
		String t2 = "500220839878";
		String p2 = "7";
		System.out.println(st.solution(t2, p2));
		
		String t3 = "10203";
		String p3 = "15";
		System.out.println(st.solution(t3, p3));
	}

}


class Solution13 {
	public int solution(String t, String p) {
        int answer = 0;
        for(int i=0; i<=t.length()-p.length(); i++) {
            if(p.length() > 9) {
                for(int j=0; j<p.length()-9; j++) {
                    int tTemp = Integer.parseInt(t.substring(i+j, i+j+9));
                    
                    if(tTemp > Integer.parseInt(p.substring(j, j+9))) {
                        break;
                    }else if(tTemp <= Integer.parseInt(p.substring(j, j+9))) {
                        answer++;
                        break;
                    }
                }
                if(i+9 == t.length()) {
                    break;
                }
            } else if(Integer.parseInt(t.substring(i, p.length() +i)) <= Integer.parseInt(p)) {
                answer++;
            }
        }
        return answer;
    }
}