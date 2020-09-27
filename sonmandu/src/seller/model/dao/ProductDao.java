package seller.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;
import seller.model.vo.Attachment;
import seller.model.vo.Product;

public class ProductDao {
   private Properties prop = new Properties();
   
   public ProductDao() {
      
      String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
      
      try {
         prop.load(new FileReader(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

  

	public int insertProduct(Connection conn, Product pro, int memNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pro.getProductName());
			pstmt.setInt(2, pro.getPrice());
			pstmt.setInt(3, pro.getCharge());			
			pstmt.setInt(4, pro.getStock());
			pstmt.setInt(5, pro.getProductTime());
			pstmt.setString(6, pro.getCategoryKey());
			pstmt.setInt(7, memNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 사진 게시판의 글 목록 가져오기
	public ArrayList<Product> selectPList(Connection conn,  int memNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectPList");
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, memNum);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Product(rset.getInt("product_Id"),
									rset.getString("product_Name"),
									rset.getInt("price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("pList: " + list);
		return list;
	}
	
	 public ArrayList<Attachment> selectFList(Connection conn, int memNum) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNum);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setProductId(rset.getInt("product_Id"));
				at.setChangeName(rset.getString("change_name"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	} 
	
	
	
	// attachment에 파일 정보 넣기
	public int insertFileList(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);		
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result += pstmt.executeUpdate();
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// memId를 통해 회원 1명 조회용
	public Member selectStore(Connection conn, String memId) {
		Member updateMember = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rset = pstmt.executeQuery();
			
			/*if(rset.next()) {
				updateMember = new Member(
							rset.getString("STORE_NAME"));
			}*/
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return updateMember;
	}



	public ArrayList<Product> selectSPList(Connection conn, int storeId) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectSPList");
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, storeId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Product(rset.getInt("product_Id"),
									rset.getString("product_Name"),
									rset.getInt("price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("pList: " + list);
		return list;
	}



	public ArrayList<Attachment> selectSFList(Connection conn, int storeId) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSFList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setProductId(rset.getInt("product_Id"));
				at.setChangeName(rset.getString("change_name"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}





}