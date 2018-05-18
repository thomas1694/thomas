package spring.sts.ksy;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.c_member.C_MemberDAO;
import spring.model.c_member.MailService;

@Controller
public class MailController {
	
	@Autowired
	private C_MemberDAO dao;
	
	
}