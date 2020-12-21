package rw.col.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.col.model.service.CollectionService;
import rw.col.model.vo.CollectionPageData;
import rw.col.model.vo.OtherBookcase;
import rw.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.review.model.service.ReviewService;
import rw.review.model.vo.ReviewCard;

/**
 * Servlet implementation class CollectionLoadServlet
 */
@WebServlet("/myCollection.rw")
public class CollectionLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectionLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//처음 받는 입력값
		String memberId = request.getParameter("libraryOwner");
		
		//연결하려면 해당 서재 멤버 정보 필요
		Member owner = new MemberService().selectOneMemberId(memberId);
		
		
		CollectionService colService = new CollectionService();
		//남의 서재가 내 컬렉션에 있는지 확인
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		boolean result = false;
		if(m!=null) {
			result = colService.existsMyLibCol(m.getMemberNo(),memberId);
		}
		
		//가져와야될 정보 6개 리뷰,서재,책장, 각각의 페이지네비
		//collectionData 생성 : 리스트+페이지네비 * 3
		
		//1) 리뷰 데이터
		int reviewCurrentPage;
		
		if(request.getParameter("reviewCurrentPage")==null) {
			reviewCurrentPage = 1;
		}else {
			reviewCurrentPage = Integer.parseInt(request.getParameter("reviewCurrentPage"));
		}
		
		//로그인한 사람의 좋아요 여부를 보려면 로그인한 사람의 no가 들어가야 함.
		CollectionPageData<ReviewCard> cpdRC 
		= colService.selectReviewCollection(reviewCurrentPage, owner.getMemberNo());
		//리뷰 좋아요 갯수 데이터
		HashMap<String, Integer> reviewLikeList = new HashMap<String, Integer>();
		ArrayList<ReviewCard> rcList = cpdRC.getList();
		for(ReviewCard rc : rcList) {
			Integer likeCount = new ReviewService().selectOneReviewLike(rc.getReviewId());
			reviewLikeList.put(rc.getReviewId(), likeCount);//리뷰 id를 키로 해서 좋아요 값 매칭.
		}
		//로그인한 사람의 좋아요 여부 : 로그인한 사람 + 컬렉션 소유주
		if(m!=null) {
			HashMap<String, String> likeYNlist = colService.selelctReviewLikeInRC(m.getMemberNo(), owner.getMemberNo());
			for(ReviewCard rc : rcList) {
				String rwId = rc.getReviewId();
				String likeKey = likeYNlist.get(rwId);
				if(likeKey!=null) {
					rc.setLikeYN(likeKey.charAt(0));
					//리뷰 id로 받아온 좋아요 값을 리뷰카드에 넣어주기
					//단, 내가 좋아요 한게 전체 리뷰보다 적을 수 있기 때문에 null값에 대한 처리를 해줘야함.
					//모든 리뷰에 좋아요가 있는게 아님 ㅜㅜ
				}
			}
			cpdRC.setList(rcList); // 새로 업뎃한 정보를 반영.
		}
		
		//2) 서재 데이터
		int libraryCurrentPage;
		
		if(request.getParameter("libraryCurrentPage")==null) {
			libraryCurrentPage = 1;
		}else {
			libraryCurrentPage = Integer.parseInt(request.getParameter("libraryCurrentPage"));
		}
		
		CollectionPageData<Member> cpdML = colService.selectLibraryCollection(libraryCurrentPage,owner.getMemberNo());
		
		//3) 책장 데이터 
		int bookshelfCurrentPage;
		
		if(request.getParameter("bookshelfCurrentPage")==null) {
			bookshelfCurrentPage = 1;
		}else {
			bookshelfCurrentPage = Integer.parseInt(request.getParameter("bookshelfCurrentPage"));
		}
		
		CollectionPageData<OtherBookcase> cpdBB = colService.selectBookshelfCollection(bookshelfCurrentPage, owner.getMemberNo());
		
		
		
		//데이터 전송
		RequestDispatcher view = request.getRequestDispatcher("/views/library/collection.jsp");
		request.setAttribute("owner", owner);
		request.setAttribute("review", cpdRC);
		request.setAttribute("reviewLikeList", reviewLikeList);
		request.setAttribute("library", cpdML);
		request.setAttribute("bookshelf", cpdBB);
		request.setAttribute("inMyLibCol", result);
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
