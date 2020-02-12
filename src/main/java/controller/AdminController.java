package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ShopService;
import logic.User;
import util.CipherUtil;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private ShopService service;
	@RequestMapping("list")
	public ModelAndView list(HttpSession session) {
		List<User> list = service.userList();
		ModelAndView mav = new ModelAndView();
		for(User user : list) {
			try {
			String userid = CipherUtil.makehash(user.getId());
			String email = CipherUtil.decrypt(user.getEmail(),userid.substring(0,16));
			user.setEmail(email);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mav.addObject("list",list);
		return mav;
	}
}
