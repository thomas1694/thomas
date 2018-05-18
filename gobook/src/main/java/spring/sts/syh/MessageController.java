package spring.sts.syh;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.message.MessageDAO;
import spring.model.message.MessageDTO;
import spring.utility.gobook.Utility;

@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO dao;
	
	@RequestMapping("/message/read")
	public @ResponseBody Object read(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		MessageDTO dto = dao.read(num);
		dto.setM_content(dto.getM_content().replaceAll("\n", "<br>"));
		
		Map map = new HashMap<>();
		map.put("col", request.getParameter("col"));
		map.put("word", request.getParameter("word"));
		map.put("nowPage", request.getParameter("nowPage"));
		
		List alist = new ArrayList<>();
		alist.add(dto);
		alist.add(map);
		
		return alist;
	}
	
	@RequestMapping("/message/list")
	public @ResponseBody Object list(HttpServletRequest request) {
		
		String id = (String) request.getSession().getAttribute("id");
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		int nowPage = 1;
		if (request.getParameter("nowPage") != ""&&request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));			
		}

		int recordPerPage = 5;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("id", id);
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<MessageDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			MessageDTO dto = list.get(i);
			dto.setM_content(dto.getM_content().replaceAll("\n", "<br>"));
			list.set(i, dto); 
		}

		int totalRecord = dao.total(map);
		String paging = Utility.messagelistpaging(totalRecord, nowPage, recordPerPage, col, word, id);
		
		//기존에 list view 페이지로 이동할 때 가져가던 것들 : col&word(검색어유지), nowPage(페이지유지), paging(페이지박스)
		//Map을 재활용하여 가져가는데, Array에 담아서 가져간다. -> alist[0]: DTO 정보들 / alist[1]: 페이지관련 정보들.
		
		
		map.remove("id");
		map.remove("sno");
		map.remove("eno");
		map.put("nowPage", nowPage);
		map.put("paging", paging);
		
		List alist = new ArrayList<>();
		alist.add(list);
		alist.add(map);
		
		return alist;
	}
	
	@RequestMapping("/message/sendlist")
	public @ResponseBody Object sendlist(HttpServletRequest request) {
		
		
		String id = (String) request.getSession().getAttribute("id");
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		

		if (col.equals("total"))
			word = "";
		
		int nowPage = 1;
		if (request.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));			
		}
		
		int recordPerPage = 5;
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<MessageDTO> list = dao.sendlist(map);
		
		for(int i=0; i<list.size(); i++) {
			MessageDTO dto = list.get(i);
			dto.setM_content(dto.getM_content().replaceAll("\n", "<br>"));
			list.set(i, dto); 
		}
		
		int totalRecord = dao.sendtotal(map);
		String paging = Utility.messagesendlistpaging(totalRecord, nowPage, recordPerPage, col, word, id);
		
		//기존에 list view 페이지로 이동할 때 가져가던 것들 : col&word(검색어유지), nowPage(페이지유지), paging(페이지박스)
		//Map을 재활용하여 가져가는데, Array에 담아서 가져간다. -> alist[0]: DTO 정보들 / alist[1]: 페이지관련 정보들.
		
		
		map.remove("id");
		map.remove("sno");
		map.remove("eno");
		map.put("nowPage", nowPage);
		map.put("paging", paging);
		
		List alist = new ArrayList<>();
		alist.add(list);
		alist.add(map);
		
		return alist;
	}
	
	@RequestMapping("/message/create")
	public @ResponseBody Object create(HttpServletRequest request) {
		String sid = (String) request.getSession().getAttribute("id");
		String rid = request.getParameter("rid");
		String content = request.getParameter("content");
		
		MessageDTO dto = new MessageDTO();
		dto.setM_sendid(sid);
		dto.setM_receiveid(rid);
		dto.setM_content(content);
		
		boolean flag = dao.create(dto);
		
		Map map = new HashMap<>();
		map.put("flag", flag);
		
		return map;
	}
	
	@RequestMapping("/message/delete")
	public @ResponseBody Object delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		String id = (String) request.getSession().getAttribute("id");
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		Map totalmap = new HashMap<>();
		totalmap.put("id", id);
		totalmap.put("col", col);
		totalmap.put("word", word);
		
		boolean sendidflag = false; 
		if(id.equals(dao.read(num).getM_sendid())) sendidflag = true; //받은함인지 보낸함인지 id로 구별
		
		boolean flag = dao.delete(num);		
		
		int total = 0;
		if(sendidflag) { 
			total = dao.sendtotal(totalmap);
		} else {
			total = dao.total(totalmap);
		}
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		if(total%5==0) nowPage--; //삭제된 시점에서 레코드 개수로 나누어 떨어지면 -1
		
		Map map = new HashMap<>();
		map.put("flag", flag);
		map.put("sendidflag", sendidflag);
		map.put("nowPage", nowPage);
		
		return map;
	}
	
	@RequestMapping("/message/upreadcheck")
	public void upreadcheck(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.upreadcheck(num);
	}
	
	@RequestMapping("/message/readchecktotal")
	public @ResponseBody Object readchecktotal(HttpServletRequest request) {
		String id=(String) request.getSession().getAttribute("id");
		System.out.println(id);
		int rctotal = dao.readchecktotal(id);
		
		Map map = new HashMap<>();
		map.put("readchecktotal", rctotal);
		
		return map;
	}
	
	@RequestMapping("/top")
	public String top(HttpServletRequest request) {
		return "top/top";
	}
	
	
	
	
}
