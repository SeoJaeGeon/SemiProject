package seller.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class SellerUpdateServlet
 */
@WebServlet("/updatePwd.sell")
public class SellerUpdatePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerUpdatePwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
		
		String memPwd = request.getParameter("memPwd");		// 현재 비밀번호
		String newPwd = request.getParameter("newPwd");		// 변경 할 비밀번호
		
		Member updateMember = new MemberService().updatePwd(memId, memPwd, newPwd);
		
		if(updateMember != null) {
			request.setAttribute("msg", "비밀번호가 변경되였습니다.");
			request.getSession().setAttribute("loginUser", updateMember);
		} else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/pwdUpdateForm.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
