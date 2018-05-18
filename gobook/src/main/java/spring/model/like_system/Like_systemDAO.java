package spring.model.like_system;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Like_systemDAO implements ILike_systemDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*test용*/
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public Object read(Object pk) throws Exception {
		
		return mybatis.selectOne("like_system.read", pk);
	}
   @Override
   public boolean create(Object dto)throws Exception{
		boolean flag = false;
		int cnt = mybatis.insert("like_system.create",dto);
		System.out.println(cnt);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = mybatis.delete("like_system.delete",pk);
		if(cnt>0)flag=true;
		
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
	
}




