package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Reply;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int bId = Integer.parseInt(request.getParameter("bId"));
      int memNum = ((Member)request.getSession().getAttribute("loginUser")).getMemNum();
      Board b = null;
      
      
      // 쿠키를 이용한 조회수 증가 방지 처리
      boolean isGet = false;   // 해당 글을 읽었는지 여부를 확인할 변수
      Cookie[] cookies = request.getCookies();
      if(cookies != null) {
         // 쿠키 값에 해당 글을 읽었다는 정보가 있는지 반복문을 통해 찾는다
         for(Cookie c : cookies) {
            // bId 쿠키가 있는 경우
            if(c.getName().equals("memNum" + memNum + "bId" + bId)) {
               isGet = true;
            }
         }
         // bId 쿠키가 없는 경우
         if(!isGet) {
            Cookie c1 = new Cookie("memNum" + memNum + "bId" + bId, String.valueOf(bId));
            c1.setMaxAge(1 * 24 * 60 * 60); // 하루동안 저장
            response.addCookie(c1);
            // Service로 조회수 증가 + 게시글 셀렉 요청
            b = new BoardService().selectBoard(bId);
         }else {
            // Service로 조회수 증가 없이 게시글 셀렉 요청
            b = new BoardService().selectBoardNoCnt(bId);
         }
         
      }
      
      if(b != null) {
    	  request.setAttribute("board", b);
    	  request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
      } else {
    	  request.setAttribute("msg", "게시글 상세 조회에 실패하였습니다.");
 			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
      }
      
   // ----------------- ajax 이후 기능 작성 ---------------------------
   		/*ArrayList<Reply> rlist = new BoardService().selectReplyList(bId);		
   		
   		if(b != null) {
   			//System.out.println("게시글 : " + b);
   			request.setAttribute("board", b);
   			
   			// ajax 이후
   			request.setAttribute("rlist", rlist);
   			
   			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
   		}else {
   			request.setAttribute("msg", "게시글 상세 조회에 실패하였습니다.");
   			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
   		}*/
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}