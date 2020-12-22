package rw.member.model.vo;

public class FileData {
	private String changedFileName;
	private String fileUser;
	
	public FileData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileData(String changedFileName, String fileUser) {
		super();
		this.changedFileName = changedFileName;
		this.fileUser = fileUser;
	}
	public String getChangedFileName() {
		return changedFileName;
	}
	public void setChangedFileName(String changedFileName) {
		this.changedFileName = changedFileName;
	}
	public String getFileUser() {
		return fileUser;
	}
	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}
}
