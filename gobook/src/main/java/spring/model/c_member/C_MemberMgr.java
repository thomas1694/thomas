package spring.model.c_member;

import java.util.List;
import java.util.Map;

import gobook.member.MemberDAO;
import www.dao.IService;

public class C_MemberMgr implements IService {
	C_MemberDAO cdao=new C_MemberDAO();
	MemberDAO dao=new MemberDAO();

	public void delete(String ) throws Exception{
		dao.delete(bbsno); // 댓글'들' 모두를 삭제
	}
	
	@Override
	public boolean passwdCheck(Map map) {
		
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
