package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class BuyBasketServlet
 */
@WebServlet("/buy.bas")
public class BuyBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String pNo = request.getParameter("pNoList");
		String pQuantity = request.getParameter("pQuantityList");
		
		String[] pNoList = pNo.split(",");
		
		ArrayList<Product> bList = new ProductService().buyBasket(pNoList);
		
		System.out.println(pNoList);
		System.out.println(pQuantity);
		System.out.println(bList);
		System.out.println("0");
		
		if(bList != null) {
			request.setAttribute("bList", bList);
			request.setAttribute("pQuantity", pQuantity);
			request.getRequestDispatcher("views/product/basketBuyPage.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "물품 구매를 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
