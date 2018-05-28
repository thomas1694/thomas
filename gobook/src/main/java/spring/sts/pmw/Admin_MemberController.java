package spring.sts.pmw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.admin_member.Admin_MemberDAO;
import spring.model.admin_member.Admin_MemberDTO;
import spring.model.admin_member.Admin_MemberService;

@Controller
public class Admin_MemberController {

	@Autowired
	private Admin_MemberDAO adao;
	
	@Autowired
	private Admin_MemberService aservice;
	
	@RequestMapping("/admin/read")
	public String a_read(HttpServletRequest request) throws Exception {
		String id=null;
		if(request.getSession().getAttribute("id")!=null&&request.getSession().getAttribute("id").equals("admin"))id=request.getParameter("id");
		if(id==null)id=(String)request.getSession().getAttribute("id");
		if(id==null) return "redirect:/";
		Admin_MemberDTO dto=(Admin_MemberDTO) adao.read(id);
		request.setAttribute("dto", dto);
		return "/admin/read";
	}
	
	@RequestMapping("/admin/list")
	public String a_list(HttpServletRequest request) throws Exception {
		String id=(String)request.getSession().getAttribute("id");
		if(id==null)id="";
		if(id.trim().equals("admin")) {
			Map map=new HashMap<>();
			List list=adao.list(map);
			request.setAttribute("list", list);
		return "/admin/list";
		}else {
			String error="접근 권한이 없습니다";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	@RequestMapping(value="/admin/create",method=RequestMethod.GET)
	public String create(HttpServletRequest request) throws Exception {
		String id=(String)request.getSession().getAttribute("id");
		if(id.trim().equals("admin")) {
			
		return "/admin/create";
		
		}else {
			String error="접근 권한이 없습니다";
			request.setAttribute("error", error);
			return "/error";
		}
		
	}
	
	@RequestMapping(value="/admin/create",method=RequestMethod.POST)
	public String createP(HttpServletRequest request,Admin_MemberDTO dto) throws Exception {
		String id=(String)request.getSession().getAttribute("id");
		if(id.trim().equals("admin")) {
			if(aservice.a_memberCreate(dto)) {
				}else {
					String error="관리자 추가 실패";
					request.setAttribute("error", error);
					return "/error";
				}
		return "redirect:/admin/list";
		}else {
			String error="접근 권한이 없습니다";
			request.setAttribute("error", error);
			return "/error";
		}
		
	}
	
	@RequestMapping(value="/admin/delete",method=RequestMethod.GET)
	public String delete(HttpServletRequest request,String aid) throws Exception {
		String id=(String)request.getSession().getAttribute("id");
		if(id.trim().equals("admin")||aid.equals(id)) {
			if(adao.delete(aid)) {
		return "redirect:/admin/list";
			}else {
				String error="관리자 삭제 실패";
				request.setAttribute("error", error);
				return "/error";
			}
		}else {
			String error="접근 권한이 없습니다";
			request.setAttribute("error", error);
			return "/error";
		}
		
	}
	
	@RequestMapping(value="/admin/update",method=RequestMethod.GET)
	public String update(HttpServletRequest request,String aid) throws Exception {
		String id=(String)request.getSession().getAttribute("id");
		if(id.trim().equals("admin")||aid.equals(id)) {
			Admin_MemberDTO dto=(Admin_MemberDTO) adao.read(aid);
			request.setAttribute("dto", dto);
			String requestUri = request.getHeader("REFERER");
			request.setAttribute("uri", requestUri);
			return "/admin/update";
		
		}else {
			String error="접근 권한이 없습니다";
			request.setAttribute("error", error);
			return "/error";
		}
		
	}
	
	@RequestMapping(value="/admin/update",method=RequestMethod.POST)
	public String update(String uri,HttpServletRequest request,Admin_MemberDTO dto,String old_passwd) throws Exception {
		Map map=new HashMap<>();
		map.put("a_id", dto.getA_id());
		map.put("a_passwd", old_passwd);
		boolean flag=adao.passwdCheck(map);
		if(flag) {
			if(adao.update(dto)) {
			return "redirect:"+uri;
			}else {
				String error="관리자 수정 실패";
				request.setAttribute("error", error);
				return "/error";
			}
		}else {
			String error="비밀번호가 틀렸습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
		
		
	}
}
