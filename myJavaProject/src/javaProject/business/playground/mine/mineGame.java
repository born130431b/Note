package javaProject.business.playground.mine;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class mineGame extends JFrame implements MouseListener {
    private static final int N = 10;
    private int[][] board;
    private boolean[][] visited;
    private int x, y;

    public mineGame() {
        super("지뢰찾기 게임");
        setSize(N * 20, N * 20);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);

        board = new int[N][N];
        visited = new boolean[N][N];

        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                board[i][j] = 0;
                visited[i][j] = false;
            }
        }

        int count = N * N / 4;
        while (count > 0) {
            int i = (int) (Math.random() * N);
            int j = (int) (Math.random() * N);
            if (board[i][j] == 0) {
                board[i][j] = 1;
                count--;
            }
        }

        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                if (board[i][j] == 0) {
                    board[i][j] = 2;
                }
            }
        }

        addMouseListener(this);
    }

    public void paintComponent(Graphics g) {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                if (board[i][j] == 1) {
                    g.setColor(Color.RED);
                    g.fillRect(i * 20, j * 20, 20, 20);
                } else if (board[i][j] == 2) {
                    g.setColor(Color.BLUE);
                    g.fillRect(i * 20, j * 20, 20, 20);
                } else {
                    g.setColor(Color.WHITE);
                    g.fillRect(i * 20, j * 20, 20, 20);
                }
            }
        }
    }
    public void mouseClicked(MouseEvent e) {
        x = e.getX() / 20;
        y = e.getY() / 20;

        if (x >= 0 && x < N && y >= 0 && y < N) {
            if (visited[x][y]) {
                return;
            }

            visited[x][y] = true;

            if (board[x][y] == 1) {
                System.out.println("지뢰 발견: " + x + ", " + y);
                return;
            }

            int[] dx = {0, 1, 0, -1};
            int[] dy = {1, 0, -1, 0};
            for (int k = 0; k < 4; k++) {
                int i = x + dx[k];
                int j = y + dy[k];
                if (i >= 0 && i < N && j >= 0 && j < N) {
                    if (board[i][j] == 1) {
                        board[x][y] = 1;
                        break;
                    }
                }
            }

            repaint();
        }
    }

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
}