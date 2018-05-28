package spring.model.admin_member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;

@Service
public class Admin_MemberService {
	
	@Autowired
	private Admin_MemberDAO adao;
	
	@Autowired
	private MemberDAO mdao;
	
	public boolean a_memberCreate(Admin_MemberDTO dto) throws Exception {
		MemberDTO mdto=new MemberDTO();
		
		mdto.setId(dto.getA_id());
		mdto.setGrade("A");
		System.out.println(mdto.getId().length());
		System.out.println(mdto.getGrade().length());
		mdao.create(mdto);
		
		boolean flag=adao.create(dto);
	
		
		
		return flag;
	}
}
