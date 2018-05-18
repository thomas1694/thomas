package spring.model.s_member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class S_MemberDAO implements S_IDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag=false;
		int cnt=mybatis.insert("s_member.create", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("s_member.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		return mybatis.selectOne("s_member.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag=false;
		int cnt=mybatis.update("s_member.update", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag=false;
		int cnt=mybatis.delete("s_member.delete",pk);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("s_member.total", map);
	}

	
	public boolean passwdCheck(Map map) {
		boolean flag=false;
		int cnt=mybatis.selectOne("s_member.passwdCheck", map);
		if(cnt>0)flag=true;
		return flag;
		
	}

	public boolean s_member_updateImg(Map map) {
		boolean flag=false;
		int cnt=mybatis.update("s_member.updateImg", map);
		if(cnt>0)flag=true;
		return flag;
		
	}

	public boolean s_MemberCheck(String s_id) {
		boolean flag=false;
		int cnt=mybatis.selectOne("s_member.memberCheck", s_id);
		if(cnt>0)flag=true;
		return flag;
	}

	public boolean adminCheck(String id, String passwd) {
		boolean flag=false;
		Map map=new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		int cnt=mybatis.selectOne("s_member.adminCheck", map);
		if(cnt>0)flag=true;
		return flag;
	}

}
