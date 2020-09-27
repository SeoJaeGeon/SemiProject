package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.dao.ProductDao;
import product.model.vo.Basket;
import product.model.vo.History;
import product.model.vo.Order;
import product.model.vo.Payment;
import product.model.vo.Product;

public class ProductService {

	public ArrayList<Product> selectProductList(String cate_key) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		ArrayList<Product> pList = pDao.selectPList(conn, cate_key);
		
		close(conn);
		
		return pList;
	}

	public ArrayList<Product> selectProduct(String pNo) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		ArrayList<Product> pList = pDao.selectProduct(conn, pNo);
		
		close(conn);
		
		return pList;
	}

	public ArrayList<Product> buyProduct(String pNo) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		ArrayList<Product> pList = pDao.buyProduct(conn, pNo);
		
		close(conn);
		
		return pList;
	}

	public int insertBasket(Basket b) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		int result = pDao.insertBasket(conn, b);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public ArrayList<Basket> selectBasket(String userId) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		ArrayList<Basket> bList = pDao.selectBasket(conn, userId);
		
		close(conn);
		
		return bList;
	}

	public int deleteBasket(String[] basketId) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		int result = pDao.deleteBasket(conn, basketId);
		
		System.out.println("result : "+result);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int insertPay(Payment pay, History his) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		int result = 0;
		int result1 = pDao.insertPay1(conn, pay);
		int result2 = pDao.insertPay2(conn, his);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
			result=1;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Product> buyBasket(String[] pNoList) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		ArrayList<Product> pList = pDao.buyBasket(conn, pNoList);
		
		close(conn);
		
		return pList;
	}

	public int insertPayBasket(Payment pay, String[] totalSal, String[] pNo, String[] proVal) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		int result = 0;
		int result1 = pDao.insertPayBasket1(conn, pay, totalSal);
		int result2 = pDao.insertPayBasket2(conn, pNo, proVal);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
			result=1;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int successPayBasket(int mNum) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		int result = pDao.successPayBasket(conn, mNum);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public Payment selectInfo(String name) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		Payment pay = pDao.selectInfo(conn, name);
		
		close(conn);
		
		return pay;
	}

	public ArrayList<Product> searchProductList(String name) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();
		
		ArrayList<Product> pList = pDao.searchProductList(conn, name);
		
		close(conn);
		
		return pList;
	}
	
	public ArrayList<Order> selectOrderList(int memNum) {
		Connection conn = getConnection();
		ProductDao pDao = new ProductDao();

		ArrayList<Order> oList = pDao.selectOrderList(conn, memNum);

		close(conn);

		return oList;
	}

}