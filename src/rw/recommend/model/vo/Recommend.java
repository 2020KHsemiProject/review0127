package rw.recommend.model.vo;

import java.sql.Date;

public class Recommend {
	private int recomNo;
	private String recomCont;
	private Date recomDate;
	private char editorName;
	private String thumbnail;
	private char delYN;

	public Recommend() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Recommend(int recomNo, String recomCont, Date recomDate, char editorName, String thumbnail, char delYN) {
		super();
		this.recomNo = recomNo;
		this.recomCont = recomCont;
		this.recomDate = recomDate;
		this.editorName = editorName;
		this.thumbnail = thumbnail;
		this.delYN = delYN;
	}

	public int getRecomNo() {
		return recomNo;
	}

	public void setRecomNo(int recomNo) {
		this.recomNo = recomNo;
	}

	public String getRecomCont() {
		return recomCont;
	}

	public void setRecomCont(String recomCont) {
		this.recomCont = recomCont;
	}

	public Date getRecomDate() {
		return recomDate;
	}

	public void setRecomDate(Date recomDate) {
		this.recomDate = recomDate;
	}

	public char getEditorName() {
		return editorName;
	}

	public void setEditorName(char editorName) {
		this.editorName = editorName;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public char getDelYN() {
		return delYN;
	}

	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}

}