package seller.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import seller.model.service.ProductService;
import seller.model.vo.Product;



/**
 * Servlet implementation class SellerMainServlet
 */
@WebServlet("/home.sell")
public class SellerHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memNum = ((Member)request.getSession().getAttribute("loginUser")).getMemNum();
		
		System.out.println("mem :" + memNum);
		
		HashMap<String, Object> hmap = new ProductService().selectProList(memNum);
		
		if(hmap.get("pList") != null && hmap.get("fList") != null) {
			System.out.println(hmap.get("pList"));
			System.out.println(hmap.get("fList"));
			
			request.setAttribute("pList", hmap.get("pList"));
			request.setAttribute("fList", hmap.get("fList"));
			request.getRequestDispatcher("views/seller/sellerHomeForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "회원정보 수정에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
