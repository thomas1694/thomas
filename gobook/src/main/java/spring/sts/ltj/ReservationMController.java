package spring.sts.ltj;

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


import spring.model.reservation.ReservationDAO;
import spring.model.reservation.ReservationDTO;
import spring.model.reservation.ReservationMDTO;
import spring.model.service.ServiceDAO;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReservationMController {

	@Autowired
	private ReservationDAO dao;



	@RequestMapping(value = "/reservationM/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String uri = request.getHeader("REFERER");
		String id=(String) request.getSession().getAttribute("id");
		String grade=(String) request.getSession().getAttribute("grade");
		if(id==null||grade==null)return "redirect:"+uri;
		int nowPage = 1; // 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		System.out.println(nowPage);

		int recordPerPage = 5; // 한페이지당 보여줄 레코드 갯수
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String idcheck="";
		String idcheckword="";
		if(grade.equals("C")) {
			idcheck="c_id";
			idcheckword=id;
		}
		if(grade.equals("S")) {
			idcheck="s_id";
			idcheckword=id;
		}
		if (col.equals("total"))
			word = "";

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		// -----------------------------------------------------

		Map map = new HashMap();
		map.put("idcheck", idcheck);
		map.put("idcheckword", idcheckword);
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		System.out.println("idcheck:"+idcheck);
		System.out.println("idcheckw:"+idcheckword);
		System.out.println("c:"+col);
		System.out.println("w:"+word);
		List<ReservationMDTO> list = dao.mlist(map);

		int total = dao.total(map);
		if(total==0)total=1;
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		return "/reservationM/list";
	}

	@RequestMapping("/reservationM/read")
	public String read(HttpServletRequest request,ReservationMDTO dto) throws Exception {
		
       String res_code = request.getParameter("res_code");
       
		dto = (ReservationMDTO) dao.mread(res_code);

		request.setAttribute("res_code", res_code);
		request.setAttribute("dto", dto);
		
		System.out.println(dto);
		
		return "/reservationM/read";
	}
	
	@RequestMapping(value = "/reservationM/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request,ReservationMDTO dto,String res_code) throws Exception {
		  
		dto = (ReservationMDTO) dao.mread(res_code);
		
		request.setAttribute("dto", dto);
		
		return "/reservationM/update";
	}

	@RequestMapping(value = "/reservationM/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request,ReservationDTO dto,Model model) throws Exception {
		
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		String nowPage = request.getParameter("nowPage");
		

		boolean flag = dao.update(dto);
		System.out.println(flag);
		if(flag) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			
			  return "redirect:/reservationM/list";
		}else {
			return "/reservation/error";
		
	}
	}

	  @RequestMapping(value="/reservationM/delete",method=RequestMethod.GET)
	    public String delete(HttpServletRequest request,String res_code, String col, String word,
	    		String nowPage) {

		     request.setAttribute("col", col);
		     request.setAttribute("word", word);
		     request.setAttribute("nowPage", nowPage);
		     
	    	return "/reservationM/delete";
	    }
	    
	    @RequestMapping(value="/reservationM/delete",method=RequestMethod.POST)
	    public String delete(String res_code,Model model,HttpServletRequest request, String passwd, String oldfile) throws Exception {

			System.out.println(res_code);
			boolean flag = dao.mdelete(res_code);
			
			System.out.println(flag);
			if(flag) {
		
					 model.addAttribute("col",request.getParameter("col"));
					 model.addAttribute("word",request.getParameter("word"));
					 model.addAttribute("nowPage",request.getParameter("nowPage"));
					return "redirect:/reservationM/list";


			}else {
				
				return "/reservationM/error";
				
			}
	    }
	    

}
