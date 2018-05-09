package spring.model.page_image;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;

public class Page_ImageDAO implements IDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static {
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

	@Override
	public boolean create(Object dto) throws Exception {
		
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();
		int cnt = session.delete("page_image.create", dto);
		if(cnt>0) flag = true;
		session.commit();
		session.close();
		return flag;
		
	}

	@Override
	public List list(Map map) throws Exception {
		return sqlMapper.openSession().selectList("page_image.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return sqlMapper.openSession().selectOne("page_image.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();
		int cnt = session.update("page_image.update", dto);
		if(cnt>0) flag = true;
		session.commit();
		session.close();
		return flag;
		
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = sqlMapper.openSession().delete("page_image.delete", pk);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		int total = (Integer) sqlMapper.openSession().selectOne("page_image.total", map);
		return total;
	}

	@Override
	public boolean passwdCheck(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

}
