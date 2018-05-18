package spring.sts.gobook;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.c_member.C_MemberDAO;
import spring.model.c_member.C_MemberDTO;
import spring.model.member.MemberDAO;
import spring.model.s_member.S_MemberDAO;
import spring.model.s_member.S_MemberDTO;

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
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		System.out.println(request.getSession().getAttribute("id"));
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
	public String cs(Locale locale, Model model) {
		
		
		return "/cscenter";
	}
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String c_home(HttpServletRequest request, Model model,@PathVariable String id) {
		if(id.trim().equals("member")) {
			String grade=(String)request.getSession().getAttribute("grade");
			if(grade!=null&&grade.equals("A")) {
			Map map=new HashMap();
			map.put("col", request.getParameter("col") );
			map.put("word", request.getParameter("word") );
			try {
				List list=dao.list(map);
				model.addAttribute("list", list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "/member";
			}else {
				return "/error";
			}
		}
		model.addAttribute("id", id);
		return "/c_home";
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {
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
		
		return "/member/login";
	}
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(HttpServletResponse response,HttpServletRequest request,String id,String selectID,String passwd, Model model) {
		
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
			    
				return "redirect:/";
			}else {
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
			    
			    
				return "redirect:/";
			}else {
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
	
	@RequestMapping(value="/member/read" ,method=RequestMethod.GET)
	public String read(HttpServletRequest request,Model model) {
		String grade=(String)request.getSession().getAttribute("grade");
		System.out.println(grade);
		if(grade==null) {
			return "redirect:/member/login";
		}else if(grade.trim().equals("S")) {
			return s_read(request,model);
		}else if(grade.trim().equals("C")) {
			return c_read(request,model);
		}else {
			return "/error";
		}
		
	}
	
	
	private String s_read(HttpServletRequest request,Model model) {
		String s_id=(String) request.getSession().getAttribute("id");
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
		
		String id = request.getParameter("c_id"); //관리자의 list 페이지에서 온 거임

		if(id == null) id = (String)request.getSession().getAttribute("id"); 
		//일반 사용자 세션으로 메뉴를 통해서 들어온거임!!!!~!~!

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
		
		return "redirect:/";
	}
	
}
