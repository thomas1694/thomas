package spring.sts.cjs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.like_system.Like_systemDAO;
import spring.model.like_system.Like_systemDTO;
import spring.model.review.ReviewDAO;
import spring.model.review.ReviewDTO;
import spring.model.s_member.S_MemberDAO;
import spring.model.s_member.S_MemberDTO;
import spring.utility.gobook.Utility;

@Controller
public class ReviewController {
		
	@Autowired
	private ReviewDAO dao;
	
	@Autowired
	private S_MemberDAO sdao;
	
	@Autowired
	private Like_systemDAO ldao;
	
	@RequestMapping("/{id}/review/read")
	public String read(Model model,HttpServletRequest request,@PathVariable String id) throws Exception {
		
		S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
		request.setAttribute("sdto", sdto);
		
		int re_num = Integer.parseInt(request.getParameter("re_num"));
		dao.re_count(re_num);
		ReviewDTO dto = (ReviewDTO) dao.read(re_num);
		String re_content = dto.getRe_content();
		re_content = re_content.replaceAll("\r\n", "<br>");
		
		model.addAttribute("dto", dto);
		model.addAttribute("re_content", re_content);
	
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
		
		
		return "/review/read";
	}
	@RequestMapping("/review/read")
	public String aread(Model model,HttpServletRequest request,String id) throws Exception {
		
		S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
		request.setAttribute("sdto", sdto);
		
		int re_num = Integer.parseInt(request.getParameter("re_num"));
		dao.re_count(re_num);
		ReviewDTO dto = (ReviewDTO) dao.read(re_num);
		String re_content = dto.getRe_content();
		re_content = re_content.replaceAll("\r\n", "<br>");
		
		model.addAttribute("dto", dto);
		model.addAttribute("re_content", re_content);
	
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
		
		
		return "/review/aread";
	}
	
	
	
	@RequestMapping(value = "/{id}/review/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request,Model model,@PathVariable String id) throws Exception {
		
		String basePath = request.getRealPath("/storage/review/img");
		int re_num = Integer.parseInt(request.getParameter("re_num"));
		String oldfile = request.getParameter("oldfile");
		
		
		boolean flag = false;
		flag=dao.delete(re_num);
		if(flag){
			
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			Utility.deleteFile(basePath, oldfile);
			
			return "redirect:/"+id+"/review/list";
		}else {
			return "/error/error";
		}
		
	}
	
	@RequestMapping(value = "/{id}/review/delete", method =RequestMethod.GET)
	public String delete(@PathVariable String id) {
		
		return "/review/delete";
	}

	@RequestMapping(value="/{id}/review/update", method = RequestMethod.POST)
	public String update(ReviewDTO dto,Model model,HttpServletRequest request,@PathVariable String id) throws Exception {
		
		if(dao.update(dto)) {
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			return "redirect:/"+id+"/review/list";
		}else {
			return "error";
		}
	}
	
	
	@RequestMapping(value="/{id}/review/update",method=RequestMethod.GET)
	public String update(int re_num, Model model,@PathVariable String id) throws  Exception{
		
	model.addAttribute("dto", dao.read(re_num));
	
		return "/review/update";
		
	}
	
	
	@RequestMapping("/{id}/review/list")
	public String list(HttpServletRequest request,@PathVariable String id) throws Exception{
		
		S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
		request.setAttribute("sdto", sdto);
		
		
		//검색관련------------------------------------------
	    String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) word="";
		
		int nowPage = 1;//현재 보고있는 페이지
		int recordPerPage = 6; //한페이지당 보여줄 레코드 갯수
 
		//paging 관련
		if(request.getParameter("nowPage")!=null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		
		int sno = ((nowPage-1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		//----------------------------------------------------
		
		Map map = new HashMap();
		map.put("col",col);
		map.put("word",word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("id", id);
		List<ReviewDTO> list = dao.list(map);
		
		//전체 레코드 갯수 가져오기
		int totalRecord = dao.total(map);
 
		String paging = Utility.paging(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);

		return "/review/list";
	}
	
	@RequestMapping(value="/{id}/review/create",method=RequestMethod.GET)
	public String create(HttpServletRequest request,@PathVariable String id) throws Exception {
		S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
		request.setAttribute("sdto", sdto);
		return "/review/create";
	}
	@RequestMapping(value="/{id}/review/create",method=RequestMethod.POST)
	public String create(ReviewDTO dto,HttpServletRequest request, @PathVariable String id) throws Exception {
		
		String basePath = request.getRealPath("/storage/review/img");
		String filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		int filesize = (int)dto.getFilenameMF().getSize();
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		dto.setS_id(id);
		System.out.println(dto.getS_id());
		System.out.println(dto.getC_id());
		if(dao.create(dto)) {
			return "redirect:/"+id+"/review/list";
		}else {
			return "/review/error";
		}
 
	}

	@RequestMapping(value="/{id}/review/re_like", method=RequestMethod.POST)
	public @ResponseBody Object uplike(HttpServletRequest request,int num, @PathVariable String id) throws Exception {
		String sid=(String)request.getSession().getAttribute("id");
		Like_systemDTO dto=new Like_systemDTO();
		dto.setRe_num(num);
		dto.setVoteid(sid);
		Map map=new HashMap<>();
		boolean cflag=ldao.count_like(dto);
		if(cflag) {
			map.put("cflag", false);
			return  map;
			}else {
		ldao.create(dto);
		dao.re_like(num);
			map.put("cflag", true);
			return map;
			}
		
	}
	
	@RequestMapping("/review/list")
	public String alist(HttpServletRequest request) throws Exception{
		
		
		
		//검색관련------------------------------------------
	    String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) word="";
		
		int nowPage = 1;//현재 보고있는 페이지
		int recordPerPage = 6; //한페이지당 보여줄 레코드 갯수
 
		//paging 관련
		if(request.getParameter("nowPage")!=null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		
		int sno = ((nowPage-1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		//----------------------------------------------------
		
		Map map = new HashMap();
		map.put("col",col);
		map.put("word",word);
		map.put("sno", sno);
		map.put("eno", eno);
		List<ReviewDTO> list = dao.alist(map);
		
		//전체 레코드 갯수 가져오기
		int totalRecord = dao.atotal(map);
 
		String paging = Utility.paging(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);

		return "/review/alist";
	}
	
	
	}
	

