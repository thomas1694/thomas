package spring.sts.pmw;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
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
	
	@RequestMapping(value = "/s_member/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		Map map=new HashMap();
		map.put("col", request.getParameter("col"));
		map.put("word", request.getParameter("word"));
		try {
			List list=sdao.list(map);
			model.addAttribute("list", list);
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
	
	@RequestMapping(value = "/s_member/create", method = RequestMethod.GET)
	public String create() {
		
		
		return "/s_member/create";
	}
	
	@RequestMapping(value = "/s_member/create", method = RequestMethod.POST)
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
		
		
		try {
			
			if(sService.s_memberCreate(dto)) {
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
		}
		return "/error";
		
		
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
		
		return "/error";
	}
	

}
