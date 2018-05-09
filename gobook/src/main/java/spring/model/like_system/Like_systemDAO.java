package spring.model.like_system;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class Like_systemDAO implements IDAO {
	
	private static SqlSessionFactory sqlMapper;
	 
	static{
 
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		return sqlMapper.openSession().selectOne("like_system.read", pk);
	}
   @Override
   public boolean create(Object dto)throws Exception{
	    SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.insert("like_system.create",dto);
		System.out.println(cnt);
		if(cnt>0)flag = true;
		session.commit();
		session.close();
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.delete("like_system.delete",pk);
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
	public boolean update(Object dto) throws Exception {
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




