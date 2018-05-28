package spring.model.c_member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class C_MemberDAO implements IC_MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag=false;
		System.out.println("@@@@@@@@@@@@@@@dao_create@@@@@@@@@@@@@@@@@@@");
		int cnt=mybatis.insert("c_member.create", dto);
		
		if(cnt>0)flag=true;

		return flag;
	}
	
	public boolean emailCheck(String email) {
		boolean flag = true; //중복임
		
		int cnt = mybatis.selectOne("c_member.emailCheck", email);
		if(cnt == 0) {
			flag = false; //사용가능
		}
		
		return flag;
	}
	
	public String emailCheck2(String email) {
		String flag = "true"; //중복임
		
		int cnt = mybatis.selectOne("c_member.emailCheck", email);
		if(cnt == 0) {
			flag = "false"; //사용가능
		}
		
		return flag;
	}
	
	public boolean idCheck(String c_id) {

		boolean flag = true; //중복임
		
		int cnt = mybatis.selectOne("c_member.idCheck", c_id);
		if(cnt == 0) {
			flag = false; //사용가능
		}
		
		return flag;
	}
	
	

	@Override
	public C_MemberDTO read(Object pk) throws Exception {

		return mybatis.selectOne("c_member.read", pk);
	}
	
	@Override
	public List list(Map map) throws Exception {
		
		return mybatis.selectList("c_member.list", map);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		int cnt = mybatis.update("c_member.update", dto);
		if(cnt > 0)flag = true;
		
		return flag;
	}
	
	/* map에는 c_id, c_passwd, c_new_passwd가 들어간다 */
	public boolean updatePasswd(Map map) throws Exception {

		boolean flag = false;
		int cnt = mybatis.update("c_member.updatePasswd", map);
		if(cnt > 0)flag = true;
		return flag;
	}
	
	public boolean passwdCheck(Map map) {

		boolean flag = false;
		
		int cnt = mybatis.selectOne("c_member.passwdCheck", map);
		if(cnt == 1) {
			flag = true;
		}
		
		return flag;
	}

	
	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		//안쓰는 메소드. 아래에 delete2를 사용한다.
		return flag;
	}
	
	public String delete2(Object pk) throws Exception {
		String flag = "false";
		
		//예약정보가 있다면 삭제 못하게.
		int res_cnt = mybatis.selectOne("c_member.count_reservation", pk);
		int cnt = 0;
		
		if(res_cnt == 0) {
			cnt = mybatis.delete("c_member.delete", pk);
			
			if(cnt > 0)flag = "true";
		}else {
			flag = "have_false"; //예약정보가 있어서 삭제하지 않은 경우
		}
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public boolean loginCheck(Map map) throws Exception{
		boolean flag = false;
		
		int cnt = mybatis.selectOne("c_member.passwdCheck", map);
		if(cnt == 1) {
			flag = true;
		}
		
		return flag;		
	}
	
	
}