package product.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.History;
import product.model.vo.Order;

/**
 * Servlet implementation class ProductOrederListServlet
 */
@WebServlet("/OrderList.me")
public class ProductOrederListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOrederListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("프로덕트 서블릿에 들어왔습니까?");
		request.setCharacterEncoding("utf-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int memNum = loginUser.getMemNum();
		
		ArrayList<Order> oList = new ProductService().selectOrderList(memNum);
		System.out.println("memNum : " + memNum);
		System.out.println(oList);
		if(oList != null) {
			request.setAttribute("oList", oList);
			request.getRequestDispatcher("views/member/orderList.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "주문내역 조회 실패");
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
