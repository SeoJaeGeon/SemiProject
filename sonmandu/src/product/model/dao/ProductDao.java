package product.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import product.model.vo.Basket;
import product.model.vo.History;
import product.model.vo.Order;
import product.model.vo.Payment;
import product.model.vo.Product;

public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		
		String fileName = ProductDao.class.getResource("/sql/product/product-Squery.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Product> selectPList(Connection conn, String cate_key) {
		PreparedStatement pstmt = null;
		ArrayList<Product> pList = new ArrayList<>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cate_key);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductId(rset.getInt("PRODUCT_ID"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				pro.setPrice(rset.getInt("PRICE"));
				pro.setStock(rset.getInt("STOCK"));
				pro.setProductTime(rset.getInt("PRODUCT_TIME"));
				pro.setCharge(rset.getInt("CHARGE"));
				pro.setCategoryName(rset.getString("CATEGORY_NAME"));
				pro.setStoreName(rset.getString("STORE_NAME"));
				pro.setFilePath(rset.getString("FILE_PATH"));
				pro.setChangeName(rset.getString("CHANGE_NAME"));
				
				pList.add(pro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pList;
	}

	public ArrayList<Product> selectProduct(Connection conn, String pNo) {
		PreparedStatement pstmt = null;
		ArrayList<Product> pList = new ArrayList<>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pNo));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductId(rset.getInt("PRODUCT_ID"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				pro.setPrice(rset.getInt("PRICE"));
				pro.setCharge(rset.getInt("CHARGE"));
				pro.setProductTime(rset.getInt("PRODUCT_TIME"));
				pro.setStock(rset.getInt("STOCK"));
				pro.setCategoryName(rset.getString("CATEGORY_NAME"));
				pro.setStoreName(rset.getString("STORE_NAME"));
				pro.setFilePath(rset.getString("FILE_PATH"));
				pro.setChangeName(rset.getString("CHANGE_NAME"));
				pro.setFileLevel(rset.getInt("FILE_LEVEL"));
				pro.setStoreId(rset.getInt("STORE_ID"));
				pList.add(pro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pList;
	}

	public ArrayList<Product> buyProduct(Connection conn, String pNo) {
		PreparedStatement pstmt = null;
		ArrayList<Product> pList = new ArrayList<>();
		ResultSet rset = null;
		String sql = prop.getProperty("buyProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pNo));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductId(rset.getInt("PRODUCT_ID"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				pro.setPrice(rset.getInt("PRICE"));
				pro.setCharge(rset.getInt("CHARGE"));
				pro.setProductTime(rset.getInt("PRODUCT_TIME"));
				pro.setStock(rset.getInt("STOCK"));
				pro.setCategoryName(rset.getString("CATEGORY_NAME"));
				pro.setStoreName(rset.getString("STORE_NAME"));
				pro.setFilePath(rset.getString("FILE_PATH"));
				pro.setChangeName(rset.getString("CHANGE_NAME"));
				pro.setFileLevel(rset.getInt("FILE_LEVEL"));
				
				pList.add(pro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pList;
	}

	public int insertBasket(Connection conn, Basket b) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertBasket");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, b.getQuantity()); 
			pstmt.setInt(2, b.getProductId());
			pstmt.setInt(3, b.getMemId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Basket> selectBasket(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ArrayList<Basket> bList = new ArrayList<>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectBasket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Basket bas = new Basket();
				bas.setMemId(rset.getInt("MEM_NUM"));
				bas.setBasketId(rset.getInt("BASKET_ID"));
				bas.setChangeName(rset.getString("CHANGE_NAME"));
				bas.setProductId(rset.getInt("PRODUCT_ID"));
				bas.setProductName(rset.getString("PRODUCT_NAME"));
				bas.setStoreName(rset.getString("STORE_NAME"));
				bas.setQuantity(rset.getInt("QUANTITY"));
				bas.setPrice(rset.getInt("PRICE"));
				bas.setCharge(rset.getInt("CHARGE"));
				
				bList.add(bas);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bList;
	}

	public int deleteBasket(Connection conn, String[] basketId) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteBasket");

		try {
			pstmt = conn.prepareStatement(sql);
			for(String s : basketId) {
				pstmt.setInt(1, Integer.parseInt(s));
				
				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertPay1(Connection conn, Payment pay) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertPay1");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pay.getMemNum());
			pstmt.setInt(2, pay.getTotalSal());
			pstmt.setString(3, pay.getOrderName());
			pstmt.setString(4, pay.getOrderPhone());
			pstmt.setString(5, pay.getOrderEmail());
			pstmt.setString(6, pay.getOrderAddress());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertPay2(Connection conn, History his) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertPay2");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, his.getProductNum());
			pstmt.setInt(2, his.getOrderQuantity());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Product> buyBasket(Connection conn, String[] pNoList) {
		PreparedStatement pstmt = null;
		ArrayList<Product> pList = new ArrayList<>();
		ResultSet rset = null;
		String sql = prop.getProperty("buyBasket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(String s : pNoList) {
				pstmt.setInt(1, Integer.parseInt(s));
			
				rset = pstmt.executeQuery();
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductId(rset.getInt("PRODUCT_ID"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				pro.setPrice(rset.getInt("PRICE"));
				pro.setCharge(rset.getInt("CHARGE"));
				pro.setProductTime(rset.getInt("PRODUCT_TIME"));
				pro.setStock(rset.getInt("STOCK"));
				pro.setCategoryName(rset.getString("CATEGORY_NAME"));
				pro.setStoreName(rset.getString("STORE_NAME"));
				pro.setFilePath(rset.getString("FILE_PATH"));
				pro.setChangeName(rset.getString("CHANGE_NAME"));
				pro.setFileLevel(rset.getInt("FILE_LEVEL"));
				
				pList.add(pro);
			}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pList;
	}

	public int insertPayBasket1(Connection conn, Payment pay, String[] totalSal) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertPayBasket1");

		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<totalSal.length; i++) {
				pstmt.setInt(1, pay.getMemNum());
				pstmt.setInt(2, Integer.parseInt(totalSal[i]));
				pstmt.setString(3, pay.getOrderName());
				pstmt.setString(4, pay.getOrderPhone());
				pstmt.setString(5, pay.getOrderEmail());
				pstmt.setString(6, pay.getOrderAddress());
				
				result += pstmt.executeUpdate();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertPayBasket2(Connection conn, String[] pNo, String[] proVal) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertPayBasket2");

		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<proVal.length; i++) {
				pstmt.setInt(1, Integer.parseInt(pNo[i]));
				pstmt.setInt(2, Integer.parseInt(proVal[i]));
								
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int successPayBasket(Connection conn, int mNum) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("successPayBasket");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNum);
								
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Payment selectInfo(Connection conn, String name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Payment pay = new Payment();
		String sql = prop.getProperty("successInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				pay.setOrderName(rset.getString("ORDER_NAME"));
				pay.setOrderPhone(rset.getString("ORDER_PHONE"));
				pay.setOrderEmail(rset.getString("ORDER_EMAIL"));
				pay.setOrderAddress(rset.getString("ORDER_ADDRESS"));
				pay.setPaySelect(rset.getString("PAY_SELECT"));
				pay.setPayDate(rset.getDate("PAY_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pay;
	}

	public ArrayList<Product> searchProductList(Connection conn, String name) {
		PreparedStatement pstmt = null;
		ArrayList<Product> pList = new ArrayList<>();
		ResultSet rset = null;
		String sql = prop.getProperty("search");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, name);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductId(rset.getInt("PRODUCT_ID"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				pro.setPrice(rset.getInt("PRICE"));
				pro.setStock(rset.getInt("STOCK"));
				pro.setProductTime(rset.getInt("PRODUCT_TIME"));
				pro.setCharge(rset.getInt("CHARGE"));
				pro.setCategoryName(rset.getString("CATEGORY_NAME"));
				pro.setStoreName(rset.getString("STORE_NAME"));
				pro.setFilePath(rset.getString("FILE_PATH"));
				pro.setChangeName(rset.getString("CHANGE_NAME"));
				
				pList.add(pro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;
	}
	
	public ArrayList<Order> selectOrderList(Connection conn, int memNum) {
		PreparedStatement pstmt = null;
	    ArrayList<Order> oList = new ArrayList<>();
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectHistoryList");
	    
	    try {
	       pstmt = conn.prepareStatement(sql);
	       pstmt.setInt(1, memNum);
	       
	       rset = pstmt.executeQuery();
	       
	       while(rset.next()) {
	    	   Order or = new Order();
	    	   or.setPay_date(rset.getDate("pay_date"));
	    	   or.setChange_name(rset.getString("change_name"));
	    	   or.setProduct_name(rset.getString("product_name"));
	    	   or.setOrder_quantity(rset.getInt("order_quantity"));
	    	   or.setTotal_sal(rset.getInt("total_sal"));
	          
	          
	          oList.add(or);
	          System.out.println(oList);
	       }
	       
	    } catch (SQLException e) {
	       e.printStackTrace();
	    } finally {
	       close(rset);
	       close(pstmt);
	    }
	    
	    return oList;
	}

}
