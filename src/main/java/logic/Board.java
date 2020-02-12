package logic;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int num;
	private int type;
	private String id;
	private String subject;
	private String content;	
	private MultipartFile file;
	private String fileurl;
	private Date regdate;
	private int readcnt;
	private int recommend;
	private int comment;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "Board [num=" + num + ", type=" + type + ", id=" + id + ", subject=" + subject + ", content=" + content
				+ ", file=" + file + ", fileurl=" + fileurl + ", regdate=" + regdate + ", readcnt=" + readcnt
				+ ", recommend=" + recommend + ", comment=" + comment + "]";
	}
}
