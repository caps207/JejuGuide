package logic;

import java.sql.Date;

public class Comment {
	private int num;
	private int boardnum;
	private String id;
	private String content;
	private Date regdate;
	private int grp;
	private int grplevel;
	private int grpstep;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getGrplevel() {
		return grplevel;
	}
	public void setGrplevel(int grplevel) {
		this.grplevel = grplevel;
	}
	public int getGrpstep() {
		return grpstep;
	}
	public void setGrpstep(int grpstep) {
		this.grpstep = grpstep;
	}
	@Override
	public String toString() {
		return "Comment [num=" + num + ", boardnum=" + boardnum + ", id=" + id + ", content=" + content + ", regdate="
				+ regdate + ", grp=" + grp + ", grplevel=" + grplevel + ", grpstep=" + grpstep + "]";
	}
	
}
