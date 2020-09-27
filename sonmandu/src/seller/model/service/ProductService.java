package seller.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import seller.model.dao.ProductDao;
import seller.model.vo.Attachment;
import seller.model.vo.Product;

public class ProductService {
	


public int insertProduct(Product pro, ArrayList<Attachment> fileList, int memNum) {
		Connection conn = getConnection();
		int result = 0;

		int result1 = new ProductDao().insertProduct(conn, pro, memNum);	
		int result2 = new ProductDao().insertFileList(conn, fileList);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}

		close(conn);

		return result;

	}

	public ArrayList<Product> selectList(int memNum) {

		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectPList(conn, memNum);
		
		close(conn);
		
		return list;
	}
	
	
	// 사진게시판 리스트 가져오기
	public HashMap<String, Object> selectProList(int memNum) {
		Connection conn = getConnection();
		
		ProductDao pDao = new ProductDao();
		
		// 1. 사진게시판에 등록 된 Product 리스트
		ArrayList<Product> pList = pDao.selectPList(conn,memNum);
		
		// 2. 사진게시판에 등록 된 Attachment 리스트
		ArrayList<Attachment> fList = pDao.selectFList(conn, memNum);
		
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("pList", pList);
		hmap.put("fList", fList);
		
		close(conn);
		
		return hmap;
	}

	public HashMap<String, Object> selectProSList(int storeId) {
Connection conn = getConnection();
		
		ProductDao pDao = new ProductDao();
		
		// 1. 사진게시판에 등록 된 Product 리스트
		ArrayList<Product> pList = pDao.selectSPList(conn,storeId);
		
		// 2. 사진게시판에 등록 된 Attachment 리스트
		ArrayList<Attachment> fList = pDao.selectSFList(conn, storeId);
		
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("pList", pList);
		hmap.put("fList", fList);
		
		close(conn);
		
		return hmap;
	}





}