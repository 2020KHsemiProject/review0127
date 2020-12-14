package rw.member.model.vo;

import java.sql.Date;

public class Member {
	private String memberNo;
	private String memberId;
	private String nickname;
	private String memberPwd;
	private String email;
	private String emailYN;
	private int birthYear;
	private char gender;
	private Date enrollDate;
	private char endYN;
	private Date endDate;
	private String profileImg;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String memberNo, String memberId, String nickname, String memberPwd, String email, String emailYN,
			int birthYear, char gender, Date enrollDate, char endYN, Date endDate, String profileImg) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.nickname = nickname;
		this.memberPwd = memberPwd;
		this.email = email;
		this.emailYN = emailYN;
		this.birthYear = birthYear;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.endYN = endYN;
		this.endDate = endDate;
		this.profileImg = profileImg;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailYN() {
		return emailYN;
	}

	public void setEmailYN(String emailYN) {
		this.emailYN = emailYN;
	}

	public int getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getendYN() {
		return endYN;
	}

	public void setendYN(char endYN) {
		this.endYN = endYN;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

}
