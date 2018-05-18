package spring.sts.ltj;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.service_image.Service_imageDAO;
import spring.model.service_image.Service_imageDTO;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Service_imageController {
	
	private static final Logger logger = LoggerFactory.getLogger(Service_imageController.class);
	
	@Autowired
	 private Service_imageDAO dao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value ="/service_image", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/home";
	}

 	@RequestMapping(value="/service_image/create",method=RequestMethod.GET)
 	 public String service_image() {
 	 	return "/service_image/create";
     	}
 	
 	@RequestMapping(value="/service_image/create",method=RequestMethod.POST)
	 public String service_image(Service_imageDTO dto,HttpServletRequest request) {
 		
 		String upDir = request.getRealPath("/storage_s");
	     String simg_filename  = Utility.saveFileSpring30(dto.getFilenameMF(), upDir);
	
	   int simg_filesize = (int) dto.getFilenameMF().getSize();
	
		
		dto.setSimg_filename(simg_filename);
		dto.setSimg_filesize(simg_filesize);
		
		boolean flag = dao.create(dto);
		
		System.out.println(flag);
		if(flag) {
			 return "redirect/service/list";
		}else {
		     return "service_image/error";
		}
	
	 
    	}


}
