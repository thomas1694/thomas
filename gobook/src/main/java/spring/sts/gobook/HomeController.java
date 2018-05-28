package spring.sts.gobook;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.spi.MDCAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.model.admin_member.Admin_MemberDAO;
import spring.model.admin_member.Admin_MemberDTO;
import spring.model.c_member.C_MemberDAO;
import spring.model.c_member.C_MemberDTO;
import spring.model.member.MemberDAO;
import spring.model.notice.NoticeDTO;
import spring.model.page_image.Page_ImageDAO;
import spring.model.s_member.S_MemberDAO;
import spring.model.s_member.S_MemberDTO;
import spring.model.statistics.StaticDAO;
import spring.model.statistics.StaticDTO;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private S_MemberDAO sdao;
	
	@Autowired
	private C_MemberDAO cdao;
	
	@Autowired
	private Page_ImageDAO pdao;
	
	@Autowired
	private StaticDAO stdao;
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		System.out.println("sessionid:"+request.getSession().getAttribute("id"));
		Map map=new HashMap();
		try {
			int stotal=sdao.total(map);
			int total=dao.total(map);
			model.addAttribute("stotal", stotal);
			model.addAttribute("total", total);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/home";
	}
	
	@RequestMapping(value = "/cscenter", method = RequestMethod.GET)
	public String cs( Model model) {
		
		
		return "/cscenter";
	}
	

	
	
	@RequestMapping(value = "/{id}/chat", method = RequestMethod.GET)
	public ModelAndView chat(@PathVariable String id,HttpServletRequest request, ModelAndView mv) {
		if(request.getSession().getAttribute("chatroom")!=null) {
			request.getSession().removeAttribute("chatroom");}
		request.getSession().setAttribute("chatroom", id);
		
		if(request.getSession().getAttribute("grade")==null) {
			request.getSession().setAttribute("grade","F");
		}
		
		if(request.getSession().getAttribute("grade").equals("C")) {
			mv.setViewName("/chat");
			return mv;
		}else if(request.getSession().getAttribute("grade").equals("S")) {
			mv.setViewName("/chat");
			return mv;
		}else if(request.getSession().getAttribute("grade").equals("A")){
			mv.setViewName("/chat");
			return mv;
		}
			
		
		mv.setViewName("/msg");
		mv.addObject("msg", "비회원은 이용할 수 없습니다");
		return mv;
		
	}
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String memberList(HttpServletRequest request, Model model) {
		//member list
				
					String grade=(String)request.getSession().getAttribute("grade");
					if(grade!=null&&grade.equals("A")) {
					Map map=new HashMap();
					String col = Utility.checkNull(request.getParameter("col"));
					String word = Utility.checkNull(request.getParameter("word"));
					map.put("col", col );
					map.put("word", word);
					try {
						//페이징 관련
						int nowPage = 1;	
						int recordPerPage = 10;
						
						if(request.getParameter("nowPage")!=null&&request.getParameter("nowPage")!="")
							nowPage = Integer.parseInt(request.getParameter("nowPage"));
						
						int sno = ((nowPage-1) * recordPerPage) + 1;
						int eno = nowPage * recordPerPage;
						
						map.put("sno", sno);
						map.put("eno", eno);
						
						List<NoticeDTO> list;
						try {
							list = dao.list(map);
							
							int total = dao.total(map);
							String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
							
							request.setAttribute("list", list);
							request.setAttribute("paging", paging);
							request.setAttribute("col", col);
							request.setAttribute("word", word);
							request.setAttribute("nowPage", nowPage);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					return "/member";
					}else {
					String error="접근권한이 없습니다.";
					request.setAttribute("error", error);
					return "/error";
		}
				
				
	}
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String c_home(HttpServletRequest request, Model model,@PathVariable String id) {
		
		
		//template 구현
		if(sdao.s_MemberCheck(id)) {
			try {
				S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
				sdto.setC_hour();
				Map map=new HashMap();
				map.put("s_id", id);
				List plist=pdao.list(map);
				
				//통계관련 시작~
				StaticDTO stdto = new StaticDTO();
				stdto.setStat_ip(request.getRemoteAddr());
				stdto.setS_id(id);
				stdto.setC_id((String)request.getSession().getAttribute("id"));
				System.out.println(stdto.getC_id());
				boolean stflag = stdao.create(stdto);
				
				if(!stflag) {
					String error="어쩌구저쩌구 에러";
					request.setAttribute("error", error);
					return "/error";
				}								
				//통계관련 ~끝
				
				model.addAttribute("sdto", sdto);
				model.addAttribute("plist", plist);
				return "/c_home";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			return "/error";
		}else {
			String error="id가 "+id+"인 판매자 회원을 찾을 수 없습니다.";
			request.setAttribute("error", error);
			return "/error"; //판매자회원이 아니라서 페이지를 찾을수 없음
		}
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {
		String requestUri = request.getHeader("REFERER");
		if(request.getSession().getAttribute("id")!=null) {
			String error="접근 권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";}
		String cc_id = ""; // ID 저장 여부를 저장하는 변수, Y
		String cc_id_val = ""; // ID 값

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("cc_id")) {
					cc_id = cookie.getValue(); // Y 
				} else if (cookie.getName().equals("cc_id_val")) {
					cc_id_val = cookie.getValue(); // cc_user1... 
					System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^"+cc_id_val);
				}
			}
		}
		
		request.setAttribute("cc_id", cc_id);
		request.setAttribute("cc_id_val", cc_id_val);
		request.setAttribute("uri", requestUri);
		return "/member/login";
	}
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(HttpServletResponse response,HttpServletRequest request,String id,String selectID,String passwd ,String uri, Model model) {
		
		Map map = new HashMap();
		if(adminCheck(id,passwd)) {
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("grade", "A");
			return "redirect:/";
		}else {
		if(selectID.trim().equals("s_id")) {
			map.put("s_id", id);
			map.put("s_passwd", passwd);
			
			
			if(sdao.passwdCheck(map)) {
				request.getSession().setAttribute("id", id);
				request.getSession().setAttribute("grade", "S");
				
				
				Cookie cookie = null; 
			       
			    String cc_id = request.getParameter("cc_id"); // Y, 아이디 저장 여부 
			       
			    if (cc_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
			      cookie = new Cookie("cc_id", "Y");    // 아이디 저장 여부 쿠키 
			      cookie.setMaxAge(120);               // 2 분 유지 
			      response.addCookie(cookie);          // 쿠키 기록 
			   
			      cookie = new Cookie("cc_id_val", id); // 아이디 값 저장 쿠키  
			      cookie.setMaxAge(120);               // 2 분 유지 
			      response.addCookie(cookie);          // 쿠키 기록  
			         
			    }else{ 
			      cookie = new Cookie("cc_id", "");     // 쿠키 삭제 
			      cookie.setMaxAge(0); 
			      response.addCookie(cookie); 
			         
			      cookie = new Cookie("cc_id_val", ""); // 쿠키 삭제 
			      cookie.setMaxAge(0); 
			      response.addCookie(cookie); 
			    } 
			    String sr="http://172.16.3.8:8000/gobook/s_member/create";
			    String lg="http://172.16.3.8:8000/gobook/member/login";
			    if(uri.trim().equals(sr)||uri.trim().equals(lg))uri="/";
				return "redirect:"+uri;
				
			}else {
				String error="아이디 또는 비밀번호를 틀렸습니다.";
				request.setAttribute("error", error);
				return "/error";
			}
		
		}else if(selectID.trim().equals("c_id")) {
			
			map.put("c_id", id);
			map.put("c_passwd", passwd);
			
			if(cdao.passwdCheck(map)) {
				request.getSession().setAttribute("id", id);
				request.getSession().setAttribute("grade", "C");
				
				Cookie cookie = null; 
			       
			    String cc_id = request.getParameter("cc_id"); // Y, 아이디 저장 여부 
			       
			    if (cc_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
			      cookie = new Cookie("cc_id", "Y");    // 아이디 저장 여부 쿠키 
			      cookie.setMaxAge(120);               // 2 분 유지 
			      response.addCookie(cookie);          // 쿠키 기록 
			   
			      cookie = new Cookie("cc_id_val", id); // 아이디 값 저장 쿠키  
			      cookie.setMaxAge(120);               // 2 분 유지 
			      response.addCookie(cookie);          // 쿠키 기록  
			         
			    }else{ 
			      cookie = new Cookie("cc_id", "");     // 쿠키 삭제 
			      cookie.setMaxAge(0); 
			      response.addCookie(cookie); 
			         
			      cookie = new Cookie("cc_id_val", ""); // 쿠키 삭제 
			      cookie.setMaxAge(0); 
			      response.addCookie(cookie); 
			    } 
			    String cr="http://172.16.3.8:8000/gobook/c_member/create";
			    String lg="http://172.16.3.8:8000/gobook/member/login";
			    if(uri.trim().equals(cr)||uri.trim().equals(lg))uri="/";
			    return "redirect:"+uri;
			}else {
				String error="아이디 또는 비밀번호를 틀렸습니다.";
				request.setAttribute("error", error);
				return "/error";
			}
		}
		}
		return "/error";
	}

	private boolean adminCheck(String id,String passwd) {
		boolean flag=false;
		flag=sdao.adminCheck(id,passwd);
		return flag;
	}
	
	
	
	@RequestMapping("/member/read" )
	public String aread(String grade,String id,HttpServletRequest request,Model model) {
		if(grade==null)grade=(String)request.getSession().getAttribute("grade");
		if(id==null)id=(String)request.getSession().getAttribute("id");
		
		if(grade==null) {
			return "redirect:/member/login";
		}else if(grade.trim().equals("C")) {
			 request.setAttribute("id", id);
			return c_read(request,model);
		}else if(grade.trim().equals("S")) {
			 request.setAttribute("id", id);
			return s_read(request,model);
		}else if(grade.trim().equals("A")) {
			return "redirect:/admin/read";
		}
		else {
			String error="멤버읽기 에러";
			request.setAttribute("error", error);
			return "/error";
		}
		
	}
	
	
	private String s_read(HttpServletRequest request,Model model) {
		String s_id=(String)request.getAttribute("id");
		if(s_id==null) s_id=(String) request.getSession().getAttribute("id");
		if(s_id!=null&&sdao.s_MemberCheck(s_id)==true) {
		try {
			S_MemberDTO dto=(S_MemberDTO) sdao.read(s_id);
			model.addAttribute("dto",dto);
			return "/s_member/read";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/error";
		}else {
		return "/error";}
	}
	
	
	
	public String c_read(HttpServletRequest request,Model model){	
		//int id로 해도 되지만 없을수도 있으니까(내정보 보기에서 들어오는거랑 admin 리스트에서 들어오는거..?) HttpServletRequest로 받음..?
		
		String id = (String) request.getAttribute("id"); //관리자의 list 페이지에서 온 거임

		if(id == null) id = (String)request.getSession().getAttribute("id"); 
		//일반 사용자 세션으로 메뉴를 통해서 들어온거임!!!!~!~!
		System.out.println(id);
		C_MemberDTO dto;
		try {
			dto = cdao.read(id);
		
		System.out.println("***************************"+dto.getC_rdate());

		request.setAttribute("dto", dto);
		request.setAttribute("c_id", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/c_member/read";
	}
	
	
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();//모든 세션변수 제거
		String requestUri = request.getHeader("REFERER");
		System.out.println(requestUri);
		return "redirect:"+requestUri;
	}
	
	@RequestMapping("/member/select")
	public String select(HttpServletRequest request) {
		if(request.getSession().getAttribute("id")!=null) {
			String error="접근 권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";}
		return "/member/select";
	}
	
	@RequestMapping(value="/member/delete",method=RequestMethod.POST)
	public String delete(String id,HttpServletRequest request) throws Exception {
		if(id.trim().equals("admin")) {
			String error="접근권한이 없어 강제 탈퇴에 실패했습니다";
			request.setAttribute("error", error);
			return "error";
			}
		if(dao.delete(id)) {
		return "redirect:/member/list";
		}else {
			String error="강제탈퇴 실패";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	
}
