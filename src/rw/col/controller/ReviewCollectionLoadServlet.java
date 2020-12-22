package rw.col.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import rw.col.model.service.CollectionService;
import rw.col.model.vo.CollectionPageData;
import rw.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.review.model.service.ReviewService;
import rw.review.model.vo.ReviewCard;

/**
 * Servlet implementation class ReviewCollectionLoadServlet
 */
@WebServlet("/rwcolSelect.rw")
public class ReviewCollectionLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCollectionLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("libraryOwner");
		
		Member owner = new MemberService().selectOneMemberId(memberId);
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		//로그인이 되어있고, 로그인한사람이 자기 서재에 있을때
		String inMyLibCol = "";
		if(m!=null && m.getMemberNo().equals(owner.getMemberNo())) {
			inMyLibCol = "true";
		}
		
		int reviewCurrentPage;
		
		if(request.getParameter("reviewCurrentPage")==null) {
			reviewCurrentPage = 1;
		}else {
			reviewCurrentPage = Integer.parseInt(request.getParameter("reviewCurrentPage"));
		}

		CollectionPageData<ReviewCard> cpdRC 
		= new CollectionService().selectReviewCollection(reviewCurrentPage, owner.getMemberNo());

		//리뷰 좋아요 데이터
		HashMap<String, Integer> reviewLikeList = new HashMap<String, Integer>();
		ArrayList<ReviewCard> rcList = cpdRC.getList();
		for(ReviewCard rc : rcList) {
			Integer likeCount = new ReviewService().selectOneReviewLike(rc.getReviewId());
			reviewLikeList.put(rc.getReviewId(), likeCount);//리뷰 id를 키로 해서 좋아요 값 매칭.
		}
		
		//로그인한 사람의 좋아요 여부 : 로그인한 사람 + 컬렉션 소유주
		if(m!=null) {
			HashMap<String, String> likeYNlist = new CollectionService().selectReviewLikeInRC(m.getMemberNo(), owner.getMemberNo());
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
				
		JSONArray array = new JSONArray();
		for(ReviewCard rc : cpdRC.getList()) {
			JSONObject tmpObj =  new JSONObject();
			
			tmpObj.put("reviewId", rc.getReviewId()); 
			tmpObj.put("reviewCont", rc.getReviewCont());
			tmpObj.put("reviewRate", rc.getReviewRate());
			tmpObj.put("reviewDate", String.valueOf(rc.getReviewDate()));
			tmpObj.put("reviewCount", rc.getReviewCount());
			
			tmpObj.put("bookImage", rc.getBookImage());
			tmpObj.put("bookTitle", rc.getBookTitle());
			
			tmpObj.put("memberId", rc.getMemberId());
			tmpObj.put("nickname", rc.getNickname());
			
			tmpObj.put("likeYN", Character.toString(rc.getLikeYN()));
			
			array.add(tmpObj);
		}
		JSONObject map = new JSONObject();
		
		for(ReviewCard rc : rcList) {
			map.put(rc.getReviewId(), reviewLikeList.get(rc.getReviewId()));
		}
		
		
		JSONObject object = new JSONObject();
		object.put("pageNavi", cpdRC.getPageNavi());
		object.put("dataList", array);
		object.put("likeList", map);
		object.put("inMyLibCol", inMyLibCol);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(object);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
