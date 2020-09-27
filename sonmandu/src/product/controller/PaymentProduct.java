package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.History;
import product.model.vo.Payment;

/**
 * Servlet implementation class PaymentProduct
 */
@WebServlet("/pay.pro")
public class PaymentProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String imp_uid = request.getParameter("imp_uid");
		
		int mNum = Integer.parseInt(request.getParameter("mNum"));					// 회원 번호
		int totalSal = Integer.parseInt(request.getParameter("totalSal"));			// 총주문 금액
		String orderName = request.getParameter("orderName");						// 주문자 이름
		String orderPhone = request.getParameter("orderphone");						// 주문자 핸드폰 번호
		String orderEmail = request.getParameter("orderEmail");						// 주문자 이메일
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String add3 = request.getParameter("add3");
		String add4 = request.getParameter("add4");
		String add5 = request.getParameter("add5");
		String address = add1 + " " + add2 + " " + add3 + " " + add4 + " " + add5;	// 주문자 주소
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));					// 상품번호
		int proVal = Integer.parseInt(request.getParameter("proVal"));				// 상품수량
		
		Payment pay = new Payment(mNum, totalSal, orderName, orderPhone, orderEmail, address);
		History his = new History(pNo, proVal);
		
		int result = new ProductService().insertPay(pay, his);
		
		System.out.println("PaymentProduct.java 내부-----------");
		System.out.println("mNum : " + mNum);
		System.out.println("totalSal : " + totalSal);
		System.out.println("orderName : " + orderName);
		System.out.println("orderPhone : " + orderPhone);
		System.out.println("orderEmail : " + orderEmail);
		System.out.println("address : " + address);
		System.out.println("pNo : " + pNo);
		System.out.println("proVal : " + proVal);
		System.out.println("result : " + result);
		
		if(result > 0) {
			/*
			response.sendRedirect(request.getContextPath());
			*/
			response.sendRedirect("detail.pro?pNo="+pNo);
			System.out.println("구매 완료 했습니다 DB확인해보세요");
		} else {
			request.setAttribute("msg", "장바구니 구매에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		/*
		System.out.println("카카오페이테스트(imp_uid) : " + imp_uid);
		System.out.println("카카오페이테스트(mNum) : " + mNum);
		System.out.println("카카오페이테스트(totalSal) : " + totalSal);
		System.out.println("카카오페이테스트(orderName) : " + orderName);
		System.out.println("카카오페이테스트(orderPhone) : " + orderPhone);
		System.out.println("카카오페이테스트(orderEmail) : " + orderEmail);
		System.out.println("카카오페이테스트(address) : " + address);
		
		System.out.println("카카오페이테스트(pNo) : " + pNo);
		System.out.println("카카오페이테스트(proVal) : " + proVal);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
