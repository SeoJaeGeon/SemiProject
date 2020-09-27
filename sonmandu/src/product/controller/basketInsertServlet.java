package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Basket;

/**
 * Servlet implementation class basketServlet
 */
@WebServlet("/insert.bas")
public class basketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public basketInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int userNum = loginUser.getMemNum();
		int proVal = Integer.parseInt(request.getParameter("proVal"));
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		
		Basket b = new Basket(proVal, pNo, userNum);
		
		int result = new ProductService().insertBasket(b);
		
		if(result > 0) {
			response.sendRedirect("detail.pro?pNo="+pNo);
		} else {
			request.setAttribute("msg", "장바구니 넣기에 실패했습니다.");
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
