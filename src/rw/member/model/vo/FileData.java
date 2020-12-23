package rw.member.model.vo;

public class FileData {
	private String fileName;
	private String fileUser;
	
	public FileData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileData(String fileName, String fileUser) {
		super();
		this.fileName = fileName;
		this.fileUser = fileUser;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileUser() {
		return fileUser;
	}
	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}
}
