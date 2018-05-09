package spring.model.service_image;

import java.util.List;

public class Service_imageTest {

	public static void main(String[] args) {
	
       Service_imageDAO dao = new Service_imageDAO();
          //create(dao);
          //list(dao);
          // read(dao);
           //update(dao);
           //delete(dao);
	}

	private static void delete(Service_imageDAO dao) {
	      int simg_num = 1;
	     if(dao.delete(simg_num)) {
	    	 System.out.println("성공");
	     }else {
	    	 System.out.println("실패");
	     }
		
	}

	private static void list(Service_imageDAO dao) {
         
		List<Service_imageDTO> list = dao.list();
		for (int i = 0; i < list.size(); i++) {
			Service_imageDTO dto = list.get(i);

			p(dto);
			p("--------");
		}
        
		
	}

	public static void create(Service_imageDAO dao) {
		Service_imageDTO dto = new Service_imageDTO();
		
	     dto.setSimg_filename("시바ㅈ같네");
	     dto.setSimg_filesize(1);
	     dto.setSv_num(2);
	     if(dao.create(dto)) {
	    	 System.out.println("성공");
	     }else {
	    	 System.out.println("실패");
	     }
	}
	
	public static void update(Service_imageDAO dao) {
		 int simg_num = 1;

		Service_imageDTO dto = dao.read(simg_num);
		
	     dto.setSimg_filename("ddf");
	     dto.setSimg_filesize(2);
	     if(dao.create(dto)) {
	    	 System.out.println("성공");
	     }else {
	    	 System.out.println("실패");
	     }
	}

	public static void read(Service_imageDAO dao) {
          int simg_num = 1;
          
          Service_imageDTO dto = dao.read(simg_num);
          
          p(dto);
	}
	
	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(Service_imageDTO dto) {
		
		p("번호:"+dto.getSimg_num());
		p("파일명:"+dto.getSimg_filename());
		p("파일사이즈:"+dto.getSimg_filesize());
		p("예약번호:"+dto.getSv_num());
		
	}
}
