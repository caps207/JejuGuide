package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.Recommend;
import logic.Scrap;
import logic.ShopService;
import logic.User;
import util.CipherUtil;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;
	
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		return null;
	}
	@PostMapping("userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			//bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {		
		   String key = 
		   CipherUtil.makehash(user.getId()).substring(0,16);
		   user.setPassword(CipherUtil.makehash(user.getPassword()));
		   user.setEmail(CipherUtil.encrypt(user.getEmail(),key));
		   service.userInsert(user);
		   mav.setViewName("redirect:login.shop");
		} catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			bresult.reject("error.duplicate.user");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			User dbUser = service.getUser(user.getId());
			String passwd=CipherUtil.makehash(user.getPassword());
			if(!dbUser.getPassword().equals(passwd)) {
				bresult.reject("error.login.password");
				return mav;
			} else {
				try {
					String id = CipherUtil.makehash(dbUser.getId());
				    String email =CipherUtil.decrypt(dbUser.getEmail(), id.substring(0,16));
				    dbUser.setEmail(email);
				} catch (Exception e) {
					e.printStackTrace();
				}
				session.setAttribute("loginUser", dbUser);
				mav.setViewName("redirect:/main/mainpage.shop");
			}
		} catch (LoginException e) {
			e.printStackTrace();
			bresult.reject("error.login.id");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/mainpage.shop";
	}
