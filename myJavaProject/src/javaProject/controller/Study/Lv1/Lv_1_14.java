package javaProject.controller.Study.Lv1;

public class Lv_1_14 {
	/*
	 * 지뢰에 인접한 위, 아래, 좌, 우 대각선 칸을 모두 위험지역으로 분류합니다.
	 * 지뢰는 2차원 배열 board에 1로 표시되어 있고 board에는 지뢰가 매설 된 지역 1과, 지뢰가 없는 지역 0만 존재합니다.
	 * 지뢰가 매설된 지역의 지도 board가 매개변수로 주어질 때, 안전한 지역의 칸 수를 return하도록 solution 함수를 완성해주세요.
	 * 
	 * 제한사항
	 * board는 n * n 배열입니다.
	 * 1 ≤ n ≤ 100
	 * 지뢰는 1로 표시되어 있습니다.
	 * board에는 지뢰가 있는 지역 1과 지뢰가 없는 지역 0만 존재합니다.
	 * 
	 * 입출력 예
	 * 											board																			  result
	 * [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]]										16
	 * [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 1, 0], [0, 0, 0, 0, 0]]										13
	 * [[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]]		0
	 * 
	 * class Solution {
		    public int solution(int[][] board) {
		        int answer = 0;
		        return answer;
		    }
		}
	 * 
	 * 
	 */
	public static void main(String[] args) {
		System.out.println("안전지대");
		Solution14 st = new Solution14();
		
		int[][] board = {{0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 1, 0, 0}, {0, 0, 0, 0, 0}};
		System.out.println(st.solution(board));
		
		int[][] board2 = {{0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 1, 1, 0}, {0, 0, 0, 0, 0}};
		System.out.println(st.solution(board2));
		
		int[][] board3 = {{1, 1, 1, 1, 1}, {1, 1, 1, 1, 1}, {1, 1, 1, 1, 1}, {1, 1, 1, 1, 1}, {1, 1, 1, 1, 1}};
		System.out.println(st.solution(board3));
		
		int[][] board4 = {{1}};
		System.out.println(st.solution(board4));
		
		
	}

}



class Solution14 {
	public int solution(int[][] board) {
        int answer = 0;
        int size = board.length;
        
        if(size == 1){
        	return board[0][0] == 1? 0:1;
        } else if(board[0].length == 1 && board[1].length == 1) {
        	return board[0][0] == 1 || board[1][0]== 1 ? 0:2;
        }
        
        for(int i=0; i<size; i++) {
        	
        	for(int j=0; j<size; j++) {
        		if(board[i][j] == 1) {
        			answer++;
        			continue;
        		}
        		
        		if(i != 0 && i+1 != size && j != 0 && j+1 != size) {
        			if(board[i-1][j-1] == 1 || board[i-1][j] == 1 || board[i-1][j+1] == 1
        			|| board[i][j-1]   == 1 || board[i][j+1] == 1
        			|| board[i+1][j-1] == 1 || board[i+1][j] == 1 || board[i+1][j+1] == 1) {
        				answer++;
        			}
        		} else if(i == 0 && j == 0) {
        			if(board[i+1][j] == 1|| board[i+1][j+1] == 1|| board[i][j+1] == 1) {
        				answer++;
        			}
        		} else if(i == 0 && j+1 == size) {
        			if(board[i+1][j] == 1|| board[i+1][j-1] == 1|| board[i][j-1] == 1) {
        				answer++;
        			}
        		} else if(i+1 == size && j == 0) {
        			if(board[i-1][j] == 1|| board[i-1][j+1] == 1|| board[i][j+1] == 1) {
        				answer++;
        			}
        		} else if(i+1 == size && j+1 == size) {
        			if(board[i][j-1] == 1|| board[i-1][j-1] == 1|| board[i-1][j] == 1) {
        				answer++;
        			}
        		} else if(i == 0) {
        			if(board[i][j-1] == 1 || board[i+1][j-1] == 1|| board[i][j+1] == 1|| board[i+1][j] == 1|| board[i+1][j+1] == 1) {
        				answer++;
        			}
        		} else if(i+1 == size) {
        			if(board[i][j-1] == 1 || board[i-1][j-1] == 1|| board[i-1][j] == 1|| board[i-1][j+1] == 1|| board[i][j+1] == 1) {
        				answer++;
        			}
        		} else if(j == 0) {
        			if(board[i-1][j] == 1 || board[i-1][j+1] == 1|| board[i][j+1] == 1|| board[i+1][j] == 1|| board[i+1][j+1] == 1) {
        				answer++;
        			}
        		} else if(j+1 == size) {
        			if(board[i-1][j] == 1 || board[i-1][j-1] == 1|| board[i][j-1] == 1|| board[i+1][j-1] == 1|| board[i+1][j] == 1) {
        				answer++;
        			}
        		}
        		
        	}
        }
        
        return size * size - answer;
    }
}







