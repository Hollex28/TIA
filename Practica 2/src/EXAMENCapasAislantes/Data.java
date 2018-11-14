package EXAMENCapasAislantes;


public class Data {
	 // En total hay NumeroSimbolos+1 numeros
	public static int[][] matriz;
	public static Integer[] capas = {0,1,2,3,4,5,6,7,8,9,10,11};//(A=0;B=1;C=2;D=3;E=4;F=5;G=6;H=7;I=8;J=9;K=10;L=11)
	public Data() {
		matriz = new int[12][12];
		// FILA A
		matriz[0][0] = -1;
		matriz[0][1] = 10;
		matriz[0][2] = 15;
		matriz[0][3] = 25;
		matriz[0][4] = 32;
		matriz[0][5] = 25;
		matriz[0][6] = 21;
		matriz[0][7] = 21;
		matriz[0][8] = 15;
		matriz[0][9] = 22;
		matriz[0][10] = 12;
		matriz[0][11] = 54;
		
		matriz[1][0] = 41;
		matriz[1][1] = -1;
		matriz[1][2] = 57;
		matriz[1][3] = 24;
		matriz[1][4] = 52;
		matriz[1][5] = 2;
		matriz[1][6] = 66;
		matriz[1][7] = 55;
		matriz[1][8] = 61;
		matriz[1][9] = 15;
		matriz[1][10] = 6;
		matriz[1][11] = 7;
		
		matriz[2][0] = 21;
		matriz[2][1] = 31;
		matriz[2][2] = -1;
		matriz[2][3] = 21;
		matriz[2][4] = 21;
		matriz[2][5] = 44;
		matriz[2][6] = 21;
		matriz[2][7] = 22;
		matriz[2][8] = 22;
		matriz[2][9] = 61;
		matriz[2][10] = 47;
		matriz[2][11] = 61;
		
		matriz[3][0] = 66;
		matriz[3][1] = 22;
		matriz[3][2] = 15;
		matriz[3][3] = -1;
		matriz[3][4] = 47;
		matriz[3][5] = 21;
		matriz[3][6] = 41;
		matriz[3][7] = 15;
		matriz[3][8] = 21;
		matriz[3][9] = 22;
		matriz[3][10] = 32;
		matriz[3][11] = 34;
		
		// Fila E
		matriz[4][0] = 21;
		matriz[4][1] = 44;
		matriz[4][2] = 61;
		matriz[4][3] = 47;
		matriz[4][4] = -1;
		matriz[4][5] = 32;
		matriz[4][6] = 26;
		matriz[4][7] = 61;
		matriz[4][8] = 55;
		matriz[4][9] = 34;
		matriz[4][10] = 18;
		matriz[4][11] = 12;
		
		matriz[5][0] = 22;
		matriz[5][1] = 18;
		matriz[5][2] = 22;
		matriz[5][3] = 23;
		matriz[5][4] = 41;
		matriz[5][5] = -1;
		matriz[5][6] = 21;
		matriz[5][7] = 22;
		matriz[5][8] = 44;
		matriz[5][9] = 55;
		matriz[5][10] = 54;
		matriz[5][11] = 54;
		
		matriz[6][0] = 15;
		matriz[6][1] = 25;
		matriz[6][2] = 34;
		matriz[6][3] = 21;
		matriz[6][4] = 26;
		matriz[6][5] = 27;
		matriz[6][6] = -1;
		matriz[6][7] = 34;
		matriz[6][8] = 25;
		matriz[6][9] = 41;
		matriz[6][10] = 7;
		matriz[6][11] = 22;
	
		matriz[7][0] = 61;
		matriz[7][1] = 34;
		matriz[7][2] = 12;
		matriz[7][3] = 54;
		matriz[7][4] = 21;
		matriz[7][5] = 23;
		matriz[7][6] = 15;
		matriz[7][7] = -1;
		matriz[7][8] = 21;
		matriz[7][9] = 21;
		matriz[7][10] = 55;
		matriz[7][11] = 55;
		
		// Fila I
		matriz[8][0] = 22;
		matriz[8][1] = 54;
		matriz[8][2] = 54;
		matriz[8][3] = 65;
		matriz[8][4] = 3;
		matriz[8][5] = 25;
		matriz[8][6] = 61;
		matriz[8][7] = 77;
		matriz[8][8] = -1;
		matriz[8][9] = 47;
		matriz[8][10] = 22;
		matriz[8][11] = 22;
		
		matriz[9][0] = 34;
		matriz[9][1] = 7;
		matriz[9][2] = 22;
		matriz[9][3] = 23;
		matriz[9][4] = 54;
		matriz[9][5] = 42;
		matriz[9][6] = 22;
		matriz[9][7] = 54;
		matriz[9][8] = 21;
		matriz[9][9] = -1;
		matriz[9][10] = 12;
		matriz[9][11] = 15;
		
		matriz[10][0] = 26;
		matriz[10][1] = 61;
		matriz[10][2] = 55;
		matriz[10][3] = 22;
		matriz[10][4] = 18;
		matriz[10][5] = 18;
		matriz[10][6] = 22;
		matriz[10][7] = 18;
		matriz[10][8] = 34;
		matriz[10][9] = 21;
		matriz[10][10] = -1;
		matriz[10][11] = 12;
		
		matriz[11][0] = 22;
		matriz[11][1] = 18;
		matriz[11][2] = 25;
		matriz[11][3] = 34;
		matriz[11][4] = 21;
		matriz[11][5] = 22;
		matriz[11][6] = 18;
		matriz[11][7] = 61;
		matriz[11][8] = 55;
		matriz[11][9] = 2;
		matriz[11][10] = 22;
		matriz[11][11] = -1;
		
	}
}
