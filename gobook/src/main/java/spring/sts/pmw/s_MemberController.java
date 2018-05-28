package spring.sts.pmw;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.model.c_member.MailService;
import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.model.notice.NoticeDTO;
import spring.model.s_member.S_MemberDAO;
import spring.model.s_member.S_MemberDTO;
import spring.model.s_member.S_MemberService;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class s_MemberController {
	
	@Autowired
	private S_MemberDAO sdao;
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private S_MemberService sService;
	
	@Autowired
	private MailService mailService;
	 
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	@RequestMapping(value="/s_member/settings")
	public String settings(HttpServletRequest request) {
		String id=(String) request.getSession().getAttribute("id");
		String grade=(String) request.getSession().getAttribute("grade");
		if(id==null||grade==null||!grade.equals("S"))return "redirect:/member/login";
		return "/s_member/settings";
	}
	
	@RequestMapping(value = "/s_member/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		Map map=new HashMap();
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		map.put("col", col );
		map.put("word", word);
		
		//페이징 관련
			int nowPage = 1;	
			int recordPerPage = 5;
			
			if(request.getParameter("nowPage")!=null&&request.getParameter("nowPage")!="")
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int sno = ((nowPage-1) * recordPerPage) + 1;
			int eno = nowPage * recordPerPage;
			
			map.put("sno", sno);
			map.put("eno", eno);
			
			List<NoticeDTO> list;
			try {
				list = sdao.list(map);
				
				int total = sdao.total(map);
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
		return "/s_member/list";
	}
	
	@RequestMapping(value = "/s_member/s_login", method = RequestMethod.GET)
	public String s_login(Locale locale, Model model) {
		
		
		return "/s_member/s_login";
	}
	
	@RequestMapping(value = "/s_member/create")
	public String create(HttpServletRequest request) {
		if(request.getSession().getAttribute("id")!=null) {
			String error="접근 권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";}
		
		return "/s_member/create";
	}
	
	@RequestMapping(value = "/s_member/createProc", method = RequestMethod.POST)
	public String create(S_MemberDTO dto, Model model) {
		dto.setS_hour(dto.getS_hour1()+";"+
				dto.getS_hour2()+";"+
				dto.getS_hour3()+";"+
				dto.getS_hour4()+";"+
				dto.getS_hour5()+";"+
				dto.getS_hour6()+";"+
				dto.getS_hour7()
				);
		dto.setS_location(dto.getS_location().substring(1, dto.getS_location().length()-1));
		if(dto.getS_info()==null)dto.setS_info("   ");
		
		try {
			
			if(sService.s_memberCreate(dto)) {
				return "redirect:/member/login";
			}else {
				String error="회원가입에 실패했습니다.";
				model.addAttribute("error", error);
				return "/error";
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/s_member/error";
		
		
	}
	
	@RequestMapping(value = "/member/updateImg", method = RequestMethod.POST)
	public String imgupdate(HttpServletRequest request,String s_id,MultipartFile filenameMF, Model model) {
		String basePath=request.getRealPath("/storage/member/img");
		String s_filename=Utility.saveFileSpring30(filenameMF, basePath);
		int s_filesize=(int)filenameMF.getSize();
		Map map=new HashMap();
		map.put("s_filename", s_filename);
		map.put("s_filesize", s_filesize);
		map.put("s_id", s_id);
		if(sdao.s_member_updateImg(map)) {
			model.addAttribute("s_id", s_id);
			return "redirect:/member/read";
		}else {
			String error="이미지 업데이트에 실패했습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
		
		
	}
	
	
	@RequestMapping(value = "/s_member/update", method = RequestMethod.GET)
	public String update(String s_id, Model model) {
		try {
			S_MemberDTO dto=(S_MemberDTO) sdao.read(s_id);
			String hours[]=dto.getS_hour().split(";");
			for(int i=0;i<hours.length;i++) {
				hours[i]=hours[i].split("/")[1];
			}
			dto.setS_hour1(hours[0]);
			dto.setS_hour2(hours[1]);
			dto.setS_hour3(hours[2]);
			dto.setS_hour4(hours[3]);
			dto.setS_hour5(hours[4]);
			dto.setS_hour6(hours[5]);
			dto.setS_hour7(hours[6]);
			
			model.addAttribute("dto",dto);
			return "/s_member/update";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			String error="회원 정보 수정에 실패했습니다.";
			model.addAttribute("error", error);
			return "/error";
		}
	}
		
		@RequestMapping(value = "/s_member/update", method = RequestMethod.POST)
		public String updateProc(S_MemberDTO dto, Model model) {
			boolean flag=false;
			try {
				dto.setS_hour(dto.getS_hour1()+";"+
						dto.getS_hour2()+";"+
						dto.getS_hour3()+";"+
						dto.getS_hour4()+";"+
						dto.getS_hour5()+";"+
						dto.getS_hour6()+";"+
						dto.getS_hour7()
						);
				dto.setS_location(dto.getS_location().substring(1, dto.getS_location().length()-1));
				flag=sdao.update(dto);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				String error="회원 정보 수정에 실패했습니다.";
				model.addAttribute("error", error);
				return "/error";
			}
			if(flag==false) {
				String error="회원 정보 수정에 실패했습니다.";
				model.addAttribute("error", error);
				return "/error";
			}else {
				return "redirect:/member/read";
			}
		
	}
	@RequestMapping(value = "/s_member/delete", method = RequestMethod.GET)
	public String deleteg( Model model) {
		
		
		return "/s_member/delete";
	}
	
	@RequestMapping(value = "/s_member/delete", method = RequestMethod.POST)
	public String deletep(String s_id, Model model) {
		try {
			if(mdao.delete(s_id)) {
				return "redirect:/";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String error="삭제에 실패했습니다.";
		model.addAttribute("error", error);
		return "/error";
	}
	
	@RequestMapping("/s_member/agree")
	public String agree(HttpServletRequest request) {
		if(request.getSession().getAttribute("id")!=null) {
			String error="접근 권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";}
		return "/s_member/agree";
	}
	
	@RequestMapping("/s_member/id_proc")
	public String id_proc(HttpServletRequest request) {
		
		String s_id = request.getParameter("s_id");
		
		boolean flag= sdao.idCheck(s_id);
		
		request.setAttribute("flag", flag);
		
		return "s_member/id_proc";
	}
	
	@RequestMapping("/s_member/id_form")
	public String id_form() {
		
		return "/s_member/id_form";
	}
	
	// 회원가입 이메일 인증
    @RequestMapping(value="/s_member/emailCheck/", method=RequestMethod.POST, produces = "application/text;charset=utf8" )
    @ResponseBody
    private String emailCheck(@RequestParam String email) {
    	String flag = sdao.emailCheck(email);

    	//false면 사용가능한 것
    	return flag;
    }
   
    // 회원가입 이메일 인증
    @RequestMapping(value="/s_member/sendMail/", method=RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf8")
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
    @RequestMapping(value="/s_member/codeCheck/", method=RequestMethod.POST, produces = "application/text;charset=utf8" )
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
