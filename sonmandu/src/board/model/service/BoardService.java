package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.Reply;
import board.model.vo.Search;

public class BoardService {

	public HashMap<String, Object> selectList(int currentPage) {
		Connection conn = getConnection();
		BoardDao bDao = new BoardDao();
		
		int listCount = bDao.getListCount(conn);
		
		// 페이징 처리 추가
				int pageLimit = 10; // 한 페이지 하단에 보여질 페이징 바의 갯수
				int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 수
				int maxPage; // 전체 페이지에서 가장 마지막 페이지
				int startPage; // 한 페이지 하단에 보여질 시작 페이지
				int endPage; // 한 페이지 하단에 보여질 끝 페이지

				maxPage = (int) Math.ceil((double) listCount / boardLimit);

				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

				endPage = startPage + pageLimit - 1;

				if (maxPage < endPage) {
					endPage = maxPage;
				}

				
				PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

				ArrayList<Board> list = bDao.selectList(conn, pi);

				HashMap<String, Object> hmap = new HashMap<>();

				hmap.put("list", list);
				hmap.put("pi", pi);

				close(conn);
		
				return hmap;
	}

	// 게시글 작성용 서비스
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 검색 된 결과 리스트 리턴하는 메소드
	public HashMap<String, Object> selectSearchList(int currentPage, Search s) {
		Connection conn = getConnection();
		BoardDao bDao = new BoardDao();
		
		int listCount = bDao.getSearchListCount(conn, s);
		
		int pageLimit = 10;		
		int boardLimit = 10;	
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		ArrayList<Board> list = bDao.selectSearchList(conn, pi, s);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("pi", pi);
		hmap.put("list", list);
		
		return hmap;
	}

	// 게시판 상세보기 + 조회수 증가
	public Board selectBoard(int bId) {
		Connection conn = getConnection();
		BoardDao bDao = new BoardDao();
		
		int result = bDao.increaseCount(conn, bId);
		
		Board b = null;
		
		if(result > 0) {
			commit(conn);
			b = bDao.selectBoard(conn, bId);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}

	// 게시글 상세보기 + 조회수 증가X
	public Board selectBoardNoCnt(int bId) {
		Connection conn = getConnection();
		BoardDao bDao = new BoardDao();
		Board b = bDao.selectBoard(conn, bId);
		close(conn);
		return b;
	}

	// 게시글 삭제
	public int deleteBoard(int bId) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	

}
