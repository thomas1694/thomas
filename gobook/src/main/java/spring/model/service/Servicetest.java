package spring.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Servicetest {

	public static void main(String[] args) {
		ServiceDAO dao=new ServiceDAO();
		System.out.println(dao);
		//create(dao);
		//read(dao);
		//update(dao);
		//list(dao);
		//delete(dao);
		finalnum(dao);
	}

	
	private static void finalnum(ServiceDAO dao) {
	
		try {
		
			ServiceDTO dto= (ServiceDTO) dao.finalnum();
			p(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void p(ServiceDTO dto) {
		
		System.out.println(dto.getSv_num());
		System.out.println("-------------------------");
		
	}

	
	private static void p(String string) {
		System.out.println(string);
		
	}

}
