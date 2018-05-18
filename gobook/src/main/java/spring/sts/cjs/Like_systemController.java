package spring.sts.cjs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.like_system.Like_systemDAO;
import spring.model.like_system.Like_systemDTO;
import spring.utility.gobook.Utility;

@Controller
public class Like_systemController {
		
	@Autowired
	private Like_systemDAO dao;
	
	@RequestMapping("/like_system/list")
	public String list(HttpServletRequest request) throws Throwable{
		//검색관련------------------------------------------
	    String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) word="";
 
		//paging 관련
		int nowPage = 1;//현재 보고있는 페이지
		if(request.getParameter("nowPage")!=null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
		
		int sno = ((nowPage-1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		//----------------------------------------------------
		
		Map map = new HashMap();
		map.put("col",col);
		map.put("word",word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<Like_systemDTO> list = dao.list(map);
		
		//전체 레코드 갯수 가져오기
		int totalRecord = dao.total(map);
 
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);

		return "/review/list";
	}
	
}