//	@RequestMapping("main")
//	public String checkmain(HttpSession session) {
//		return "user/main";
//	}
	@RequestMapping(value= {"mypage", "scrap"})
	public ModelAndView checkmypage(String id, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(id); //admin인 경우 파라미터에 해당하는 id 조회
		List<Scrap> tripscrap = service.tripselect(id); //해당 유저의 scrap리스트를 뽑아옴
		List<Scrap> foodscrap = service.foodselect(id); //해당 유저의 scrap리스트를 뽑아옴
		List<Scrap> sleepscrap = service.sleepselect(id); //해당 유저의 scrap리스트를 뽑아옴
		List<Scrap> freescrap = service.freeselect(id); //해당 유저의 scrap리스트를 뽑아옴
		List<Scrap> infoscrap = service.infoselect(id); //해당 유저의 scrap리스트를 뽑아옴
		//내가 추천한 글 뽑아오기 
		List<Recommend> brecom = service.brecom(id);
		String userid;
		try {
			userid = CipherUtil.makehash(user.getId());
			String email = CipherUtil.decrypt(user.getEmail(),userid.substring(0,16));
			user.setEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("brecom",brecom);
		mav.addObject("triplist",tripscrap); //유저 개개인의 스크랩 리스트를 뷰단으로 전달.
		mav.addObject("foodlist",foodscrap); //유저 개개인의 스크랩 리스트를 뷰단으로 전달.
		mav.addObject("sleeplist",sleepscrap); //유저 개개인의 스크랩 리스트를 뷰단으로 전달.
		mav.addObject("freelist",freescrap); //유저 개개인의 스크랩 리스트를 뷰단으로 전달.
		mav.addObject("infolist",infoscrap); //유저 개개인의 스크랩 리스트를 뷰단으로 전달.
		mav.addObject("user",user);
		return mav;
	}
	@GetMapping(value= {"update","delete"})
	public ModelAndView checkview(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(id);
		try {
			String key = CipherUtil.makehash(user.getId()).substring(0,16);
			String email = CipherUtil.decrypt(user.getEmail(),key);
			user.setEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("user",user);
		return mav;
	}
	@PostMapping("update")
	public ModelAndView checkupdate(@Valid User user, BindingResult bresult, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			return mav;
		}
//		//비밀번호 검증 : 입력된 비밀번호와 db에 저장된 비밀번호를 비교
//		//일치 : update
//		//불일치 : 메세지를 유효성출력으로 화면에 출력
		User loginUser = (User)session.getAttribute("loginUser");
//		user.setPassword(CipherUtil.makehash(user.getPassword()));
//		if(!user.getPassword().equals(loginUser.getPassword())) {
//			bresult.reject("error.login.password");
//			return mav;
//		} 
		try {
			String key = CipherUtil.makehash(user.getId()).substring(0,16);
			user.setEmail(CipherUtil.encrypt(user.getEmail(),key));
			service.userUpdate(user);
			mav.setViewName("redirect:mypage.shop?id="+user.getId());
			if(!loginUser.getId().equals("admin")) {
				session.setAttribute("loginUser", user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			bresult.reject("error.input.user");
		}
		return mav;
	}
	@PostMapping("delete")
	public ModelAndView checkdelete(String id, String password, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		password = CipherUtil.makehash(password);
		if(!loginUser.getPassword().equals(password)) {
			throw new LoginException("회원탈퇴시 비밀번호가 틀립니다.","delete.shop?id="+id);
		}
		try {
			service.userDelete(id);
			if(loginUser.getId().equals("admin")) {
				mav.setViewName("redirect:/admin/list.shop");
			} else {
				session.invalidate();
				mav.addObject("msg", id+"님 탈퇴 되었습니다. BYE");
				mav.addObject("url", "login.shop");
				mav.setViewName("alert");
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("회원 탈퇴시 오류가 발생했습니다. 전산부 연락 요망","delete.shop?id="+id);
		}
		return mav;
	}
	@PostMapping(value="password",produces="text/html;charset=UTF-8") // plain 문자열로 인식
	@ResponseBody //return 데이터 자체를 view의 내용으로 전달
	public String checkpassword(@RequestParam HashMap<String,String> param, HttpSession session) {
		User login = (User)session.getAttribute("loginUser");
		String hashpass=null;
		try {
			hashpass = CipherUtil.makehash(param.get("pass"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!login.getPassword().equals(hashpass)) {
			throw new LoginException("비밀번호 오류","password.shop");
		}
		String chgpass=null;
		try {
			chgpass = CipherUtil.makehash(param.get("chgpass"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.userPasswordUpdate(login.getId(),chgpass);
		login.setPassword(chgpass);
		return "<script>"
				+"alert('비밀번호가 변경 되었습니다.')\n"
				+"self.close()\n"
				+ "</script>";
	}
	@RequestMapping("resultid")
	public ModelAndView resultid(HttpServletRequest request) {//아이디 찾기 페이지에서 입력받은 파라미터 값으로 쿼리문돌리는 부분
		ModelAndView mav = new ModelAndView();
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		String id = null; // 찾아온 아이디 값

		User user = new User();
		user.setName(name);
		user.setTel(tel);
		try {
		id=service.searchid(user);
		if(id.equals(null)) {//아이디 값이 없는 경우
			throw new LoginException("없는 정보입니다.", "searchid.shop");
		}
		System.out.println("아이디"+id);
		mav.addObject("id",id);
		mav.setViewName("redirect:id.shop");
		}catch (Exception e) {
			throw new LoginException("없는 정보입니다.", "searchid.shop");
		}
		return mav;
	}
	@RequestMapping("id")
	public ModelAndView id (HttpServletRequest request) { //id찾은 결과값 뿌려주는 화면
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		mav.addObject("id",id);
		return mav;
	}
	@RequestMapping("resultpw")
	public ModelAndView resultipw(HttpServletRequest request) {//비밀번호 찾기 페이지에서 입력받은 파라미터 값으로 쿼리문돌리는 부분
		ModelAndView mav = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = null; // 찾아온 비밀번호 값.

		User user = new User();
		user.setName(name);
		user.setId(id);
		try {
		pw = service.searchpw(user);

		if(pw.equals(null)) {
			throw new LoginException("없는 정보입니다.", "searchpw.shop");
		}
		}catch (Exception e) {
			throw new LoginException("없는 정보입니다.", "searchpw.shop");
		}
		mav.addObject("userid",id);//아이디값보내기
		mav.setViewName("redirect:pw.shop");
		return mav;
	}
	@RequestMapping("pw")
	public ModelAndView pw (HttpServletRequest request) { //id찾은 결과값 뿌려주는 화면
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("userid");
		mav.addObject("userid",id);
		return mav;
	}
	@RequestMapping("changepw")
	public ModelAndView changepw(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("userid");
		String pw = request.getParameter("pw");
		
		String pw1 = request.getParameter("pw1"); //새로운비밀번호 입력
		String pw2 = request.getParameter("pw2"); // 비밀번호 확인.
		if(!pw1.equals(pw2)) {
			throw new LoginException("비밀번호가 일치하지 않습니다.", "pw.shop");
		}
		try {
		String password = CipherUtil.makehash(pw1); //해쉬값으로 변환
		service.changepw(password,id);
		
		}catch (Exception e) {
			throw new LoginException("비밀번호 변경에 오류가 발생하였습니다.", "pw.shop");
		}
		return mav;
	}
}
