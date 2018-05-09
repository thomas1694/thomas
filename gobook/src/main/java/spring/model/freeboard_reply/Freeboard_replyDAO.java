package spring.model.freeboard_reply;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class Freeboard_replyDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
   public Freeboard_replyDTO read(int f_num) {
		
		return sqlMapper.openSession().selectOne("freeboard_reply.read", f_num);
	}

	public boolean create(Freeboard_replyDTO dto) {
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.insert("freeboard_reply.create", dto);
		if(cnt>0)flag=true;
		session.commit();
		session.close();
		
		return flag;
	}
	
	public boolean update(Freeboard_replyDTO dto){
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		int cnt = session.update("freeboard_reply.update", dto);
		if(cnt>0)flag = true;
		return flag;
	}
	public boolean delete(int f_num){
		SqlSession session = sqlMapper.openSession();
		boolean flag = false;
		
		int cnt = session.delete("freeboard_reply.delete", f_num);
		if(cnt>0) flag = true;
		
		return flag;
	}

	public List<Freeboard_replyDTO> list(Map map) {
		SqlSession session = sqlMapper.openSession();
		return session.selectList("freeboard_reply.list",map);
	}

	public int total(int f_num) {
		SqlSession session = sqlMapper.openSession();
		return session.selectOne("freeboard_reply.total", f_num);	
	}
	

}





