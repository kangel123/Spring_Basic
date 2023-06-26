package model1;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//검색 후 조건에 맞는 게시물 개수 반환
	public int selectCount(Map<String,Object> map) {
		int totalCount=0;
		
		String query = "select count(*) from board";
		if(map.get("searchWord")!=null) {
			query += " Where "+map.get("searchField")
				+" Like '%"+map.get("searchWord")+"%'";			
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);		
		} catch(Exception e) {
			System.out.println("게시물 개수 구하는 중 에러 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String,Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "select * from board";	
		if(map.get("searchWord")!=null) {
			query += " where "+map.get("searchField")
				+" Like '%"+map.get("searchWord")+"%'";			
		}
		query += " order by num desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setNum(rs.getString("Num"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setPostdate(rs.getDate("postdate"));
				boardDTO.setVisitcount(rs.getString("visitcount"));
				bbs.add(boardDTO);
			}	
		} catch(Exception e) {
			System.out.println("게시물 구하는 중 에러 발생");
			e.printStackTrace();
		}		
		return bbs;
	}	
	
	public boolean Write(BoardDTO boardDTO) {		
		String query = "insert into(title,content,id,postdate,visitcount)"
				+" board value(seq_board_num.NEXTVAL,?,?,?,?,0)";					
		try {	
			psmt.setString(1, boardDTO.getTitle());
			psmt.setString(2, boardDTO.getContent());
			psmt.setString(3, boardDTO.getId());
			psmt.setDate(4, boardDTO.getPostdate());
			psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 저장 중 에러 발생");
			e.printStackTrace();
			return false;
		}		
		return true;
	}	
}
