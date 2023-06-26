package ladder;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Service {	
	// 임의의 사다리 만들기
	public int[][]  makeLadder(int row, int col) {
		int[][] ladder = new int[row][(col-1)];			
		int preNum=-1;
		for(int j=0;j<ladder[0].length;j++) {
			while(true) {
				int i = (int) Math.round(Math.random()*(row-1));
				if(preNum!=i) {
					ladder[i][j]=1;
					preNum=i;
					break;
				}
			}
		}
		
		for(int i=0;i<ladder.length;i++) {
			for(int j=0;j<ladder[i].length;j++) {
				if(ladder[i][j]==1){
					continue;
				} else if(j==0) {
					if(j+1<ladder[i].length && ladder[i][j+1]==1) {
						ladder[i][j]=0;
					}else {
						ladder[i][j]= (int) Math.round(Math.random());
					}
				} else if(j==ladder[i].length-1) {
					if(ladder[i][j-1]==1) {
						ladder[i][j]=0;
					}else {
						ladder[i][j]= (int) Math.round(Math.random());
					}
				} else{
					if(ladder[i][j-1]==1||ladder[i][j+1]==1) {
						ladder[i][j]=0;
					}else {
						ladder[i][j]= (int) Math.round(Math.random());
					}
				}
			}
		}

		return ladder;
	}
	
	// 해당 번호의 순서
	public static int[] Order(int[][] ladder, int index) {
		int row = ladder.length;
		int col = ladder[0].length;
		
		int[] order = new int[row];
		for(int i=0;i<row;i++) {
			if(index <= col-1 && ladder[i][index]==1) {
				index++;
			} else if(index!=0 && ladder[i][index-1]==1) {
				index--;
			} 
			order[i]=index;
		}
		return order;
	}

	// 해당 번호의 순서
	public static HashMap<Integer, int[]> AllOrder(int[][] ladder) {
		int col = ladder[0].length;
		HashMap<Integer, int[]> map = new HashMap<>();
		for(int i=0;i<col;i++) {
			int[] order = Order(ladder, i);
			map.put(i, order);
		}
		return map;
	}

	// 최종 결과
		public static HashMap<Integer,Integer> getResult(int[][] ladder){
			int row = ladder.length;
			int col = ladder[0].length;
			
			HashMap<Integer,Integer> map = new HashMap<>();
			
			for(int j=0;j<=col;j++) {
				map.put(j,j);
			}
			
			for(int i=0;i<row;i++) {			
				for(int j=0;j<col;j++) {
					if(ladder[i][j]==1) {
						int n=map.get(j);
						int m=map.get(j+1);

						map.put(j, m);
						map.put(j+1, n);
					}
				}				
			}		
			
			// 뒤집힌 HashMap 생성
	        HashMap<Integer, Integer> map2 = new HashMap<>();
	        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
	        	Integer key = entry.getKey();
	            Integer value = entry.getValue();
	            map2.put(value, key);
	        }
	        
			return map2;
		}
}
