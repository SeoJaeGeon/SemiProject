package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memName = request.getParameter("memName");
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String memPhone = request.getParameter("memPhone");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String add3 = request.getParameter("add3");
		String add4 = request.getParameter("add4");
		String email1 = request.getParameter("email1");
		String email_dns = request.getParameter("email_dns");
		
		String email = email1 + "@" + email_dns ;
		String address = add1 + "/" + add2 + "/" + add3 + "/" + add4;
		
		// System.out.println(address);
		// System.out.println(email);
		Member mem = new Member(memName, memId, memPwd, memPhone, address, email);
		
		int result = new MemberService().insertMember(mem);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "회원 가입이 완료되었습니다.");
			
			// 메인페이지로 이동
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "회원 가입 실패");
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
