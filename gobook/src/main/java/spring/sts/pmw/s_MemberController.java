package spring.sts.pmw;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.model.s_member.S_MemberDAO;
import spring.model.s_member.S_MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class s_MemberController {
	
	@Autowired
	private S_MemberDAO sdao;
	
	@Autowired
	private MemberDAO mdao;
	
	
	@RequestMapping(value = "/s_member/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		
		
		return "/s_member/list";
	}
	
	@RequestMapping(value = "/s_member/s_login", method = RequestMethod.GET)
	public String s_login(Locale locale, Model model) {
		
		
		return "/s_member/s_login";
	}
	
	@RequestMapping(value = "/s_member/create", method = RequestMethod.GET)
	public String create() {
		
		
		return "/s_member/create";
	}
	
	@RequestMapping(value = "/s_member/create", method = RequestMethod.POST)
	public String create(S_MemberDTO dto, Model model) {
		dto.setS_hour("MON:"+
				dto.getS_time()+";"+"TUE:"+
				dto.getS_time2()+";"+"WED:"+
				dto.getS_time3()+";"+"THU:"+
				dto.getS_time4()+";"+"FRI:"+
				dto.getS_time5()+";"+"SAT:"+
				dto.getS_time6()+";"+"SUN:"+
				dto.getS_time7()+";"
				);
		
		
		try {
			MemberDTO mdto=new MemberDTO();
			mdto.setId(dto.getS_id());
			mdto.setGrade("S");
			mdao.create(mdto);
			if(sdao.create(dto)) {
				return "redirect:/s_member/success";
			}else {
				return "redirect:/s_member/error";
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/s_member/error";
		
		
	}
	
	@RequestMapping(value = "/member/read", method = RequestMethod.GET)
	public String read(Locale locale, Model model) {
		
		
		return "/s_member/read";
	}
	
	@RequestMapping(value = "/member/imgupdate", method = RequestMethod.GET)
	public String imgupdate(Locale locale, Model model) {
		
		
		return "/s_member/imgUpdate";
	}
	
	
	@RequestMapping(value = "/s_member/update", method = RequestMethod.GET)
	public String update(Locale locale, Model model) {
		
		
		return "/s_member/update";
	}
	@RequestMapping(value = "/s_member/delete", method = RequestMethod.GET)
	public String delete(Locale locale, Model model) {
		
		
		return "/s_member/delete";
	}
	
}
