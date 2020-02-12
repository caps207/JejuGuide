package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.RecommendDao;
import dao.ScrapDao;
import dao.SearchDao;
import dao.UserDao;

@Service //@Component + service 기능
public class ShopService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private SearchDao searchDao;
	@Autowired
	private RecommendDao recommendDao;
	@Autowired
	private ScrapDao scrapDao;

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		//picture:업로드된 파일의 내용
		String orgFile = picture.getOriginalFilename();
		String uploadPath = request.getServletContext().getRealPath("/") + path;
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs();
		try {
			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void userInsert(User user) {
		userDao.insert(user);	
	}

	public User getUser(String id) {
		return userDao.selectOne(id);
	}

	public void userUpdate(User user) {
		userDao.update(user);	
	}

	public void userDelete(String id) {
		userDao.delete(id);
	}

	public int boardcount(String type, String content) {
		return boardDao.count(type,content);
	}
	
	public int typeboardcount(int categorie, String type, String content) {
		return boardDao.typecount(categorie, type, content);
	}

	public List<Board> boardlist(Integer pageNum, int limit, String type, String content) {
		return boardDao.list(pageNum,limit,type,content);
	}

	public void boardWirte(Board board, HttpServletRequest request) {
		//첨부파일이 존재하는 경우
		if(board.getFile()!=null&&!board.getFile().isEmpty()) {
			uploadFileCreate(board.getFile(),request,"board/file/");
			//업로드 파일 이름 설정
			board.setFileurl(board.getFile().getOriginalFilename());
		}
		//현재 등록된 게시물번호 최대값
		int max = boardDao.maxnum();
		board.setNum(++max);
		boardDao.insert(board);
	}

	public Board getBoard(Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("detail.shop")) {
			boardDao.readcntadd(num);
		}
		return boardDao.selectOne(num);
		
	}

	public void boardUpdate(Board board, HttpServletRequest request) {
		if(board.getFile()!=null&&!board.getFile().isEmpty()) {
			uploadFileCreate(board.getFile(),request,"board/file/");
			board.setFileurl(board.getFile().getOriginalFilename());
		}
		boardDao.update(board);
		
	}

	public void boardDelete(Board board) {
		boardDao.delete(board.getNum());
	}

	public List<User> userList() {
		return userDao.list();
	}

	public List<User> userList(String[] idchks) {
		return userDao.list(idchks);
	}

	public void userPasswordUpdate(String id, String chgpass) {
		userDao.passupdate(id,chgpass);
	}

	public void searchInsert(Search search) {// 해당아이디로 검색기록을 저장함.
		searchDao.insert(search);
	}

	public List<Search> getList(String userid) { // 해당 아이디로 검색한 기록들을 리스트로 뽑아서 뿌려줌
		return searchDao.list(userid);
	}

	public List<Search> getRankList() {
		return searchDao.ranklist();
	}
	
	public List<Comment> commentlist(Integer num, Integer pageNum, int limit) {
		return boardDao.commentlist(num, pageNum, limit);
	}
	
	public void commentWirte(Comment comment, Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("commentwrite.shop")) {
			boardDao.commentadd(num);
		}
		int max = boardDao.commentmaxnum();
		comment.setNum(++max);
		boardDao.commentinsert(comment);
	}

//	public void commentUpdate(Comment comment, HttpServletRequest request) {
//		boardDao.commentupdate(comment);
//	}

	public void commentDelete(Comment comment, Integer num, HttpServletRequest request) {
//		if(request.getRequestURI().contains("commentdelete.shop")) {
//			boardDao.commentsub(num);
//		}
		boardDao.commentdelete(comment.getNum());
		
	}

//	public Comment getComment(Integer num, HttpServletRequest request) {
//		return boardDao.commentselectOne(num);
//	}
	
	public void addrecom(Recommend recommend, Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("recommend.shop")) {
			boardDao.recommendadd(num);
		}
		recommendDao.insert(recommend);
		
	}
	public String searchid(User user) {
		// 아이디 찾기
		return userDao.id(user);
	}

	public String searchpw(User user) {
		
		return userDao.pw(user);
		
	}

	public void changepw(String password, String id) {
		userDao.passupdate(id,password);
		
	}

	public List<Board> boardlist(Integer pageNum, int limit, String type, String content, int categorie) {
		return boardDao.list(pageNum,limit,type,content,categorie);
	}

	public List<Board> recentlist() {
		return boardDao.recentlist();
	}

	public void scrap(Scrap scrap) {
		scrapDao.scrap(scrap);
		
	}

	public List<Scrap> tripselect(String id) {
		return scrapDao.tripselect(id); //유저 개개인의 scrap 리스트를 뽑아옴
	}

	public List<Scrap> foodselect(String id) {
		return scrapDao.foodselect(id); //유저 개개인의 scrap 리스트를 뽑아옴
	}
	
	public List<Scrap> sleepselect(String id) {
		return scrapDao.sleepselect(id); //유저 개개인의 scrap 리스트를 뽑아옴
	}
	
	public List<Scrap> freeselect(String id) {
		return scrapDao.freeselect(id); //유저 개개인의 scrap 리스트를 뽑아옴
	}
	
	public List<Scrap> infoselect(String id) {
		return scrapDao.infoselect(id); //유저 개개인의 scrap 리스트를 뽑아옴
	}

	public List<Recommend> brecom(String id) {
		return scrapDao.brecom(id);
	}

	
}
