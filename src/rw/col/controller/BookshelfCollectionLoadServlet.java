package rw.col.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import rw.col.model.vo.OtherBookcase;
import rw.member.model.service.MemberService;
import rw.member.model.vo.Member;
import rw.review.model.vo.Book;

/**
 * Servlet implementation class BookshelfCollectionLoadServlet
 */
@WebServlet("/bscolSelect.rw")
public class BookshelfCollectionLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookshelfCollectionLoadServlet() {
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
		
		int bookshelfCurrentPage;
		
		if(request.getParameter("bookshelfCurrentPage")==null) {
			bookshelfCurrentPage = 1;
		}else {
			bookshelfCurrentPage = Integer.parseInt(request.getParameter("bookshelfCurrentPage"));
		}
		
		CollectionPageData<OtherBookcase> cpdBB = new CollectionService().selectBookshelfCollection(bookshelfCurrentPage, owner.getMemberNo());
		
		JSONArray array = new JSONArray();
		for(OtherBookcase ob : cpdBB.getList()) {
			JSONObject tmpObj =  new JSONObject();

			tmpObj.put("nickname", ob.getM().getNickname());
			tmpObj.put("bookshelfId", ob.getLib().getBookShelfId());
			tmpObj.put("bookshelfName", ob.getLib().getBookShelfName());
			
			JSONArray bookArray = new JSONArray();
			for(Book b : ob.getBookList()) {
				JSONObject bobj = new JSONObject();
				bobj.put("bookImage", b.getBookImage());
				bookArray.add(bobj);
			}
			
			tmpObj.put("bookList", bookArray);
			array.add(tmpObj);
		}
		
		JSONObject object = new JSONObject();
		object.put("pageNavi", cpdBB.getPageNavi());
		object.put("dataList", array);
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
