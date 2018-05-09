package spring.model.statistics;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;

public class StaticDAO implements IDAO{
	
private static SqlSessionFactory sqlMapper;
	
	static{
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

	/*매일매일 (각 날짜당)s_id 하나마다 1개씩 생성된다*/
	@Override
	public boolean create(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag=false;
		int cnt=session.insert("static.create", dto);
		if(cnt>0)flag=true;
		
		session.commit();
		session.close();
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return false;
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
