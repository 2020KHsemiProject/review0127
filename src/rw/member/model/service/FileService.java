package rw.member.model.service;

import java.sql.Connection;

import rw.common.JDBCTemplate;
import rw.member.model.dao.FileDAO;
import rw.member.model.vo.FileData;

public class FileService {
	
	FileDAO fDAO = new FileDAO(); 
	public int uploadFile(FileData fd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = fDAO.uploadFile(conn,fd);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);
		return result;
	}
}
