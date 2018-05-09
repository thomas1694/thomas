package spring.model.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.dao.IDAO;
import www.mybatis.MyAppSqlConfig;

public class ReservationDAO implements IDAO {

	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag=false;
		SqlSession session=sqlMapper.openSession();
		int cnt=session.insert("reservation.create", dto);
		if(cnt>0)flag=true;
		session.commit();
		session.close();
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlMapper.openSession().selectList("reservation.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		return sqlMapper.openSession().selectOne("reservation.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag=false;
		SqlSession session=sqlMapper.openSession();
		int cnt=session.update("reservation.update", dto);
		if(cnt>0)flag=true;
		session.commit();
		session.close();
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag=false;
		SqlSession session=sqlMapper.openSession();
		int cnt=session.delete("reservation.delete", pk);
		if(cnt>0)flag=true;
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
