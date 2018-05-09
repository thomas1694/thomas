package spring.model.faq;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;

public class FaqDAO implements IDAO {

	private static SqlSessionFactory sqlMapper;
	
	static {
		
			sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
	
	@Override
	public boolean create(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.insert("faq.create", dto);
		if(cnt>0)flag=true;
		session.commit();
		session.close();
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("faq.list", map);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public Object read(Object pk) throws Exception {
		SqlSession session = sqlMapper.openSession();
		FaqDTO dto = session.selectOne("faq.read", pk);
		session.commit();
		session.close();
		
		return dto;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.update("faq.update", dto);
		if(cnt>0)flag = true;
		session.commit();
		session.close();
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.delete("faq.delete", pk);
		if(cnt>0)flag = true;
		session.commit();
		session.close();
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean passwdCheck(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

}
