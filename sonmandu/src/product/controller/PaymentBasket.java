package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Payment;

/**
 * Servlet implementation class PaymentBasket
 */
@WebServlet("/pay.bas")
public class PaymentBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentBasket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int mNum = loginUser.getMemNum();											// 유저 번호
		String orderName = request.getParameter("orderName");						// 주문자 이름
		String orderPhone = request.getParameter("orderphone");						// 주문자 핸드폰 번호
		String orderEmail = request.getParameter("orderEmail");						// 주문자 이메일
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String add3 = request.getParameter("add3");
		String add4 = request.getParameter("add4");
		String add5 = request.getParameter("add5");
		String address = add1 + " " + add2 + " " + add3 + " " + add4 + " " + add5;	// 주문자 주소
		String productName = request.getParameter("productNameK");
		
		String totalPrice = request.getParameter("totalPrice");			// 
		String chargeList= request.getParameter("chargeList");				// 배송비
		String pNoList = request.getParameter("pNoList");					// 상품번호
		String proValList = request.getParameter("proValList");				// 상품수량

		String[] totalSal = totalPrice.split(",");
		String[] charge = chargeList.split(",");
		String[] pNo = pNoList.split(",");
		String[] proVal = proValList.split(",");
		
		Payment pay = new Payment(mNum, orderName, orderPhone, orderEmail, address);
		
		int result = new ProductService().insertPayBasket(pay , totalSal, pNo,proVal);
		
		int resultS = 0;
		
		if(result > 0) {
			resultS = new ProductService().successPayBasket(mNum);
		} else {
			request.setAttribute("msg", "장바구니 구매에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		System.out.println("result : " + result);
		System.out.println("resultS : " + resultS);
		
		if(resultS > 0) {
			/*request.setAttribute("productName", productName);
			request.setAttribute("name", orderName);
			request.setAttribute("phone", orderPhone);
			request.setAttribute("email", orderEmail);
			request.setAttribute("address", address);
			request.setAttribute("price", totalSal);
			
			request.getRequestDispatcher("views/pay/pay.jsp").forward(request, response);*/
			response.sendRedirect(request.getContextPath());
			System.out.println("장바구니 구매 완료 했습니다 DB확인해보세요");
		} else {
			request.setAttribute("msg", "장바구니 구매에 실패했습니다.");
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
