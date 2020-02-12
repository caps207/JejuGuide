package logic;

public class Search {
	private String userid;
	private String keyword;
	private int cnt;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getkeyword() {
		return keyword;
	}

	public void setkeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Search [userid=" + userid + ", keyword=" + keyword + "]";
	}

}
