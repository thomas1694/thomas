package spring.model.message;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;

public class MessageDAO implements IDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static {
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();
		int cnt = session.delete("message.create", dto);
		if(cnt>0) flag = true;
		session.commit();
		session.close();
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return sqlMapper.openSession().selectList("message.list", map);
	}
	
	public List sendList(Map map) throws Exception {
		
		return sqlMapper.openSession().selectList("message.sendList", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		return sqlMapper.openSession().selectOne("message.read", pk);
	}
	
	@Override
	public boolean update(Object dto) throws Exception {
		return false;
	}
	
	public boolean upReadCheck(int pk) throws Exception {
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();
		int cnt = session.update("message.upReadCheck", pk);
		if(cnt>0) flag = true;
		session.commit();
		session.close();
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = sqlMapper.openSession().delete("message.delete", pk);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		int total = (Integer) sqlMapper.openSession().selectOne("message.total", map);
		return total;
	}
	
	public int sendTotal(Map map) throws Exception {
		int total = (Integer) sqlMapper.openSession().selectOne("message.sendTotal", map);
		return total;
	}

	@Override
	public boolean passwdCheck(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

}
