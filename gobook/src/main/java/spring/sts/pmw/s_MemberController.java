package spring.sts.pmw;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class s_MemberController {
	
	
	
	@RequestMapping(value = "/s_member", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		
		
		return "/s_member/list";
	}
	
	@RequestMapping(value = "/s_member/s_login", method = RequestMethod.GET)
	public String s_login(Locale locale, Model model) {
		
		
		return "/s_member/s_login";
	}
	
	@RequestMapping(value = "/s_member/create", method = RequestMethod.GET)
	public String create(Locale locale, Model model) {
		
		
		return "/s_member/create";
	}
	
	@RequestMapping(value = "/s_member/read", method = RequestMethod.GET)
	public String read(Locale locale, Model model) {
		
		
		return "/s_member/read";
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
