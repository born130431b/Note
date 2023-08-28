package javaProject.controller.Study.Lv1;

import java.util.*;

public class Lv_1_09 {
	/*
	 * An array arr is given.
	 * Each element of arr is a number between 0 through 9.
	 * You want to remove all the duplicate numbers in the array arr except for only one.
	 * However, the order of each element in the array arr should be maintained. For example,
	 * 		When arr = [1, 1, 3, 3, 0, 1, 1], return [1, 3, 0, 1].
	 * 		When arr = [4, 4, 4, 3, 3], return [4, 3].
	 * Write a function solution to return the remaining numbers after removing the duplicate numbers in the array arr except only one.
	 * 
	 * Constraints
	 * Length of array arr : natural number less than or equal to 1,000,000.
	 * Element of array arr : integer between 0 and 9.
	 * 
	 * Examples
	 * 		arr			 answer
	 * [1,1,3,3,0,1,1]	[1,3,0,1]
	 * [4,4,4,3,3]		[4,3]
	 * 
	 * import java.util.*;

		public class Solution {
		    public int[] solution(int []arr) {
		        int[] answer = {};
		        
		        // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
		        System.out.println("Hello Java");
		
		        return answer;
		    }
		}
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("같은 숫자는 싫어");
		Solution9 st = new Solution9();
		
		int []arr = {1,1,3,3,0,1,1};
		System.out.println(Arrays.toString(st.solution(arr)));
		
		int []arr2 = {4,4,4,3,3};
		System.out.println(Arrays.toString(st.solution(arr2)));
	}

}

class Solution9 {
	public int[] solution(int []arr) {
		ArrayList<Integer> list = new ArrayList<>();
		list.add(arr[0]);
		for (int i = 1; i < arr.length; i++) {
			if (arr[i - 1] != arr[i]) {
				list.add(arr[i]);
			}
		}
		int[] answer = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			answer[i] = list.get(i);
		}
		return answer;
    }
}