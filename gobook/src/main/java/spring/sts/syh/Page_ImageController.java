package spring.sts.syh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.model.page_image.Page_ImageDAO;
import spring.model.page_image.Page_ImageDTO;
import spring.utility.gobook.Utility;

@Controller
public class Page_ImageController {
	
	@Autowired
	Page_ImageDAO pdao;
	
	@RequestMapping(value = "/Page_Image/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		String grade=(String)request.getSession().getAttribute("grade");
		String id=(String)request.getSession().getAttribute("id");
		if(grade!=null&&id!=null) {
		if(grade.trim().equals("S")) {
		Map map=new HashMap<>();
		map.put("s_id", id);
		try {
			List list=pdao.list(map);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/Page_Image/list";
		}else {
			return "redirect:/";
		}
		}else {
			return "redirect:/member/login";
		}
	}
	
	@RequestMapping(value = "/Page_Image/create", method = RequestMethod.POST)
	public String create(HttpServletRequest request, Page_ImageDTO dto, MultipartFile pg_filenameMF) throws Exception {
		
		String basePath = request.getRealPath("/storage/page_image");
		String pg_filename = Utility.saveFileSpring30(pg_filenameMF, basePath);
		int pg_filesize = (int) pg_filenameMF.getSize();
			
		dto.setPg_filename(pg_filename);
		dto.setPg_filesize(pg_filesize);
		
		boolean flag = pdao.create(dto);
		
		if(flag) {
			return "redirect:/Page_Image/list";			
		} else {
			String error = "페이지 이미지 등록에 실패했습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	@RequestMapping(value = "/Page_Image/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, String oldfile, MultipartFile pg_filenameMF, int pg_num) throws Exception {
		
		String basePath = request.getRealPath("/storage/page_image");
		String pg_filename = Utility.saveFileSpring30(pg_filenameMF, basePath);
		int pg_filesize = (int)pg_filenameMF.getSize();
		
		Page_ImageDTO dto = new Page_ImageDTO();
		dto.setPg_filename(pg_filename);
		dto.setPg_filesize(pg_filesize);
		dto.setPg_num(pg_num);
		
		boolean flag = pdao.update(dto);
		
		if(flag) {
			if(oldfile!=null) Utility.deleteFile(basePath, oldfile);
			return "redirect:/Page_Image/list";
		} else {
			String error = "페이지 이미지 수정에 실패했습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	@RequestMapping(value = "/Page_Image/updateContent", method = RequestMethod.POST)
	public String updateContent(HttpServletRequest request, int pg_num, String pg_content) throws Exception {
				
		Page_ImageDTO dto = new Page_ImageDTO();
		dto.setPg_num(pg_num);
		dto.setPg_content(pg_content);
		
		System.out.println(pg_num);
		System.out.println(pg_content);
		
		boolean flag = pdao.updateContent(dto);
		
		if(flag) {
			return "redirect:/Page_Image/list";			
		} else {
			String error = "페이지 이미지 상세설명 수정에 실패했습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
	
	@RequestMapping(value = "/Page_Image/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, int pg_num, String oldfile) throws Exception {
		boolean flag = pdao.delete(pg_num);
		
		if(flag) {
			String basePath = request.getRealPath("/storage/page_image");
			if(oldfile!=null) Utility.deleteFile(basePath, oldfile);
			return "redirect:/Page_Image/list";			
		} else {
			String error = "페이지 이미지 삭제에 실패했습니다.";
			request.setAttribute("error", error);
			return "/error";
		}
	}
}
