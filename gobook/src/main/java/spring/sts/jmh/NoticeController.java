package spring.sts.jmh;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.notice.NoticeDAO;
import spring.model.notice.NoticeDTO;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO dao;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request, Model model) {
		
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
			System.out.println(total);
			System.out.println(nowPage);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			request.setAttribute("col", col);
			request.setAttribute("word", word);
			request.setAttribute("nowPage", nowPage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/notice/list";
	}
	
	@RequestMapping(value = "/notice/create", method = RequestMethod.POST)
	public String create(NoticeDTO dto, Model model) throws Exception {
		
		if(dao.create(dto)) {
				return "redirect:/notice/list";
		}else {
				return "error";
		}
		
	}
	
	@RequestMapping(value = "/notice/create", method = RequestMethod.GET)
	public String create(Locale locale, Model model) {
		return "/notice/create";
	}
	
	@RequestMapping("/notice/read")
	public String read(int n_num , Model model) throws Exception {
		
		NoticeDTO dto = (NoticeDTO) dao.read(n_num);
		String title = dto.getN_title();
		String content = dto.getN_content();
		
		model.addAttribute("dto",dto);
		model.addAttribute("title",title);
		model.addAttribute("content",content);
		
		return "/notice/read";
	}
	
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String update(NoticeDTO dto, Model model, HttpServletRequest request) throws Exception {
		
		if(dao.update(dto)) {
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			return "redirect:/notice/list";
		}
		
		return "error";
	}
	
	
	
	@RequestMapping(value = "/notice/update", method = RequestMethod.GET)
	public String update(int n_num, Locale locale, Model model,HttpServletRequest request) throws Exception {
		
		model.addAttribute("dto",dao.read(n_num));
		model.addAttribute("col",request.getParameter("col"));
		model.addAttribute("word",request.getParameter("word"));
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		
		return "/notice/update";
	}
	
	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public String delete(Model model, int n_num, HttpServletRequest request) throws Exception {
		
		
		if(dao.delete(n_num)){
			
		
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			return "redirect:/notice/list";
		}	
			return "error";

	}
	
	
	@RequestMapping(value = "/notice/delete", method = RequestMethod.GET)
	public String delete(Locale locale, Model model) {
		return "/notice/delete";
	}
}
