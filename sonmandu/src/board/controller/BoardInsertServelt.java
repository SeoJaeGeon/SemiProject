package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardInsertServelt
 */
@WebServlet("/insert.bo")
public class BoardInsertServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String bWriter = String.valueOf(loginUser.getMemNum());
		
		Board b = new Board();
		b.setbTitle(bTitle);			// "제목"
		b.setbContent(bContent);		// "내용"
		b.setbWriter(bWriter);
		
		int result = new BoardService().insertBoard(b);
		System.out.println(bTitle + bContent + bWriter);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "게시판 등록 완료!!!.");
			response.sendRedirect(request.getContextPath() + "/list.bo");
			System.out.println("안녕!");
		} else {
			request.setAttribute("msg", "공지사항 등록에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			System.out.println("반가워!");
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
