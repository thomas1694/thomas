package spring.model.freeboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class FreeboardDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
   public FreeboardDTO read(int f_num) {
		
		return sqlMapper.openSession().selectOne("freeboard.read", f_num);
	}

	public boolean create(FreeboardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.insert("freeboard.create", dto);
		if(cnt>0)flag=true;
//		session.commit();
//		session.close();
		
		return flag;
	}
	
	public boolean update(FreeboardDTO dto){
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.update("freeboard.update", dto);
		if(cnt>0)flag = true;
		return flag;
	}
	public boolean delete(int f_num){
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		
		int cnt = session.delete("freeboard.delete", f_num);
		if(cnt>0) flag = true;
		
		return flag;
	}

	public List<FreeboardDTO> list(Map map) {
		SqlSession session = sqlMapper.openSession();
		return session.selectList("freeboard.list",map);
	}

	public int total(Map map) {
		SqlSession session = sqlMapper.openSession();
		return session.selectOne("freeboard.total", map);	
	} 
	
}





