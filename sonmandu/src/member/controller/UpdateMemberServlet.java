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
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("memId");

		String memName = request.getParameter("memName");
		String memPhone = request.getParameter("memPhone");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String add3 = request.getParameter("add3");
		String add4 = request.getParameter("add4");
		String email1 = request.getParameter("email1");
		String email_dns = request.getParameter("email_dns");

		String address = add1 + "/" + add2 + "/" + add3 + "/" + add4;
		String email = email1 + "@" + email_dns ;
		
		Member m = new Member(memId, memName, memPhone, address, email);
		
		Member updateMember = new MemberService().updateMember(m);
		
		if(updateMember != null) {
			request.getSession().setAttribute("msg", "회원님의 정보가 수정되었습니다.");
			request.getSession().setAttribute("loginUser", updateMember);
			response.sendRedirect(request.getContextPath());
		} else {
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
