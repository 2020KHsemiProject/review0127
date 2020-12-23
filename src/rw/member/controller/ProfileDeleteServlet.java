package rw.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.member.model.service.FileService;
import rw.member.model.vo.Member;

/**
 * Servlet implementation class ProfileDeleteServlet
 */
@WebServlet("/profileDel.rw")
public class ProfileDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMemberId();
		
		int result = new FileService().deleteFileData(memberId);
		
		if(result > 0) {
			File file = new File("/image/profile/"+m.getProfileImg());//지우는게 여기 서블릿이죠? 넵!
			//이렇게 하면 해당 파일을 이야기 하게 됩니다.
			//파일을 지울때에는 /경로/파일명
			//이렇게 필요해요 이제 지워보죠
			file.delete();
		}
		response.sendRedirect("/pageLoad.rw");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
