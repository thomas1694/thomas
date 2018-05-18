package spring.model.s_member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;

@Service
public class S_MemberService {
	
	@Autowired
	private S_MemberDAO sdao;
	
	@Autowired
	private MemberDAO mdao;
	
	public boolean s_memberCreate(S_MemberDTO dto) throws Exception {
		MemberDTO mdto=new MemberDTO();
		
		mdto.setId(dto.getS_id());
		mdto.setGrade("S");
		System.out.println(mdto.getId().length());
		System.out.println(mdto.getGrade().length());
		mdao.create(mdto);
		
		boolean flag=sdao.create(dto);
	
		
		
		return flag;
	}
}
