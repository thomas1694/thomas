package spring.model.statistics;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StaticDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
		
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public boolean create(Object dto) throws Exception {
		boolean flag=false;
		int cnt=mybatis.insert("static.create", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
