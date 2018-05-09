package spring.model.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReservationTest {

	public static void main(String[] args) {
		ReservationDAO dao=new ReservationDAO();
		//create(dao);
		//read(dao);
		//update(dao);
		list(dao);
		//delete(dao);
	}

	private static void delete(ReservationDAO dao) {
		String res_code="A000000001";
		try {
			if(dao.delete(res_code)){
				p("삭제성공");
			}else{
				p("삭제실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void update(ReservationDAO dao) {
		Map map=new HashMap();
		map.put("col", "res_code");
		map.put("res_code", "A000000001");
		ReservationDTO dto;
		try {
			dto = (ReservationDTO)dao.read(map);
			dto.setRes_time("201805051700-201805051800");
			if(dao.update(dto)){
				p("수정 성공");
			}else{
				p("수정 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private static void list(ReservationDAO dao) {
		Map map=new HashMap();
		map.put("col", "sv_num");
		map.put("sv_num", 1);
		try {
			List list=dao.list(map);
			for(int i=0;i<list.size();i++){
				ReservationDTO dto=(ReservationDTO) list.get(i);
				p(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	private static void read(ReservationDAO dao) {
	
		try {
			String res_code="A000000002";
			ReservationDTO dto=(ReservationDTO)dao.read(res_code);
			p(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void p(ReservationDTO dto) {
		System.out.println(dto.getRes_code());
		System.out.println(dto.getRes_time());
		System.out.println(dto.getC_id());
		System.out.println(dto.getSv_num());
		System.out.println("-------------------------");
		
	}

	private static void create(ReservationDAO dao) {
		ReservationDTO dto=new ReservationDTO();
		dto.setC_id("ctest");
		dto.setRes_code("A000000001");
		dto.setRes_time("201805031700-201805031800");
		dto.setSv_num("stest");
		
		try {
			if(dao.create(dto)){
				p("성공");
			}else{
				p("실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
