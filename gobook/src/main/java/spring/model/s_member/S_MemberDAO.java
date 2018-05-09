package spring.model.s_member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;

public class S_MemberDAO implements IDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag=false;
		int cnt=sqlMapper.openSession().insert("s_member.create", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return sqlMapper.openSession().selectList("s_member.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		return sqlMapper.openSession().selectOne("s_member.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag=false;
		int cnt=sqlMapper.openSession().update("s_member.update", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag=false;
		int cnt=sqlMapper.openSession().delete("s_member.delete",pk);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlMapper.openSession().selectOne("s_member.total", map);
	}

	@Override
	public boolean passwdCheck(Map map) {
		boolean flag=false;
		int cnt=sqlMapper.openSession().selectOne("passwdCheck", map);
		if(cnt>0)flag=true;
		return flag;
	}

}
