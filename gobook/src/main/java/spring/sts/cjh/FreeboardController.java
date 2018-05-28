package spring.sts.cjh;

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

import spring.model.freeboard.FreeboardDAO;
import spring.model.freeboard.FreeboardDTO;
import spring.model.freeboard.FreeboardService;
import spring.model.freeboard_reply.Freeboard_replyDAO;
import spring.model.freeboard_reply.Freeboard_replyDTO;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FreeboardController {
	
	
	@Autowired
	private FreeboardDAO dao;
	
	@Autowired
	private Freeboard_replyDAO rdao;
	
	@RequestMapping("/freeboard/rupdate")
	public String rupdate(Freeboard_replyDTO dto, Model model, String nowPage, 
			String col, String word, String nPage,HttpServletRequest request) {
		Freeboard_replyDTO cdto=rdao.read(dto.getFr_num());
		if(cdto.getId().equals(dto.getId())||request.getAttribute("grade").equals("A")){
			if(rdao.update(dto)) {
				model.addAttribute("f_num", dto.getF_num());
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nPage", nPage);
			
				return "redirect:/freeboard/read";
			}else {
				return "/freeboard/error";
			}
		}else{
			String error="댓글 수정 권한이 없습니다";
			request.setAttribute("error", error);
			return "/error";
		}
}
	

	@RequestMapping("/freeboard/rcreate")
	public String rcreate(Freeboard_replyDTO dto,Model model, int nowPage, 
			String col, String word ) {
		
		if(rdao.create(dto)) {
			model.addAttribute("f_num", dto.getF_num());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:/freeboard/read";
		
		
		}else {
			
			return "/freeboard/error";
		}
		
	}
	
	
	
	@RequestMapping("/freeboard/rdelete")
	public String rdelete(int fr_num, int f_num, String nowPage,
			int nPage, String col, String word, Model model,HttpServletRequest request) {
		Freeboard_replyDTO rdto=rdao.read(fr_num);
		String grade=(String) request.getSession().getAttribute("grade");
		if(grade==null)grade="error";
		if(rdto.getId().equals(request.getSession().getAttribute("id"))||grade.equals("A")) {
		int total = rdao.total(f_num);
		int totalPage = (int)(Math.ceil((double)total/3));
		
		if(rdao.delete(fr_num)) {
			if(nPage!=1&&nPage==totalPage&&total%3==1) nPage = nPage-1;
			
			model.addAttribute("f_num", f_num);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nPage", nPage);
			
			return "redirect:/freeboard/read";
			
		}else {
			return "/freeboard/error/";
		}
		}else {
			String error="댓글 삭제 권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	@RequestMapping(value = "/freeboard/list")
	public String list(Locale locale, Model model,HttpServletRequest request) throws Exception {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";
		// 검색관련end----------------------------

		// paging관련
		int nowPage = 1;// 현재 보이는 페이지
		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		int recordPerPage = 5; // 한페이지당 보여줄 레코드 개수

		int sno = ((nowPage - 1) * recordPerPage) + 1; // 시작 페이지
		int eno = nowPage * recordPerPage; // 어디부터 어디까지 보여주겠다 =끝페이지

		// -----------------------------------------------
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<FreeboardDTO> list = dao.list(map);

		// 전체 레코드 개수 가져오기
		int total = dao.total(map);
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("rdao", rdao);

		return "/freeboard/list";
	}
	@RequestMapping(value = "/freeboard/create", method = RequestMethod.GET)
	public String create(HttpServletRequest request,Model model) {
		if(request.getSession().getAttribute("id")!=null) {
		return "/freeboard/create";
		}else {
			String error="자유게시판 글은 회원만 작성가능합니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	
	@RequestMapping(value = "/freeboard/create", method = RequestMethod.POST)
	public String create(FreeboardDTO dto, HttpServletRequest request) throws Exception {
		if(request.getSession().getAttribute("id")!=null) {
		String basePath = request.getRealPath("/storage/freeboard/file");
		
		String filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		int filesize = (int) dto.getFilenameMF().getSize();

		dto.setF_filename(filename);
		dto.setF_filesize(filesize);


			if (dao.create(dto)) {
				return "redirect:/freeboard/list";
			} else {
				String error="자유게시판 글 등록 실패";
				request.setAttribute("error", error);
				return "/error";
			}
		
		}else {
			String error="자유게시판 글은 회원만 작성가능합니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	
	
	
	@RequestMapping(value = "/freeboard/delete", method = RequestMethod.GET)
	public String delete(int f_num, Locale locale, Model model) {
		

		boolean flag =dao.checkRefnum(f_num);
	
		model.addAttribute("flag",flag);
		
		
		return "/freeboard/delete";
	}
	
	
	@Autowired
	private FreeboardService mgr;
	
	
	@RequestMapping(value="/freeboard/delete",method=RequestMethod.POST)
	public String delete(HttpServletRequest request,int f_num, String passwd, Model model) {
		
		String oldfile = request.getParameter("oldfile");
		String basePath = request.getRealPath("/storage/freeboard/file");
		
		boolean flag = false;
		
		try {
			mgr.delete(f_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag)Utility.deleteFile(basePath, oldfile);
		
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		return "redirect:/freeboard/list";
		
	}
	
	
	@RequestMapping(value = "/freeboard/read", method = RequestMethod.GET)
	public String read(int nowPage, String col, String word,
			int f_num, Model model, HttpServletRequest request){

		dao.upViewcnt(f_num);
		FreeboardDTO dto = dao.read(f_num);

		String content = dto.getF_content();
		content = content.replaceAll("\r\n", "<br>");

		request.setAttribute("dto", dto);
		request.setAttribute("content", content);
		
		/* 댓글 관련  시작 */
		String url = "read";
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
		nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		 
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("f_num", f_num);
		 
		List<Freeboard_replyDTO> list = rdao.list(map);
		 
		int total = rdao.total(f_num);
		 
		String paging = Utility.paging2(total, nPage, recordPerPage, url,f_num,nowPage, col,word);
		 
		model.addAttribute("rlist",list);
		model.addAttribute("paging",paging);
		model.addAttribute("nPage",nPage);
		 
		/* 댓글 관련 끝 */ 	
				
				
		return "/freeboard/read";
	}
	
	
	@RequestMapping(value = "/freeboard/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model, int f_num) {
		FreeboardDTO dto=dao.read(f_num);
		String id=(String) request.getSession().getAttribute("id");
		String grade=(String) request.getSession().getAttribute("grade");
		if(id==null)id="";
		if(grade==null)grade="";
		if(id.equals(dto.getId())||grade.equals("A")) {
			model.addAttribute("dto", dto);
			return "/freeboard/update";
		}else {
			String error="접근권한이 없습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	
	@RequestMapping(value = "/freeboard/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, Model model, FreeboardDTO dto, String oldfile) {

		String basePath = request.getRealPath("/storage/freeboard/file");
		String filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		
		int filesize = (int) dto.getFilenameMF().getSize();
		dto.setId((String)request.getSession().getAttribute("id"));
		dto.setF_filename(filename);
		dto.setF_filesize(filesize);

		if (dao.update(dto)) {
			if (filesize > 0)
				Utility.deleteFile(basePath, oldfile);
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/freeboard/list";
		} else {
			return "/freeboard/error";
		}
	}
	
	
	@RequestMapping(value="/freeboard/reply", method=RequestMethod.POST)
	public String reply(FreeboardDTO dto,HttpServletRequest request,Model model) {
		if(request.getSession().getAttribute("id")!=null) {
			String basePath =request.getRealPath("/storage/freeboard/file");
			String filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
			int filesize =(int)dto.getFilenameMF().getSize();
			
			dto.setF_filename(filename);
			dto.setF_filesize(filesize);
			
			try {
				
				mgr.reply(dto);
			
				
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				return "redirect:/freeboard/list";
				
			}catch(Exception e) {
				e.printStackTrace();
				return "/error/error";
				}
		}else {
			String error="자유게시판 답변은 회원만 작성가능합니다.";
			request.setAttribute("error", error);
			return "/error";
		}
		
	}

	@RequestMapping(value = "/freeboard/reply", method = RequestMethod.GET)
	public String reply(HttpServletRequest request, Model model,int f_num) {
//		FreeboardDTO dto = dao.read(f_num);
		if(request.getSession().getAttribute("id")!=null) {
		model.addAttribute("dto", dao.readReply(f_num));
		
		return "/freeboard/reply";
		}else {
			String error="자유게시판 답변은 회원만 작성가능합니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	
	
	@RequestMapping(value = "/freeboard_reply/delete", method = RequestMethod.GET)
	public String delete1(Locale locale, Model model) {
		
		return "/freeboard_reply/delete";
	}
	
	
}
