package spring.sts.ltj;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.page_image.Page_ImageDAO;
import spring.model.reservation.ReservationDAO;
import spring.model.reservation.ReservationDTO;
import spring.model.s_member.S_MemberDAO;
import spring.model.s_member.S_MemberDTO;
import spring.model.service.ServiceDAO;
import spring.model.service.ServiceDTO;
import spring.utility.gobook.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReservationController {
	
	@Autowired
	private ReservationDAO dao;
	
	@Autowired
	private S_MemberDAO sdao;
	
	@Autowired
	private Page_ImageDAO pdao;
	
	@Autowired
	private ServiceDAO svdao;
	
	@RequestMapping(value="{id}/resdate", produces = "application/text; charset=utf8")
	@ResponseBody
	public String resdate(@PathVariable String id,String resdate,HttpServletRequest request,int sv_num) throws Exception {
		System.out.println(resdate);
		System.out.println(sv_num);
		List list=svdao.resdate(id);
		int[] svnum = new int[9];
		for(int i=0;i<list.size();i++) {
			svnum[i]=(Integer)list.get(i);
		}
		
		Map map =new HashMap<>();
		map.put("sv_num", svnum[0]);
		map.put("sv_num2", 0);
		map.put("sv_num3", 0);
		map.put("sv_num4", 0);
		map.put("sv_num5", 0);
		map.put("sv_num6", 0);
		map.put("sv_num7", 0);
		map.put("sv_num8", 0);
		map.put("sv_num9", 0);
		List rlist=dao.resdate(map);
		String [] restime=new String[rlist.size()];
		Iterator<String> itr=rlist.iterator();
		int k=0;
		while(itr.hasNext()) {
			String compare=itr.next();
			if(compare.contains(resdate.trim())) {
				restime[k]=compare.substring(12);
				
				k++;
			}
		}
		S_MemberDTO dto=(S_MemberDTO) sdao.read(id);
		String[] s_hour=dto.getS_hour().split(";");
		Utility util=new Utility();
		String hour_compare=util.getDateDay(resdate, "yyyy. MM. dd");
		int start=0;
		int end=0;
		
		for(int j=0;j<7;j++) {
			System.out.println(s_hour[j]);
			System.out.println(hour_compare);
			if(s_hour[j].contains(hour_compare)) {
				String a=s_hour[j].substring(4);
				String[] b=a.split(",");
				start=Integer.parseInt(b[0]);
				end=Integer.parseInt(b[1]);
			}
		}
		
		int[] hour=new int[(end-start)];
		
		for(int i=0;start<end;start++) {
			hour[i]=start;
			
			i++;
		}
		List result=new ArrayList<>();
		List fail=new ArrayList<>();
		System.out.println(restime.length);
		if(k==0)k=1;
		StringBuffer resultString=new StringBuffer();
		
		if(hour.length!=0) {
			
			if(restime.length!=0&&restime[0]!=null) {
				int timeperson=svdao.tp(sv_num);
				for(int y=0;y<k;y++) {
				
					for(int l=0;l<hour.length;l++) {
						
						if(hour[l]==Integer.parseInt(restime[y])) {
							timeperson--;
						}
						if(timeperson==0) {
							fail.add(hour[l]);
							break;
						}else {
							result.add(hour[l]);
						}
					}
				}
			}else {
				for(int l=0;l<hour.length;l++) {
					result.add(hour[l]);
				}
			}
			

			//result,fail 중복제거
			List<Integer> finalResult=new ArrayList<Integer>();
			List<Integer> finalFail=new ArrayList<Integer>();
			for(int x=0;x<result.size();x++) {
				if(!finalResult.contains(result.get(x))) {
					finalResult.add((Integer) result.get(x));
				}
			}
			for(int x=0;x<fail.size();x++) {
				if(!finalFail.contains(fail.get(x))) {
					finalFail.add((Integer) fail.get(x));
				}
			}
			
			
			for(int i=0;i<finalResult.size();i++) {
				resultString.append("<input type='submit' class='btn btn-Default btn-md' style='width: 100px;height: 50px; margin:10px;' value='"+finalResult.get(i)+":00' onclick=\"tt('"+finalResult.get(i)+"')\"/>");
				if(i!=0&&i%5==0) {
					resultString.append("<br>");
				}
			}
			for(int i=0;i<finalFail.size();i++) {
				resultString.append("<input type='button' class='btn btn-Default btn-md' style='background-color:white; width: 100px;height: 50px; margin:10px;' value='"+finalFail.get(i)+":00 예약완료' onclick=\"\"/>");
				if(i!=0&&i%5==0) {
					resultString.append("<br>");
				}
			}
		}else {
			resultString.append("휴일입니다");
		}
		return resultString.toString();
	}
	
	@RequestMapping(value="/{id}/reservation",method=RequestMethod.GET)
  	public String service(HttpServletRequest request,@PathVariable String id,Model model) throws Exception {
		S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
		Map map=new HashMap<>();
		map.put("s_id", id);
		List<ServiceDTO> list = dao.list(map);
		 if(list.size()==0) {
			 String error="판매자가 예약 대분류가 없습니다.";
			 request.setAttribute("msg", error);
			 return "/msg";
		 }else {
			
			 model.addAttribute("list", list);
 		return "/reservation/reservation";
  	}}
	

	
	@RequestMapping(value="/{id}/reservation2",method=RequestMethod.GET)
  	public String service2(HttpServletRequest request, int sv_num,@PathVariable String id) throws Exception {
		
		
		S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
		List<ServiceDTO> list = dao.Dlist(sv_num);
		 if(list.size()==0) {
			 String error="해당 대분류에 소분류가 없습니다.";
			 request.setAttribute("error", error);
			 return "/error";
		 }else {
			 request.setAttribute("list", list);
  		return "/reservation/reservation2";
		 }
  	}
	
	@RequestMapping(value="/{id}/reservation3",method=RequestMethod.GET)
  	public String service3(Locale locale,@PathVariable String id, HttpServletRequest request) throws Exception {
		S_MemberDTO sdto=(S_MemberDTO) sdao.read(id);
		request.setAttribute("sdto", sdto);
		request.setAttribute("locale", locale);
		return "/reservation/reservation3";
		
  	}
	
	@RequestMapping(value="/{id}/reservation3",method=RequestMethod.POST)
  	public String service3(String date,int sv_num,int time,HttpServletRequest request,@PathVariable String id) throws Exception {
		
		ReservationDTO dto=new ReservationDTO();
		dto.setC_id((String)request.getSession().getAttribute("id"));
		dto.setRes_time(date+time);
		dto.setSv_num(sv_num);
		System.out.println(dto.getC_id());
		System.out.println(dto.getRes_time());
		System.out.println(dto.getSv_num());
		boolean flag = dao.create(dto);
		if(flag) {
			 request.setAttribute("msg", "예약에 성공했습니다 !");
			 String url = "/msg";
			 System.out.println(url);
			 return url;
		}else {
			return "/reservation/error";
		}
		
  	}
	
}
