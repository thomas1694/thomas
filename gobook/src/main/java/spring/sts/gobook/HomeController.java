package spring.sts.gobook;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member.MemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberDAO dao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		return "/home";
	}
	
	@RequestMapping(value = "/cscenter", method = RequestMethod.GET)
	public String cs(Locale locale, Model model) {
		
		
		return "/cscenter";
	}
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String c_home(HttpServletRequest request, Model model,@PathVariable String id) {
		if(id.trim().equals("member")) {
			
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
		}
		model.addAttribute("id", id);
		return "/c_home";
	}
	
}
