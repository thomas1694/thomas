package spring.sts.ltj;

import java.lang.ProcessBuilder.Redirect;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import spring.model.service.ServiceDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReservationController {
	
	@Autowired
	private ReservationDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value ="/reservation", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();	
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/home";	
	}
	
	
	@RequestMapping(value="/reservation/reservation",method=RequestMethod.GET)
  	public String service(HttpServletRequest request) throws Exception {
		
		List<ServiceDTO> list = dao.list();
		
		 String title1 = list.get(0).getSv_title();
		 String title2 = list.get(1).getSv_title();
		 String title3 = list.get(2).getSv_title();
		 
		 int sv_num_upper = list.get(0).getSv_num_upper();
		 int sv_num_upper1 = list.get(1).getSv_num_upper();
		 int sv_num_upper2 = list.get(2).getSv_num_upper();
		 
		 int sv_num = list.get(0).getSv_num();
		 int sv_num1 = list.get(1).getSv_num();
		 int sv_num2 = list.get(2).getSv_num();
	
		 
		 request.setAttribute("title1", title1);
		 request.setAttribute("title2", title2);
		 request.setAttribute("title3", title3);
		 request.setAttribute("sv_num_upper", sv_num_upper);
		 request.setAttribute("sv_num_upper1", sv_num_upper1);
		 request.setAttribute("sv_num_upper2", sv_num_upper2);
		 request.setAttribute("sv_num", sv_num);
		 request.setAttribute("sv_num1", sv_num1);
		 request.setAttribute("sv_num2", sv_num2);

			
 		return "/reservation/reservation";
  	}
	

	
	@RequestMapping(value="/reservation/reservation2",method=RequestMethod.GET)
  	public String service2(HttpServletRequest request, int sv_num, int sv_num_upper) throws Exception {
		
		List<ServiceDTO> list = dao.Dlist(sv_num_upper);
		
		request.setAttribute("list", list);
//		request.setAttribute("sv_num", sv_num);
//		request.setAttribute("sv_upper_num", sv_num_upper);
		
  		return "/reservation/reservation2";
  	}
	
	@RequestMapping(value="/reservation/reservation3",method=RequestMethod.GET)
  	public String service3() throws Exception {
			
		return "/reservation/reservation3";
		
  	}
	
	@RequestMapping(value="/reservation/reservation3",method=RequestMethod.POST)
  	public String service3(ReservationDTO dto,HttpServletRequest request) throws Exception {
			
		System.out.println(request.getParameter("sv_num"));
		dto.setSv_num(request.getParameter("sv_num"));
		boolean flag = dao.create(dto);
		System.out.println(flag);
		if(flag) {
			 return "redirect:/reservation";
		}else {
			return "/reservation/error";
		}
		
  	}
	
}
