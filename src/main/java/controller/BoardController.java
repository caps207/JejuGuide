package controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.Board;
import logic.Comment;
import logic.Recommend;
import logic.Scrap;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("list")
	public ModelAndView list(Integer pageNum, String searchtype, String searchcontent) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if(searchtype != null && searchtype.trim().equals("")) searchtype=null;
		if(searchcontent != null && searchcontent.trim().equals("")) searchcontent=null;
		if(searchtype == null || searchcontent == null) {
			searchtype = null;
			searchcontent = null;
		}
		int limit = 5; //페이지당 보여지는 게시물 건수
		int listcount = service.boardcount(searchtype,searchcontent); //전체 등록된 게시물 건수
		List<Board> boardlist = service.boardlist(pageNum,limit,searchtype,searchcontent);
		List<Board> recentlist = service.recentlist();//최근 글 뽑기
		int maxpage = (int)((double)listcount/limit + 0.95); //최대 페이지
		int startpage = (int)((pageNum/5.0 + 0.9) - 1) * 5 + 1; //보여지는 첫번째 페이지
		int endpage = startpage + 4; //보여지는 마지막 페이지
		if(endpage > maxpage) endpage = maxpage;
		int boardno = listcount - (pageNum - 1) * limit; //화면에 출력되는 게시물 번호. 순서
		mav.addObject("recentlist", recentlist);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardno", boardno);
		return mav;
	}
	@GetMapping(value= {"write","update"})
	public ModelAndView checkview(Board board, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Board> recentlist = service.recentlist();//최근 글 뽑기
		mav.addObject("recentlist", recentlist);
		return mav;
	}
	@PostMapping("write")
	public ModelAndView checkwrite(@Valid Board board, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			board.setId(loginUser.getId());
			service.boardWirte(board,request);
			mav.setViewName("redirect:list.shop");
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시물 등록에 실패했습니다.", "write.shop");
		}
		return mav;
	}
	@RequestMapping("*")
	public ModelAndView getBoard(Integer num, Integer pageNum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = null;
		if(num==null) {
			board = new Board();
		} else {
			board = service.getBoard(num,request);
			int type = board.getType();
			List<Board> recentlist = service.recentlist();//최근 글 뽑기
			String scrapurl = request.getRequestURL().toString();
			if(request.getQueryString() != null) //쿼리부분이 있을때에는 원래 url에다가 쿼리값 넘겨주기.
				scrapurl = scrapurl + "?" + request.getQueryString();
			System.out.println(scrapurl);
			if(pageNum == null || pageNum.toString().equals("")) {
				pageNum = 1;
			}
//			else {
//				pageNum = Integer.parseInt(request.getParameter("pageNum"));
//				System.out.println(pageNum);
//			}
			int limit = 10;
			int commentcount = service.getBoard(num, request).getComment();
			List<Comment> commentlist = service.commentlist(num, pageNum, limit);
			int maxpage = (int)((double)commentcount/limit + 0.95);
			int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
			int endpage = startpage + 9;
			if(endpage > maxpage) endpage = maxpage;
			int commentno = commentcount - (pageNum - 1) * limit; //화면에 출력되는 게시물 번호. 순서
			mav.addObject("type",type);
			mav.addObject("recentlist", recentlist);
			mav.addObject("scrapurl",scrapurl);
			mav.addObject("pageNum", pageNum);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("commentlist",commentlist);
			mav.addObject("commentcount", commentcount);
			mav.addObject("commentno", commentno);
			
		}
		mav.addObject("board", board);
		mav.addObject("comment", new Comment());
		mav.addObject("recommend", new Recommend());
		return mav;
	}
	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/") + "board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		if(!upload.isEmpty()) {
			File file = new File(path, upload.getOriginalFilename());
			try {
				upload.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String fileName = "/project/board/imgfile/"+upload.getOriginalFilename();
		model.addAttribute("fileName",fileName);
		model.addAttribute("CKEditorFuncNum",CKEditorFuncNum);
		return "ckedit";
	}

	/*
	 * 1.파라미터 값 Board 객체 저장. 유효성 검증
	 * 2.입력된 비밀번호와 db의 비밀번호를 비교 비밀번호가 맞는 경우 3.
	 * 	  틀린경우 '비밀번호가 틀립니다.', update.shop Get방식으로 호출 
	 * 3.수정정보를 db에 변경
	 * 	 -첨부파일 변경 : 첨부파일 업로드, fileurl 정보 수정
	 * 4.list.shop 페이지 요청
	 */
	@PostMapping("update")
	public ModelAndView checkupdate (@Valid Board board, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.boardUpdate(board, request);
			mav.setViewName("redirect:list.shop");
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 수정에 실패했습니다.", "update.shop?num="+board.getNum());
		}
		return mav;
	}
	/*
	 * 1. num, pass 파라미터 저장
	 * 2. db의 비밀번호와 입력된 비밀번호가 틀리면 error.login.password 코드 입력
	 * 3. db에서 해당 게시물 삭제.
	 * 	    삭제 실패 : 게시글 삭제 실패. delete.shop 페이지로 이동
	 *	    삭제 성공 : list.shop 페이지 이동
	 */
	@GetMapping("delete")
	public ModelAndView checkdelete(Board board, BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		try {
			service.boardDelete(board);
			mav.setViewName("redirect:list.shop");
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 삭제 실패.","delete.shop?num="+board.getNum());
		}
		return mav;
	}
	
	@RequestMapping("recommend")
	public ModelAndView checkrecommend(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		Recommend recommend = new Recommend();
		int num = Integer.parseInt(request.getParameter("num"));

		try {
		
		//url 찍어서 보내주기 scrap시 필요
		
				String scrapurl = request.getParameter("url");
				
				recommend.setId(loginUser.getId());
				recommend.setBoardnum(num);
				recommend.setUrl(scrapurl);
				service.addrecom(recommend,num,request);	
//				throw new BoardException("좋아요 완료!",recommend);
				mav.addObject("url",recommend.getUrl());
		}catch (Exception e) {
			throw new BoardException("이미 추천하셨습니다.","detail.shop?num="+num);
		}

		
		return mav;
	}
	
	@RequestMapping("commentwrite")
	public ModelAndView checkcommentwrite(@Valid Comment comment, Board board, int num, BindingResult bresult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		num = Integer.parseInt(request.getParameter("num"));
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			comment.setBoardnum(num);
			comment.setId(loginUser.getId());
			service.commentWirte(comment, num, request);
			mav.setViewName("redirect:detail.shop?num="+num);
		} catch (Exception e) {			
			e.printStackTrace();
			throw new BoardException("댓글 등록에 실패했습니다.", "detail.shop?num="+num);
		}
		return mav;
	}

