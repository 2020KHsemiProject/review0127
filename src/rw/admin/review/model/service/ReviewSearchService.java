package rw.admin.review.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;


import rw.admin.review.model.dao.ReviewSearchDAO;
import rw.common.JDBCTemplate;
import rw.review.model.vo.ReviewAdmin;
import rw.review.model.vo.ReviewList;

public class ReviewSearchService {

public ReviewList searchReview(int currentPage, Date dateFrom, Date dateTill) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5;
		
		ArrayList<ReviewAdmin> list = new ReviewSearchDAO().searchReview(conn,currentPage,recordCountPerPage,dateFrom,dateTill);

		int naviCountPerPage = 3;
		
		String pageNavi = new ReviewSearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill);
		
		
		ReviewList rl = new ReviewList();
		rl.setList(list);
		rl.setPageNavi(pageNavi);
		
		
		return rl;
	}

	public ReviewList searchReview(int currentPage, String category, String keyword, Date dateFrom, Date dateTill) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5;
		
		ArrayList<ReviewAdmin> list = new ReviewSearchDAO().searchReview(conn,currentPage,recordCountPerPage,dateFrom,dateTill,keyword,category);

		int naviCountPerPage = 3;
		
		String pageNavi = new ReviewSearchDAO().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage,dateFrom,dateTill,keyword,category);
		
		
		ReviewList rl = new ReviewList();
		rl.setList(list);
		rl.setPageNavi(pageNavi);
		
		
		return rl;
	}
	
	
}
