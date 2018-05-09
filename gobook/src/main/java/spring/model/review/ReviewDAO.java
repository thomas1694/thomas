package spring.model.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class ReviewDAO implements IDAO {
	
	private static SqlSessionFactory sqlMapper;
	 
	static{
 
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		return sqlMapper.openSession().selectOne("review.read", pk);
	}
   @Override
   public boolean create(Object dto)throws Exception{
	    SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.insert("review.create",dto);
		System.out.println(cnt);
		if(cnt>0)flag = true;
		session.commit();
		session.close();
		
		return flag;
	}
	
	@Override
	public List list(Map map) throws Exception {
		
		return sqlMapper.openSession().selectList("review.list",map);
	}
	 
	@Override
	public boolean update(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.update("review.update",dto);
		if(cnt>0)flag=true;
		session.commit();
		session.close();
		
		
		return flag;
	}
	@Override
	public boolean delete(Object pk) throws Exception {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.delete("review.delete",pk);
		if(cnt>0)flag=true;
		session.commit();
		session.close();
		
		return flag;
	}
	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlMapper.openSession().selectOne("review.total",map);
	
	
	}
	@Override
	public boolean passwdCheck(Map map) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public void re_count(int re_num) throws Exception {
		SqlSession session=sqlMapper.openSession();
		
		session.update("review.upRe_count", re_num);
		session.commit();
		session.close();
	}
	
}




