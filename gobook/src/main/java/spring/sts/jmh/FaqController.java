package spring.sts.jmh;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.faq.FaqDAO;
import spring.model.faq.FaqDTO;
import spring.model.notice.NoticeDTO;
import spring.utility.gobook.Utility;

	 
/**
 * Handles requests for the application home page.
 */
@Controller
public class FaqController {
	
	@Autowired
	private FaqDAO dao;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/faq/list")
	public String list(Locale locale, Model model, HttpServletRequest request) {
		
		//검색관련
	    String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total"))word="";
		
		//페이징 관련
		int nowPage = 1;	
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage")!=null&&request.getParameter("nowPage")!="")
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		int sno = ((nowPage-1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col",col);
		map.put("word",word);
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
		return "/faq/list";
	}
	
	@RequestMapping(value = "/faq/create", method = RequestMethod.GET)
	public String create(Locale locale, Model model) {
		return "/faq/create";
	}
	
	@RequestMapping(value = "/faq/create", method = RequestMethod.POST)
	public String create(FaqDTO dto, Model model) {
		try {
			if(dao.create(dto)) {
				return "redirect:/faq/list";
			}else {
			return "error";}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}
	
	@RequestMapping("/faq/read")
	public String read(Locale locale, Model model,int faq_num) throws Exception {
		FaqDTO dto = (FaqDTO) dao.read(faq_num);
		String title = dto.getFaq_title();
		String content = dto.getFaq_content();
		String category = dto.getFaq_category();
		
		model.addAttribute("dto",dto);
		model.addAttribute("title",title);
		model.addAttribute("content",content);
		model.addAttribute("category",category);
		
		
		return "/faq/read";
	}
	
	@RequestMapping(value = "/faq/read1", method= RequestMethod.GET)
	public String read1(Locale locale, Model model) {
		return "/faq/read1";
	}
	
	@RequestMapping(value = "/faq/update", method = RequestMethod.POST)
	public String update(FaqDTO dto,Locale locale, Model model,HttpServletRequest request) throws Exception {
		
		if(dao.update(dto)) {
			
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			
		return "redirect:/faq/list";
		}
		
		return "error";
	}
	
	
	@RequestMapping(value = "/faq/update", method = RequestMethod.GET)
	public String update(int faq_num,Locale locale, Model model,HttpServletRequest request) throws Exception {
		
		model.addAttribute("dto",dao.read(faq_num));
		model.addAttribute("col",request.getParameter("col"));
		model.addAttribute("word",request.getParameter("word"));
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		
		
		return "/faq/update";
	}
	
	@RequestMapping(value = "/faq/delete", method = RequestMethod.POST)
	public String delete(int faq_num,Locale locale, Model model,HttpServletRequest request) throws Exception {
		
		if(dao.delete(faq_num)) {
			
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			
			return "redirect:/faq/list";
		}
		return "error";
	}
	

	@RequestMapping(value = "/faq/delete", method = RequestMethod.GET)
	public String delete(Locale locale, Model model) {
		return "/faq/delete";
	}
}
