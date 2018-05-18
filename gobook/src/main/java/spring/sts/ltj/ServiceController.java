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
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import spring.model.service_image.*;
import spring.model.service.ServiceDAO;
import spring.model.service.ServiceDTO;
import spring.model.service.ServiceDTO2;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ServiceController {

	@Autowired
	private ServiceDAO dao;

	@Autowired
	private Service_imageDAO dao1;

	private static final Logger logger = LoggerFactory.getLogger(ServiceController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/service", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/home";
	}

	@RequestMapping(value = "/service/create", method = RequestMethod.GET)
	public String create() {
		return "/service/create";
	}

	@RequestMapping(value = "/service/create", method = RequestMethod.POST)
	public String create(ServiceDTO dto, Service_imageDTO dto1, HttpServletRequest request) throws Exception {
		
		boolean flag = dao.create(dto);

		if (flag) {
			
			 int sv_num = (Integer) dao.finalnum();
			 dto1.setSv_num(sv_num);
			  
			
			String upDir = request.getRealPath("/storage/ltj/image");
			String simg_filename = Utility.saveFileSpring30(dto1.getFilenameMF(), upDir);

			int simg_filesize = (int) dto1.getFilenameMF().getSize();
			

			dto1.setSimg_filename(simg_filename);
			dto1.setSimg_filesize(simg_filesize);

			boolean pflag = dao1.create(dto1);
			if (pflag) {
				return "redirect:/service/list";
			} else {
				return "/service/error";
			}
		} else {
			return "/service/error";
		}

	}

	@RequestMapping(value = "/service/Dcreate", method = RequestMethod.GET)
	public String Dcreate(ServiceDTO dto,HttpServletRequest request) throws Exception {
		   int sv_num = Integer.parseInt(request.getParameter("sv_num"));

		  dto = (ServiceDTO) dao.DCread(sv_num);
		  
		  request.setAttribute("dto", dto);
		    
		return "/service/Dcreate";
	}

	@RequestMapping(value = "/service/Dcreate", method = RequestMethod.POST)
	public String Dcreate(ServiceDTO dto, Service_imageDTO dto1,HttpServletRequest request) throws Exception {

		int sv_num1 = Integer.parseInt(request.getParameter("sv_num"));
		
	     dto.setSv_num_upper(sv_num1);
	     
		boolean flag = dao.Dcreate(dto);

		if (flag) {
			
			int sv_num = (Integer) dao.finalnum();
			 dto1.setSv_num(sv_num);
	
			String upDir = request.getRealPath("/storage/ltj/image");
			String simg_filename = Utility.saveFileSpring30(dto1.getFilenameMF(), upDir);

			int simg_filesize = (int) dto1.getFilenameMF().getSize();

			dto1.setSimg_filename(simg_filename);
			dto1.setSimg_filesize(simg_filesize);

			boolean pflag = dao1.create(dto1);
			if (pflag) {
				
				return "redirect:/service/list";
			} else {
				return "/service/error";
			}
		} else {
			return "/service/error";
		}

	}
	

	@RequestMapping("/service/list")
	public String list(HttpServletRequest request) throws Exception {

		List<ServiceDTO> list = dao.list();

		request.setAttribute("list", list);

		return "/service/list";
	}
	
	@RequestMapping(value = "/service/read")
	public String read(HttpServletRequest request, ServiceDTO dto, Model model) throws Exception {

		int sv_num = Integer.parseInt(request.getParameter("sv_num").trim());

		dto = (ServiceDTO) dao.read(sv_num);
		

		model.addAttribute("dto", dto);
		model.addAttribute("sv_num", sv_num);

		return "/service/read";
	}
	

	@RequestMapping(value = "/service/Dread")
	public String Dread(HttpServletRequest request, ServiceDTO dto, Model model) throws Exception {

		int sv_num = Integer.parseInt(request.getParameter("sv_num").trim());

		dto = (ServiceDTO) dao.Dread(sv_num);
		

		model.addAttribute("dto", dto);
		model.addAttribute("sv_num", sv_num);

		return "/service/Dread";
	}

	@RequestMapping(value = "/service/update", method = RequestMethod.GET)
	public String updateG(HttpServletRequest request, ServiceDTO dto, Model model) throws Exception {
		int sv_num = Integer.parseInt(request.getParameter("sv_num").trim());

		dto = (ServiceDTO) dao.Dread(sv_num);

		model.addAttribute("dto", dto);

		return "/service/update";
	}

	@RequestMapping(value = "/service/update", method = RequestMethod.POST)
	public String updateP(HttpServletRequest request, ServiceDTO dto, Model model) throws Exception {

		boolean flag = dao.update(dto);
		if (flag) {

			return "redirect:/service/list";
		} else {
			return "/service/error";

		}
	}

	@RequestMapping(value = "/service/updatefile", method = RequestMethod.GET)
	public String updatefile() throws Exception {
         
		return "/service/updatefile";
	}

	@RequestMapping(value = "/service/updatefile", method = RequestMethod.POST)
	public String updatefile(int sv_num, HttpServletRequest request, Service_imageDTO dto, Model model, String oldfile)
			throws Exception {
		System.out.println(sv_num);

		String upDir = request.getRealPath("/storage/ltj/image");
          
		if (oldfile != null)
			Utility.deleteFile(upDir, oldfile);

		String simg_filename = Utility.saveFileSpring30(dto.getFilenameMF(), upDir);
	

		Map map = new HashMap();
		map.put("sv_num", sv_num);
		map.put("simg_filename", simg_filename);

		boolean flag = dao1.updatefile(map);
		
		if (flag) {
			model.addAttribute("sv_num", sv_num);

			return "redirect:/service/Dread";
		} else {
			return "/service/error";
		}
	}

	  @RequestMapping(value="/service/delete",method=RequestMethod.GET)
	    public String delete(HttpServletRequest request) {

		    int sv_num = Integer.parseInt(request.getParameter("sv_num"));
		    String simg_filename = dao1.getFilename(sv_num);
			
			request.setAttribute("sv_num", sv_num);
			request.setAttribute("simg_filename", simg_filename);
			
	    	return "/reservationM/delete";
	    }
	    
	    @RequestMapping(value="/service/delete",method=RequestMethod.POST)
	    public String delete(int sv_num,Model model,HttpServletRequest request, String passwd, String oldfile) throws Exception {

	    	 oldfile = request.getParameter("simg_filename");
    		 String upDir = request.getRealPath("/storage_m");


    		boolean flag = dao.delete(sv_num);
    		System.out.println(flag);
    		
    	
				if(flag) {
					
					Utility.deleteFile(upDir, oldfile);
					return "redirect:/list";
				}else {
					return "error";
				}
	    }
	    

}
