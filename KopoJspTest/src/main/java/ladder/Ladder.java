package ladder;

public class Ladder {
	private int row;
	private int col;
	private int[][] ladderLine;
	
	public Ladder(int row, int col){
		this.row=row;
		this.col=col;
		Service service = new Service();
		setLadderLine(service.makeLadder(row, col));
	}
	
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}

	public int[][] getLadderLine() {
		return ladderLine;
	}

	public void setLadderLine(int[][] ladderLine) {
		this.ladderLine = ladderLine;
	}
	
}
