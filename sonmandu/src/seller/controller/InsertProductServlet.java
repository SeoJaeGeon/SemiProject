package seller.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import seller.model.service.ProductService;
import seller.model.vo.Attachment;
import seller.model.vo.Product;

/**
 * Servlet implementation class InsertProductServlet
 */
@WebServlet("/insert.product")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 한글이 있을 경우 인코딩 처리
		request.setCharacterEncoding("UTF-8");

		

		
		if (ServletFileUpload.isMultipartContent(request)) {
			System.out.println("오니?");

			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "resources/productImg/";

			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			ArrayList<String> changeFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multipartRequest.getFileNames();

			while (files.hasMoreElements()) {
				String name = files.nextElement();
				if (multipartRequest.getFilesystemName(name) != null) { 

					String changeName = multipartRequest.getFilesystemName(name);
					String originName = multipartRequest.getOriginalFileName(name);
					changeFiles.add(changeName);
					originFiles.add(originName);
				}
			}

			
			ArrayList<Attachment> fileList = new ArrayList<>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(changeFiles.get(i));

				if (i == originFiles.size() - 1) {
					at.setFileLevel(0);
				} else {
					at.setFileLevel(1);
				}

				fileList.add(at);
			}


			// 2. request에 담겨있는 값들을 꺼내서 변수에 저장 및 객체 생성


			String prouctName = multipartRequest.getParameter("prouctName");
			int price = Integer.parseInt(multipartRequest.getParameter("price"));
			int charge = Integer.parseInt(multipartRequest.getParameter("charge"));
			int stock = Integer.parseInt(multipartRequest.getParameter("stock"));
			int productTime = Integer.parseInt(multipartRequest.getParameter("productTime"));
			String categoryKey = multipartRequest.getParameter("categoryKey");

			System.out.println("prouctName : " + prouctName);
			System.out.println("price : " + price);
			System.out.println("charge : " + charge);
			System.out.println("stock : " + stock);
			System.out.println("productTime : " + productTime);
			System.out.println("categoryKey : " + categoryKey);
			
			int memNum = ((Member)request.getSession().getAttribute("loginUser")).getMemNum();
			Product pro = new Product(prouctName, price, charge, stock, productTime, categoryKey);			
			int result = new ProductService().insertProduct(pro,fileList,memNum);		

			if (result > 0) {

				request.getSession().setAttribute("msg", "상품 등록이 완료");
				response.sendRedirect(request.getContextPath() + "/main.sell");
			} else {

				for(int i = 0; i < changeFiles.size(); i++) {
					File failedFile = new File(savePath + changeFiles.get(i));
					failedFile.delete();
				}
				request.setAttribute("msg", "상품 등록 실패");
				RequestDispatcher view = request.getRequestDispatcher("views/main/Main.jsp");
				view.forward(request, response);
			}
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
