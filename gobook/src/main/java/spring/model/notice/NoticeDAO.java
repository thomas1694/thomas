package spring.model.notice;

import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;


public class NoticeDAO implements IDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

   

@Override
public boolean create(Object dto) throws Exception {
	SqlSession session = sqlMapper.openSession();
	boolean flag = false;
	int cnt = session.insert("notice.create", dto);
	if(cnt>0)flag = true;
	session.commit();
	session.close();
	
	return flag;
}

@Override
public List list(Map map) throws Exception {
	SqlSession session = sqlMapper.openSession();
	List list = session.selectList("notice.list", map);
	session.commit();
	session.close();
	return list;
}

@Override
public Object read(Object pk) throws Exception {
	SqlSession session = sqlMapper.openSession();
	NoticeDTO dto = session.selectOne("notice.read", pk);
	session.commit();
	session.close();
	return dto;
}

@Override
public boolean update(Object dto) throws Exception {
	SqlSession session = sqlMapper.openSession();
	boolean flag = false;
	int cnt = session.update("notice.update", dto);
	if(cnt>0)flag = true;
	session.commit();
	session.close();
	return flag;
}

@Override
public boolean delete(Object pk) throws Exception {
	SqlSession session = sqlMapper.openSession();
	boolean flag = false;
	int cnt = session.delete("notice.delete", pk);
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
	