//	@PostMapping("commentupdate")
//	public ModelAndView checkcommentupdate(@Valid Comment comment, BindingResult bresult, HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		String referer = (String)request.getHeader("REFERER");
//		try {
//			service.commentUpdate(comment, request);
//			mav.setViewName("redirect:"+referer);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new BoardException("댓글 수정에 실패했습니다.", "detail.shop?num="+comment.getBoardnum());
//		}
//		return mav;
//	}
	
	@GetMapping("commentdelete")
	public ModelAndView checkcommentdelete(Comment comment, Board board, int num, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		num = Integer.parseInt(request.getParameter("num"));
		String referer = (String)request.getHeader("REFERER");
		try {
			service.commentDelete(comment, num, request);
			mav.setViewName("redirect:"+referer);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("댓글 삭제 실패.","detail.shop?num="+comment.getBoardnum());
		}
		return mav;
	}
	//여행코스 리스트
	@RequestMapping("trip")
	public ModelAndView triplist(Integer pageNum, String searchtype, String searchcontent) {
		ModelAndView mav = new ModelAndView();
		int categorie = 1;
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if(searchtype != null && searchtype.trim().equals("")) searchtype=null;
		if(searchcontent != null && searchcontent.trim().equals("")) searchcontent=null;
		if(searchtype == null || searchcontent == null) {
			searchtype = null;
			searchcontent = null;
		}
		int limit = 5; //페이지당 보여지는 게시물 건수
		int listcount = service.typeboardcount(categorie,searchtype,searchcontent); //전체 등록된 게시물 건수
		List<Board> boardlist = service.boardlist(pageNum,limit,searchtype,searchcontent,categorie);
		List<Board> recentlist = service.recentlist();//최근 글 뽑기
		int maxpage = (int)((double)listcount/limit + 0.95); //최대 페이지
		int startpage = (int)((pageNum/5.0 + 0.9) - 1) * 5 + 1; //보여지는 첫번째 페이지
		int endpage = startpage + 4; //보여지는 마지막 페이지
		if(endpage > maxpage) endpage = maxpage;
		int boardno = listcount - (pageNum - 1) * limit; //화면에 출력되는 게시물 번호. 순서
		
		
		mav.addObject("recentlist", recentlist);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardno", boardno);
		return mav;
	}
	//맛집 리스트
		@RequestMapping("food")
		public ModelAndView foodlist(Integer pageNum, String searchtype, String searchcontent) {
			ModelAndView mav = new ModelAndView();
			int categorie = 2;
			if(pageNum == null || pageNum.toString().equals("")) {
				pageNum = 1;
			}
			if(searchtype != null && searchtype.trim().equals("")) searchtype=null;
			if(searchcontent != null && searchcontent.trim().equals("")) searchcontent=null;
			if(searchtype == null || searchcontent == null) {
				searchtype = null;
				searchcontent = null;
			}
			int limit = 5; //페이지당 보여지는 게시물 건수
			int listcount = service.typeboardcount(categorie,searchtype,searchcontent); //전체 등록된 게시물 건수
			List<Board> boardlist = service.boardlist(pageNum,limit,searchtype,searchcontent,categorie);
			List<Board> recentlist = service.recentlist();//최근 글 뽑기
			int maxpage = (int)((double)listcount/limit + 0.95); //최대 페이지
			int startpage = (int)((pageNum/5.0 + 0.9) - 1) * 5 + 1; //보여지는 첫번째 페이지
			int endpage = startpage + 4; //보여지는 마지막 페이지
			if(endpage > maxpage) endpage = maxpage;
			int boardno = listcount - (pageNum - 1) * limit; //화면에 출력되는 게시물 번호. 순서
			
			
			mav.addObject("recentlist", recentlist);
			mav.addObject("pageNum", pageNum);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("listcount", listcount);
			mav.addObject("boardlist", boardlist);
			mav.addObject("boardno", boardno);
			return mav;
		}
		//숙박 리스트
				@RequestMapping("sleep")
				public ModelAndView sleeplist(Integer pageNum, String searchtype, String searchcontent) {
					ModelAndView mav = new ModelAndView();
					int categorie = 3;
					if(pageNum == null || pageNum.toString().equals("")) {
						pageNum = 1;
					}
					if(searchtype != null && searchtype.trim().equals("")) searchtype=null;
					if(searchcontent != null && searchcontent.trim().equals("")) searchcontent=null;
					if(searchtype == null || searchcontent == null) {
						searchtype = null;
						searchcontent = null;
					}
					int limit = 5; //페이지당 보여지는 게시물 건수
					int listcount = service.typeboardcount(categorie,searchtype,searchcontent); //전체 등록된 게시물 건수
					List<Board> boardlist = service.boardlist(pageNum,limit,searchtype,searchcontent,categorie);
					List<Board> recentlist = service.recentlist();//최근 글 뽑기
					int maxpage = (int)((double)listcount/limit + 0.95); //최대 페이지
					int startpage = (int)((pageNum/5.0 + 0.9) - 1) * 5 + 1; //보여지는 첫번째 페이지
					int endpage = startpage + 4; //보여지는 마지막 페이지
					if(endpage > maxpage) endpage = maxpage;
					int boardno = listcount - (pageNum - 1) * limit; //화면에 출력되는 게시물 번호. 순서
					
					
					mav.addObject("recentlist", recentlist);
					mav.addObject("pageNum", pageNum);
					mav.addObject("maxpage", maxpage);
					mav.addObject("startpage", startpage);
					mav.addObject("endpage", endpage);
					mav.addObject("listcount", listcount);
					mav.addObject("boardlist", boardlist);
					mav.addObject("boardno", boardno);
					return mav;
				}
				//맛집 리스트
				@RequestMapping("free")
				public ModelAndView freelist(Integer pageNum, String searchtype, String searchcontent) {
					ModelAndView mav = new ModelAndView();
					int categorie = 4;
					if(pageNum == null || pageNum.toString().equals("")) {
						pageNum = 1;
					}
					if(searchtype != null && searchtype.trim().equals("")) searchtype=null;
					if(searchcontent != null && searchcontent.trim().equals("")) searchcontent=null;
					if(searchtype == null || searchcontent == null) {
						searchtype = null;
						searchcontent = null;
					}
					int limit = 5; //페이지당 보여지는 게시물 건수
					int listcount = service.typeboardcount(categorie,searchtype,searchcontent); //전체 등록된 게시물 건수
					List<Board> boardlist = service.boardlist(pageNum,limit,searchtype,searchcontent,categorie);
					List<Board> recentlist = service.recentlist();//최근 글 뽑기
					int maxpage = (int)((double)listcount/limit + 0.95); //최대 페이지
					int startpage = (int)((pageNum/5.0 + 0.9) - 1) * 5 + 1; //보여지는 첫번째 페이지
					int endpage = startpage + 4; //보여지는 마지막 페이지
					if(endpage > maxpage) endpage = maxpage;
					int boardno = listcount - (pageNum - 1) * limit; //화면에 출력되는 게시물 번호. 순서
					
					
					mav.addObject("recentlist", recentlist);
					mav.addObject("pageNum", pageNum);
					mav.addObject("maxpage", maxpage);
					mav.addObject("startpage", startpage);
					mav.addObject("endpage", endpage);
					mav.addObject("listcount", listcount);
					mav.addObject("boardlist", boardlist);
					mav.addObject("boardno", boardno);
					return mav;
				}
				@RequestMapping("scrap")
				public ModelAndView checkscrap(HttpServletRequest request, HttpSession session) {
					ModelAndView mav = new ModelAndView();
					String url = request.getParameter("url"); //submit으로 전송받은 url부분.
					Scrap scrap = new Scrap(); //scrap db에 저장할 객체 생성
					User user = (User)session.getAttribute("loginUser"); //user 에서 로그인 세션값 받아오기
					String title = request.getParameter("title");
					int type = Integer.parseInt(request.getParameter("type")); //타입 값 받을 변수 선언.
					
					try {
					//scrap 객체에 셋팅
					scrap.setId(user.getId());
					scrap.setUrl(url); 
					scrap.setTitle(title);
					scrap.setType(type);
					service.scrap(scrap);
					mav.addObject("url",scrap.getUrl());
					}catch (Exception e) {
						e.printStackTrace();
						throw new BoardException("이미 스크랩 하셨습니다.", scrap.getUrl());
					}
					return mav;
				}	
}
