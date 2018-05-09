package spring.model.c_member;
package 
;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;

public class C_MemberDAO implements IDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static{
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag=false;
		int cnt=session.insert("c_member.create", dto);
		if(cnt>0)flag=true;
		
		session.commit();
		session.close();
		
		return flag;
	}
	
	public boolean emailCheck(String c_email) {
		SqlSession session = sqlMapper.openSession();
		boolean flag = true; //중복임
		
		int cnt = session.selectOne("c_member.emailCheck", c_email);
		if(cnt == 0) {
			flag = false; //사용가능
		}
		
		return flag;
	}
	
	public boolean idCheck(String c_id) {
		SqlSession session = sqlMapper.openSession();
		boolean flag = true; //중복임
		
		int cnt = session.selectOne("c_member.idCheck", c_id);
		if(cnt == 0) {
			flag = false; //사용가능
		}
		
		return flag;
	}

	@Override
	public C_MemberDTO read(Object pk) throws Exception {

		return sqlMapper.openSession().selectOne("c_member.read", pk);
	}
	
	@Override
	public List list(Map map) throws Exception {
		
		return sqlMapper.openSession().selectList("c_member.list", map);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		
		int cnt = session.update("c_member.update", dto);
		if(cnt > 0)flag = true;
		session.commit();
		session.close();
		
		return flag;
	}
	
	/* map에는 c_id, c_passwd, c_new_passwd가 들어간다 */
	public boolean updatePasswd(Map map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		
		if(passwdCheck(map)) {
			int cnt = session.update("c_member.updatePasswd", map);
			if(cnt > 0)flag = true;
			session.commit();
		}	
		session.close();
		
		return flag;
	}
	
	@Override
	public boolean passwdCheck(Map map) {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		
		int cnt = session.selectOne("c_member.passwdCheck", map);
		if(cnt == 1) {
			flag = true;
		}
		
		return flag;
	}

	

	@Override
	public boolean delete(Object pk) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		
		//예약정보가 있다면 삭제 못하게.
		int res_cnt = session.selectOne("c_member.count_reservation", pk);
		int cnt = 0;
		
		if(res_cnt == 0) {
			cnt = session.delete("c_member.delete", pk);
		}
		
		if(cnt > 0)flag = true;
		session.commit();
		session.close();
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


}
