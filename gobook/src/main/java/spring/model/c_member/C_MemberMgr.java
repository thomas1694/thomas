package spring.model.c_member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.member.MemberDAO;

@Service
public class C_MemberMgr{
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private C_MemberDAO dao;
	
	public void create(C_MemberDTO dto) throws Exception{
		/*root-context에 트랜잭션 설정해줌*/
		System.out.println(dto.getC_id()+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		
		Map map = new HashMap();
		map.put("id", dto.getC_id());
		map.put("grade", "C");
		
		mdao.create(map);
		dao.create(dto);
	}
	
	/*
	public void delete(int bbsno) throws Exception{
		rdao.bdelete(bbsno); 
		dao.delete(bbsno);	
	}*/
}
