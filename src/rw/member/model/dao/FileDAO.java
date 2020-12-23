package rw.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import rw.common.JDBCTemplate;
import rw.member.model.vo.FileData;

public class FileDAO {

	public int uploadFile(Connection conn, FileData fd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set profile_img=? where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fd.getFileName());
			pstmt.setString(2, fd.getFileUser());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteFileData(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set profile_img=null where member_id=?";
		//기본 이미지가 어떤거에요? 이렇게 해야 기본이미지 아닌가요? 근데 애초에 dB에 null이면 기본이미지가 뜨게 해놨었거든요..그 코드 어디있어요?
		//null로 다시 해보고 할께요 이제 
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		} 
		return result;		
	}

}
