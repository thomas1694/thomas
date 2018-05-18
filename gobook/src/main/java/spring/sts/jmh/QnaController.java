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

import spring.model.qna.QnaDAO;
import spring.model.qna.QnaDTO;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QnaController {
	
	@Autowired
	private QnaDAO dao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 * 
	 */

	
	@RequestMapping(value="/qna/reply",method=RequestMethod.POST)
	public String reply(QnaDTO dto,HttpServletRequest request,Model model) throws Exception {
	
		Map map = new HashMap();
		map.put("q_grpno", dto.getQ_grpno());
		map.put("q_ansnum", dto.getQ_ansnum());
		dao.upAnsnum(map);
		if(dao.createReply(dto)) {
			
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			return "redirect:/qna/list";
		}else {
			return "error";
		}
		
	}
	@RequestMapping(value="/qna/reply",method=RequestMethod.GET)
	public String reply(int q_num,Model model) throws Exception {
		
		model.addAttribute("dto", dao.readReply(q_num));
		
		return "/qna/reply";
	}
	
	
	@RequestMapping("/qna/list")
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
		
		List<QnaDTO> list;
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
		
		return "/qna/list";
	}
		

	@RequestMapping(value = "/qna/create", method = RequestMethod.POST)
	public String create(QnaDTO dto , Model model) throws Exception {
		System.out.println(dto.getQ_title());
		if(dao.create(dto)) {
			return "redirect:/qna/list";
	}else {
			return "error";
	}
	}
	
	
	@RequestMapping(value = "/qna/create", method = RequestMethod.GET)
	public String create(Locale locale, Model model) {
		return "/qna/create";
	}
	
	@RequestMapping("/qna/read")
	public String read(int q_num, Model model) throws Exception {
		
		QnaDTO dto = (QnaDTO) dao.read(q_num);
		String title = dto.getQ_title();
		String content = dto.getQ_content();
		
		model.addAttribute("dto",dto);
		model.addAttribute("title",title);
		model.addAttribute("content",content);
		
		return "/qna/read";
	}
	
	
	@RequestMapping(value = "/qna/update", method = RequestMethod.POST)
	public String update(Model model,int q_num,QnaDTO dto,HttpServletRequest request) throws Exception {
	
		if(dao.update(dto)) {
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			
			return "redirect:/qna/list";
		}
		return "error";
	}
	
	@RequestMapping(value = "/qna/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model,int q_num) throws Exception {
		
		model.addAttribute("dto",dao.read(q_num));
		model.addAttribute("col",request.getParameter("col"));
		model.addAttribute("word",request.getParameter("word"));
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		
		
		return "/qna/update";
	}
	
	@RequestMapping(value = "/qna/delete", method = RequestMethod.POST)
	public String delete(Locale locale, Model model, int q_num, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		map.put("q_num", q_num);
		
		if(dao.delete(q_num)){
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
		
			return "redirect:/qna/list";
		}
		return "error";
	}
		
	@RequestMapping(value = "/qna/delete", method = RequestMethod.GET)
	public String delete(Locale locale, Model model, int q_num) {
		
		boolean flag = dao.checkRefnum(q_num);
		
		model.addAttribute("flag", flag);
		
		
		return "/qna/delete";
	}
}
