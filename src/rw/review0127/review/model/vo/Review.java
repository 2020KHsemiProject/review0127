package rw.review0127.review.model.vo;

import java.sql.Date;

public class Review {
	private String reviewId;	// 리뷰 고유 ID
	private Date reviewDate;	// 리뷰 작성일
	private int reviewCount;	// 리뷰 조회수
	private int reviewRate;		// 리뷰 별점
	private String reviewCont;	// 리뷰 내용
	private String bookId;		// 책 고유 ID
	private String memberNo;	// 회원 고유 번호
	private char delYN;			// 리뷰 삭제 여부
}
