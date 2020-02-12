package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;
import javax.validation.Valid;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jdi.Location;

import exception.BoardException;
import logic.Scrap;
import logic.Search;
import logic.ShopService;
import logic.User;

@Controller // 기능이 controller기때문에 항상 필요함.
@RequestMapping("main")
public class MainController {
	
	@Autowired
	private ShopService service;
	
	@RequestMapping("mainpage")
	public ModelAndView mainpage(HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		User loginuser = (User)session.getAttribute("loginUser");
		List<Search> searchrank = service.getRankList(); //전체 검색기록들을 list에 저장
		System.out.println(searchrank); //시험 출력
		
		if(loginuser != null) { // 로그인 한 세션값이 있을때 id값 뽑아옴
		
		System.out.println(loginuser.getId()); // 현재 로그인한 세션값이 있는경우 출력.
		List<Search> searchlist = service.getList(loginuser.getId()); //로그인한 유저의 최근 검색기록을 리스트로 저장.

		mav.addObject("searchlist",searchlist);
		}
		mav.addObject("searchrank",searchrank);
		mav.setViewName("main/mainpage");
		return mav;
	
	}
	@RequestMapping("mainrank")
	public void mainpagerank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		
		parameter = parameter + "&" + "contentTypeId=&areaCode=39&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=4&pageNo=1&_type=json";
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//	        out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
//	@RequestMapping("festival")
//	public ModelAndView main() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("main/festival");
//		return mav;
//	}
	@RequestMapping("festival")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException 
	{
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		Integer pageNo = 1;
		if(request.getParameter("pageNo") != null) 
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		PrintWriter out = response.getWriter();

		parameter = parameter + "&" + "contentTypeId=15";
		parameter = parameter + "&" + "areaCode=39";
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=";
		parameter = parameter + "&" + "cat2=";
		parameter = parameter + "&" + "cat3=";
		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=" + pageNo;
		parameter = parameter + "&" + "_type=json";
		parameter = parameter + "&" + "overviewYN=Y";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//         out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);
		
		JSONParser parser = new JSONParser();//json파서 객체 생성
		JSONObject obj = (JSONObject)parser.parse(data);//Parser로 문자열 데이터를 Json으로 변환
		JSONObject parse_response = (JSONObject)obj.get("response");
		JSONObject parse_body = (JSONObject)parse_response.get("body");

		int totalCount = ((Long)parse_body.get("totalCount")).intValue();
		int limit = 12;
		int maxpage = (int)((double)totalCount/limit + 0.95);
		//보여지는 첫번째 페이지
		int startpage = (int)((pageNo/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mav.addObject("pageNo", pageNo);
		mav.setViewName("main/festival");
		mav.addObject("totalCount", totalCount);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		return mav;
	}
	@RequestMapping("festivaldetail")
	public ModelAndView festivaldetail(HttpServletRequest request, HttpServletResponse response) {
		String contentid = request.getParameter("contentid");
		
		System.out.println("1:"+contentid);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/festivaldetail");
		
		//url 찍어서 보내주기 scrap시 필요
		
		String scrapurl = request.getRequestURL().toString();
		if(request.getQueryString() != null) //쿼리부분이 있을때에는 원래 url에다가 쿼리값 넘겨주기.
			scrapurl = scrapurl + "?" + request.getQueryString();
		System.out.println(scrapurl);

			//scrap할 url 값 넘겨주기
		mav.addObject("scrapurl",scrapurl);
		
		//여기까지
		return mav;
	}
	@RequestMapping("fesdetail")
	public void fesdetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contentid = request.getParameter("contentid");
		System.out.println("2:"+contentid);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		
		parameter = parameter + "&" + "contentTypeId=15";
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
		
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//	        out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	@RequestMapping("sleepdetail")
	public ModelAndView sleepdetail(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		String contentid = request.getParameter("contentid");
	//url 찍어서 보내주기 scrap시 필요
		
		String scrapurl = request.getRequestURL().toString();
		if(request.getQueryString() != null) //쿼리부분이 있을때에는 원래 url에다가 쿼리값 넘겨주기.
			scrapurl = scrapurl + "?" + request.getQueryString();
		System.out.println(scrapurl);

			//scrap할 url 값 넘겨주기
		mav.addObject("scrapurl",scrapurl);
		
		
		mav.setViewName("main/sleepdetail");
		return mav;
	}
	
	@RequestMapping("sledetail")
	public void sledetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contentid = request.getParameter("contentid");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		
		parameter = parameter + "&" + "contentTypeId=32";
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
		
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		System.out.println(url);
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//	        out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);
		
	}
//	@RequestMapping("PublicData")
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String lat = request.getParameter("lat");
//		String lon = request.getParameter("lon");
//		System.out.println(lat);
//		System.out.println(lon);
//				
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
//
//		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
//		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
//		String parameter = "";
//
//		PrintWriter out = response.getWriter();
//
//		parameter = parameter + "&" + "contentTypeId=15";
//		parameter = parameter + "&" + "areaCode=39";
//		parameter = parameter + "&" + "sigunguCode=";
//		parameter = parameter + "&" + "cat1=";
//		parameter = parameter + "&" + "cat2=";
//		parameter = parameter + "&" + "cat3=";
//		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
//		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
//		parameter = parameter + "&" + "arrange=A";
//		parameter = parameter + "&" + "numOfRows=12";
//		parameter = parameter + "&" + "pageNo=2";
//		parameter = parameter + "&" + "_type=json";
//		parameter = parameter + "&" + "overviewYN=Y";
//
//		addr = addr + serviceKey + parameter;
//		URL url = new URL(addr);
//
//		InputStream in = url.openStream();
//		CachedOutputStream bos = new CachedOutputStream();
//		IOUtils.copy(in, bos);
//		in.close();
//		bos.close();
//
////	        out.println(addr);
//
//		String data = bos.getOut().toString();
//		out.println(data);
//
//		JSONObject json = new JSONObject();
//		json.put("data", data);
//
//	}
	@RequestMapping("Festival")
	public void Festival(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNo = request.getParameter("pageNo");
		System.out.println("축제정보"+request.getParameter("pageNo"));
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";

		PrintWriter out = response.getWriter();

		parameter = parameter + "&" + "contentTypeId=15";
		parameter = parameter + "&" + "areaCode=39";
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=";
		parameter = parameter + "&" + "cat2=";
		parameter = parameter + "&" + "cat3=";
		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=" + pageNo;
		parameter = parameter + "&" + "_type=json";
		parameter = parameter + "&" + "overviewYN=Y";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//         out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);

	}
//	@RequestMapping("place")
//	public ModelAndView place() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("main/place");
//		return mav;
//	}
	@RequestMapping("place")
	public ModelAndView place(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		Integer pageNo = 1;
		if(request.getParameter("pageNo") != null) 
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}

		PrintWriter out = response.getWriter();

		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "areaCode=39";
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=";
		parameter = parameter + "&" + "cat2=";
		parameter = parameter + "&" + "cat3=";
		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=B";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=" + pageNo;
		parameter = parameter + "&" + "_type=json";
//numOfRows=232
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//         out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);
		JSONParser parser = new JSONParser();//json파서 객체 생성
		JSONObject obj = (JSONObject)parser.parse(data);//Parser로 문자열 데이터를 Json으로 변환
		JSONObject parse_response = (JSONObject)obj.get("response");
		JSONObject parse_body = (JSONObject)parse_response.get("body");

		int totalCount = ((Long)parse_body.get("totalCount")).intValue();
		int limit = 12;
		int maxpage = (int)((double)totalCount/limit + 0.95);
		//보여지는 첫번째 페이지
		int startpage = (int)((pageNo/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mav.addObject("pageNo", pageNo);
		mav.setViewName("main/festival");
		mav.addObject("totalCount", totalCount);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.setViewName("main/place");
		return mav;
	}
//	@RequestMapping("placeData")
//	public void placePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String lat = request.getParameter("lat");
//		String lon = request.getParameter("lon");
//		System.out.println(lat);
//		System.out.println(lon);
//				
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
//
//		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
//		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
//		String parameter = "";
//
//		PrintWriter out = response.getWriter();
//
//		parameter = parameter + "&" + "contentTypeId=12";
//		parameter = parameter + "&" + "areaCode=39";
//		parameter = parameter + "&" + "sigunguCode=";
//		parameter = parameter + "&" + "cat1=";
//		parameter = parameter + "&" + "cat2=";
//		parameter = parameter + "&" + "cat3=";
//		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
//		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
//		parameter = parameter + "&" + "arrange=A";
//		parameter = parameter + "&" + "numOfRows=12";
//		parameter = parameter + "&" + "pageNo=23";
//		parameter = parameter + "&" + "_type=json";
////numOfRows=232
//		addr = addr + serviceKey + parameter;
//		URL url = new URL(addr);
//
//		InputStream in = url.openStream();
//		CachedOutputStream bos = new CachedOutputStream();
//		IOUtils.copy(in, bos);
//		in.close();
//		bos.close();
//
////	        out.println(addr);
//
//		String data = bos.getOut().toString();
//		out.println(data);
//
//		JSONObject json = new JSONObject();
//		json.put("data", data);
//
//	}
	@RequestMapping("placeData")
	public void placeData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String pageNo = request.getParameter("pageNo");
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";

		PrintWriter out = response.getWriter();

		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "areaCode=39";
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=";
		parameter = parameter + "&" + "cat2=";
		parameter = parameter + "&" + "cat3=";
		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=B";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=" + pageNo;
		parameter = parameter + "&" + "_type=json";
//numOfRows=232
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//         out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
//	@RequestMapping("sleep")
//	public ModelAndView sleep() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("main/sleep");
//		return mav;
//	}
	@RequestMapping("sleep")
	public ModelAndView sleep(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		PrintWriter out = response.getWriter();
		Integer pageNo = 1;
		if(request.getParameter("pageNo") != null) 
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		parameter = parameter + "&" + "contentTypeId=32";
		parameter = parameter + "&" + "areaCode=39";
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=";
		parameter = parameter + "&" + "cat2=";
		parameter = parameter + "&" + "cat3=";
		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=" + pageNo;
		parameter = parameter + "&" + "_type=json";
//numOfRows=232
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//         out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);
		
		JSONParser parser = new JSONParser();//json파서 객체 생성
		JSONObject obj = (JSONObject)parser.parse(data);//Parser로 문자열 데이터를 Json으로 변환
		JSONObject parse_response = (JSONObject)obj.get("response");
		JSONObject parse_body = (JSONObject)parse_response.get("body");

		int totalCount = ((Long)parse_body.get("totalCount")).intValue();
		int limit = 12;
		int maxpage = (int)((double)totalCount/limit + 0.95);
		//보여지는 첫번째 페이지
		int startpage = (int)((pageNo/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mav.addObject("pageNo", pageNo);
		mav.setViewName("main/festival");
		mav.addObject("totalCount", totalCount);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.setViewName("main/sleep");
		return mav;
	}
//	@RequestMapping("SleepData")
//	public void sleepPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String lat = request.getParameter("lat");
//		String lon = request.getParameter("lon");
//		System.out.println(lat);
//		System.out.println(lon);
//				
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
//
//		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
//		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
//		String parameter = "";
//
//		PrintWriter out = response.getWriter();
//
//		parameter = parameter + "&" + "contentTypeId=32";
//		parameter = parameter + "&" + "areaCode=39";
//		parameter = parameter + "&" + "sigunguCode=";
//		parameter = parameter + "&" + "cat1=";
//		parameter = parameter + "&" + "cat2=";
//		parameter = parameter + "&" + "cat3=";
//		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
//		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
//		parameter = parameter + "&" + "arrange=A";
//		parameter = parameter + "&" + "numOfRows=12";
//		parameter = parameter + "&" + "pageNo=1";
//		parameter = parameter + "&" + "_type=json";
////numOfRows=232
//		addr = addr + serviceKey + parameter;
//		URL url = new URL(addr);
//
//		InputStream in = url.openStream();
//		CachedOutputStream bos = new CachedOutputStream();
//		IOUtils.copy(in, bos);
//		in.close();
//		bos.close();
//
////	        out.println(addr);
//
//		String data = bos.getOut().toString();
//		out.println(data);
//
//		JSONObject json = new JSONObject();
//		json.put("data", data);
//
//	}
	@RequestMapping("SleepData")
	public void sleepPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		String pageNo = request.getParameter("pageNo");
		System.out.println(pageNo);
		PrintWriter out = response.getWriter();

		parameter = parameter + "&" + "contentTypeId=32";
		parameter = parameter + "&" + "areaCode=39";
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=";
		parameter = parameter + "&" + "cat2=";
		parameter = parameter + "&" + "cat3=";
		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=" + pageNo;
		parameter = parameter + "&" + "_type=json";
//numOfRows=232
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//         out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);

	}
	@RequestMapping("placedetail")
	public ModelAndView placedetail(HttpServletRequest request, HttpServletResponse response) {
		String contentid = request.getParameter("contentid");
		System.out.println("1:"+contentid);
		ModelAndView mav = new ModelAndView();
	//url 찍어서 보내주기 scrap시 필요
		
		String scrapurl = request.getRequestURL().toString();
		if(request.getQueryString() != null) //쿼리부분이 있을때에는 원래 url에다가 쿼리값 넘겨주기.
			scrapurl = scrapurl + "?" + request.getQueryString();
		System.out.println(scrapurl);

			//scrap할 url 값 넘겨주기
		mav.addObject("scrapurl",scrapurl);
		mav.setViewName("main/placedetail");
		return mav;
	}
//	@RequestMapping("pdetail")
//	public void pdetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		String contentid = request.getParameter("contentid");
//		System.out.println("2:"+contentid);
//		
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
//		
//		
//		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
//		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
//		String parameter = "";
//		
//		PrintWriter out = response.getWriter();
//		
//		parameter = parameter + "&" + "contentTypeId=12";
//		parameter = parameter + "&" + "contentId="+contentid;
//		parameter = parameter + "&" + "MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//		
//		
//		addr = addr + serviceKey + parameter;
//		URL url = new URL(addr);
//		System.out.println(url);
//		InputStream in = url.openStream();
//		CachedOutputStream bos = new CachedOutputStream();
//		IOUtils.copy(in, bos);
//		in.close();
//		bos.close();
//
////	        out.println(addr);
//
//		String data = bos.getOut().toString();
//		out.println(data);
//
//		JSONObject json = new JSONObject();
//		json.put("data", data);
//		
//	}
	@RequestMapping("pdetail")
	public void pdetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String contentid = request.getParameter("contentid");
		System.out.println("2:" + contentid);

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";

		PrintWriter out = response.getWriter();

		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "contentId=" + contentid;
		parameter = parameter + "&"
				+ "MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		System.out.println(url);
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//         out.println(addr);

		String data = bos.getOut().toString();
		out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);

	}

	
	@RequestMapping("park")
	public ModelAndView park() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/park");
		return mav;
	}
	@RequestMapping("food")
	public ModelAndView food() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/food");
		return mav;
	}
	@RequestMapping("service")
	public ModelAndView service() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/service");
		return mav;
	}
	@RequestMapping("search")
	public void search(@RequestParam(value="userid")String userid, @RequestParam(value="keyword")String keyword, HttpServletRequest request) throws Exception{
		/*
		 * 검색기록을 insert 하기전에 해당 id로 select 해서 중복되는 값이 있는지 확인해야 한다.
		 * */
		Boolean sw = false;
		Search search = new Search();
		search.setUserid(userid);
		search.setkeyword(keyword.substring(3));
		
		List<Search> searchlist = service.getList(userid);
		for(Search i : searchlist) { //반복문을 돌면서 중복되는 값이 있는지 확인
			if(i.getkeyword().equals(keyword)) {//중복되는 값이 있는 경우.
			sw = true; //해당값을 따로 insert 해주지 않게 boolean 값을 true로 변경.
			break;
			}
		}
		if(sw.equals(false)) { // 중복되는 값이 없는경우 insert해주기
			service.searchInsert(search); //검색기록 추가하기위한 쿼리문
			
		}
		System.out.println("클릭한 건 :"+request.getParameter("ckeyword"));
		
	}
	@RequestMapping("scrap")
	public ModelAndView checkscrap(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String url = request.getParameter("url"); //submit으로 전송받은 url부분.
		Scrap scrap = new Scrap(); //scrap db에 저장할 객체 생성
		User user = (User)session.getAttribute("loginUser"); //user 에서 로그인 세션값 받아오기
		String title = request.getParameter("title");
		try {
		//scrap 객체에 셋팅
		scrap.setId(user.getId());
		scrap.setUrl(url); 
		scrap.setTitle(title);
		scrap.setType(5);
		service.scrap(scrap);
		mav.addObject("url",scrap.getUrl()); //뒤로 돌아가기 위해 mav에 현재 url정보 전달.
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("이미 스크랩 하셨습니다.", (String)request.getHeader("REFERER"));
		}
		return mav;
	}
	//형 꺼 새로 추가된거
	@RequestMapping("InfoTour")
	public ModelAndView InfoTour(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException 
	{
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
        String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
        String parameter = "";
		String arrange = request.getParameter("arrange");
		Integer pageNo = 1;
		if(request.getParameter("pageNo") != null) 
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
//       serviceKey = URLEncoder.encode(serviceKey,"utf-8");
        PrintWriter out = response.getWriter();
        parameter = parameter + "&" + "&contentTypeId=&areaCode=39&sigunguCode=&cat1=&cat2=&cat3=";
        parameter = parameter + "&" + "listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12";
        parameter = parameter + "&" + "pageNo=" + pageNo;
        parameter = parameter + "&" + "_type=json";
        addr = addr + serviceKey + parameter;
        URL url = new URL(addr);
        
        InputStream in = url.openStream(); 
        CachedOutputStream bos = new CachedOutputStream();
        IOUtils.copy(in, bos);
        in.close();
        bos.close();
        
//        out.println(addr);
        
        String data = bos.getOut().toString();        
        out.println(data);
        
        JSONObject json = new JSONObject();
        JSONParser parser = new JSONParser();//json파서 객체 생성
		JSONObject obj = (JSONObject)parser.parse(data);//Parser로 문자열 데이터를 Json으로 변환
		JSONObject parse_response = (JSONObject)obj.get("response");
		JSONObject parse_body = (JSONObject)parse_response.get("body");
		int totalCount = ((Long)parse_body.get("totalCount")).intValue();
		int limit = 12;
		int maxpage = (int)((double)totalCount/limit + 0.95);
		//보여지는 첫번째 페이지
		int startpage = (int)((pageNo/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mav.addObject("arrange", arrange);
		mav.addObject("totalCount", totalCount);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("pageNo", pageNo);
		mav.addObject("data", data);
		mav.setViewName("main/infoTour");
        json.put("data", data);
        return mav;
	}
	@RequestMapping("TourSearch")
	public ModelAndView TourSearch(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		String keyword = request.getParameter("keyword");
		String arrange = request.getParameter("arrange");
		Integer pageNo = 1;
		if(request.getParameter("pageNo") != null) 
		{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		keyword = URLEncoder.encode(keyword);
//       serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "keyword=" + keyword;
		parameter = parameter + "&" + "areaCode=39&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC&MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "&arrange=" + arrange + "&numOfRows=12";
		parameter = parameter + "&" + "pageNo=" + pageNo;
		parameter = parameter + "&" + "_type=json";
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//        out.println(addr);

		
		String data = bos.getOut().toString();
		out.println(data);
		JSONObject json = new JSONObject();
		json.put("data", data);

		JSONParser parser = new JSONParser();//json파서 객체 생성
		JSONObject obj = (JSONObject)parser.parse(data);//Parser로 문자열 데이터를 Json으로 변환
		JSONObject parse_response = (JSONObject)obj.get("response");
		JSONObject parse_body = (JSONObject)parse_response.get("body");

		int totalCount = ((Long)parse_body.get("totalCount")).intValue();
		int limit = 12;
		int maxpage = (int)((double)totalCount/limit + 0.95);
		//보여지는 첫번째 페이지
		int startpage = (int)((pageNo/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mav.addObject("arrange", arrange);
		mav.addObject("totalCount", totalCount);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("keyword", keyword);
		mav.addObject("pageNo", pageNo);
		mav.addObject("data", data);
		mav.setViewName("main/tourSearch");
		return mav;
	}

	@RequestMapping("SearchDetail")
	public ModelAndView SearchDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "YRbz2CjrYBE9UqzZxXfeSIwXtv8UXSzNjouD2gAtY4jXtk9xqhGEfwocVIN5leDY1u2601sNFlB9khwZkRAtcw%3D%3D";
		String parameter = "";
		String contenttypeid = request.getParameter("contenttypeid");
		String contentid = request.getParameter("contentid");
		
//       serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

//        out.println(addr);

		
		String data = bos.getOut().toString();
		out.println(data);
		JSONObject json = new JSONObject();
		json.put("data", data);
		
		//url 찍어서 보내주기 scrap시 필요
		
		String scrapurl = request.getRequestURL().toString();
		if (request.getQueryString() != null) // 쿼리부분이 있을때에는 원래 url에다가 쿼리값 넘겨주기.
			scrapurl = scrapurl + "?" + request.getQueryString();
		System.out.println(scrapurl);

		// scrap할 url 값 넘겨주기
		mav.addObject("scrapurl", scrapurl);
		mav.addObject("data", data);
		mav.setViewName("main/searchDetail");
		
		return mav;
	}

}
