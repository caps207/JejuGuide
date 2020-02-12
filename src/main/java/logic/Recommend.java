package logic;


public class Recommend {
	private int boardnum;
	private String id;
	private String url;
	private String subject;
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "Recommend [boardnum=" + boardnum + ", id=" + id + ", url=" + url + ", subject=" + subject + "]";
	}
	
	
	
}
