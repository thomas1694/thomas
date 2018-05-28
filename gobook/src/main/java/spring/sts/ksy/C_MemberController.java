package spring.sts.ksy;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.c_member.C_MemberDAO;
import spring.model.c_member.C_MemberDTO;
import spring.model.c_member.C_MemberMgr;
import spring.model.c_member.MailService;
import spring.model.member.MemberDAO;



/**
 * Handles requests for the application home page.
 */
@Controller
public class C_MemberController {
	
	@Autowired
	private C_MemberDAO dao;
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private C_MemberMgr mgr;
	
	/*private static final Logger logger = LoggerFactory.getLogger(C_MemberController.class);*/
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/c_member/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
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
		
		return "/c_member/login";
	}
	
	@RequestMapping(value="/c_member/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("c_id", id);
		map.put("c_passwd", passwd);
		System.out.println("~~~~~~~~~~~"+id);		
		boolean flag = dao.loginCheck(map);
		String grade = null;	//회원등급
		String url = "/c_member/passwdError";		//기본적으로 에러페이지로 가게 설정, 비회원일 경우 이동
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%"+id);
		if(flag){				//회원인경우
			grade = mdao.getGrade(id);
			System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+id+"$$"+grade);
			request.getSession().setAttribute("id", id);             /*  세션에 로그인 정보 저장 */
			request.getSession().setAttribute("grade", grade);
		    
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
		    
		    url = "redirect:/";
		}
		return url;		
	}
	
	/*@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) throws Exception {
		//검색부분-------------------------------------------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
				
		if(col.equals("total")){
			word = "";
		}  
				
		//페이징부분-------------------------------------------------------------
		int nowPage = 1;
		int recordPerPage = 5;
		if(request.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);	
				
		List<MemberDTO> list = dao.list(map);
				
		int totalRecord = dao.total(map); 
				
		//페이징 출력메소드 호출
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
				
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/c_member/list";
	}*/
	
	
	
	@RequestMapping(value="/c_member/update", method=RequestMethod.GET)
	public String update(HttpServletRequest request) throws Exception {
		String id = request.getParameter("c_id");
		C_MemberDTO dto = dao.read(id);
		
		request.setAttribute("dto", dto);
		return "/c_member/update";
	}
	
	@RequestMapping(value="/c_member/update", method=RequestMethod.POST)
	public String update(C_MemberDTO dto, HttpSession session, 
			Model model, HttpServletRequest request) throws Exception {
		
		
		System.out.println("################");
		boolean flag = dao.update(dto);
		System.out.println("@@@@@@@@@@@@@@@@");
		if(flag) {
			
				
				return "redirect:/member/read";
			
		}else {
			return "/c_member/error";
		}
	}
	
	@RequestMapping(value="/c_member/delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		String id = request.getParameter("c_id");

		if(id == null) id = (String)request.getSession().getAttribute("id");
		
		return "/c_member/delete";
	}
	
	@RequestMapping(value="/c_member/delete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) throws Exception {
		String c_id = request.getParameter("c_id");
		
		String sid = (String)request.getSession().getAttribute("id");
		String grade = (String)request.getSession().getAttribute("grade");
		System.out.println("*~!@$#@$^#&"+c_id);
		String flag = dao.delete2(c_id);
		System.out.println("^^^^^^^^^^^^^^^^^^^"+c_id);
		if(flag.equals("true")){
			if(sid!=null && !grade.equals("S")) {
				request.getSession().invalidate();               //세션의 정보도 지워지고 로그아웃된다.
				
				return "redirect:/";
			}else {
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				return "redirect:/admin/list";
			}			
		} else if(flag.equals("have_false")) {
			return "/c_member/haveError";
		}else {
			return "/c_member/error";
		}
	}
	
	@RequestMapping("/c_member/create")
	public String create(HttpServletRequest request) {
		if(request.getSession().getAttribute("id")!=null) {
			String error="접근 권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";}
		return "/c_member/create";
	}
	
	@RequestMapping("/c_member/createProc")
	public String createProc(C_MemberDTO dto, HttpServletRequest request) throws Exception {
		String str = null;
		System.out.println("***************************"+dto.getC_id());
		String url = "/c_member/prcreateProc";
		
		if (dao.idCheck(dto.getC_id())) {
			str = "중복된 아이디입니다. 아이디 중복 확인하세요.";
			request.setAttribute("str", str);
			
		} else if (dao.emailCheck(dto.getC_id())) {
			str = "중복된 이메일입니다. 이메일 중복 확인하세요.";
			request.setAttribute("str", str);
		
		} else {
			
			try {
				mgr.create(dto);
				
				url = "redirect:/member/login";
			}catch(Exception e) {
				e.printStackTrace();
				
				url = "/c_member/error";
			}
		}		
		return url;
	}
	
	@RequestMapping("/c_member/agree")
	public String agree(HttpServletRequest request) {
		if(request.getSession().getAttribute("id")!=null) {
			String error="접근 권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";}
		return "/c_member/agree";
	}
	
	@RequestMapping("/c_member/email_form")
	public String email_form() {
		
		return "/c_member/email_form";
	}
	
	@RequestMapping("/c_member/email_proc")
	public String email_proc(HttpServletRequest request) {
		
		String email = request.getParameter("c_email");
		
		boolean flag= dao.emailCheck(email);
		
		request.setAttribute("flag", flag);
		
		return "/c_member/email_proc";
	}
	
	@RequestMapping("/c_member/id_form")
	public String id_form() {
		
		return "/c_member/id_form";
	}
	
	@RequestMapping("/c_member/id_proc")
	public String id_proc(HttpServletRequest request) {
		
		String c_id = request.getParameter("c_id");
		
		boolean flag= dao.idCheck(c_id);
		
		request.setAttribute("flag", flag);
		
		return "c_member/id_proc";
	}
	
	@RequestMapping("/c_member/updatePasswdProc")
	public String updatePasswd(HttpServletRequest request,String id,String oldpasswd,String newpasswd1) throws Exception {
			
		boolean flag = false;   //변경성공
		Map<String, String> map = new HashMap<String, String>();
		map.put("c_id", id);
		map.put("c_passwd", oldpasswd);
		
		if(dao.passwdCheck(map)){
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("c_id", id);
			map2.put("c_new_passwd", newpasswd1);
			
			flag = dao.updatePasswd(map2);
		}else{
			return "/member/passwdError";
		}

		if(flag) {
			return "redirect:/member/read";
		}else {
			String error="비밀번호 변경에 실패했습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	@RequestMapping("/c_member/updatePasswd")
	public String updatePasswd() {
		
		return "/c_member/updatePasswd";
	}
	
	@Autowired
	private MailService mailService;
	 
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	// 회원가입 이메일 인증
    @RequestMapping(value="/c_member/emailCheck/", method=RequestMethod.POST, produces = "application/text;charset=utf8" )
    @ResponseBody
    private String emailCheck(@RequestParam String email) {
    	String flag = dao.emailCheck2(email);

    	//false면 사용가능한 것
    	return flag;
    }
   
    // 회원가입 이메일 인증
    @RequestMapping(value="/c_member/sendMail/", method=RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf8")
    @ResponseBody
    public void sendMailAuth(HttpSession session, @RequestParam String email) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
       
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        System.out.println(joinCode);
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("회원가입 인증 코드는 " + joinCode + " 입니다.");
        mailService.send(subject, sb.toString(), "nosqljava@gmail.com", email);
    }	
    
    // 회원가입 이메일 코드확인
    @RequestMapping(value="/c_member/codeCheck/", method=RequestMethod.POST, produces = "application/text;charset=utf8" )
    @ResponseBody
    private String codeCheck(HttpSession session, @RequestParam String emailcode) {
    	String flag = "false";
    	
    	String joinCode = (String) session.getAttribute("joinCode");
    	System.out.println(joinCode);
    	if(joinCode.equals(emailcode)) {
    		flag = "true";
    	}
    	//true면 사용가능한 것
    	return flag;
    }
}
