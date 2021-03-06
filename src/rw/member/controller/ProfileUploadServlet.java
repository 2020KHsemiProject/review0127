package rw.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rw.member.model.service.FileService;
import rw.member.model.vo.FileData;
import rw.member.model.vo.Member;

/**
 * Servlet implementation class ProfileUploadServlet
 */
@WebServlet("/profileUpload.rw")
public class ProfileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = "/image/profile"; // 파일 업로드 부분 - 대표 이미지
		ServletContext context = request.getServletContext(); // 현재 실행 중인 프로젝트 접근 정보
		String realUploadPath = context.getRealPath(uploadPath); // 가상 경로 넣어주면 그것이 실제 경로로 변경
		
		int uploadFileSizeLimit = 10*1024*1024; // 10MB
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request,realUploadPath,uploadFileSizeLimit,
				encType,new DefaultFileRenamePolicy());
		
		String originalFileName = multi.getFilesystemName("profileImg");
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		String fileUser = m.getMemberId();
		
		File file = new File(realUploadPath+"\\"+originalFileName);
		
        FileData fd = new FileData();
        fd.setFileName(originalFileName);
        fd.setFileUser(fileUser);
        
        int result = new FileService().uploadFile(fd);
        
        RequestDispatcher view = request.getRequestDispatcher("/views/member/profileUploadResult.jsp");
        if(result > 0) {
        	request.setAttribute("result", true);
        } else {
        	file.delete(); // 비즈니스 로직 실패 시 파일도 삭제
        	request.setAttribute("result", false);
        }
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
