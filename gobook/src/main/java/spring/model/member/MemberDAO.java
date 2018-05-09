package spring.model.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements IMemberDAO {
	
	@Autowired
	private static SqlSessionTemplate mybatis;
	
	
	
	public static void setMybatis(SqlSessionTemplate mybatis) {
		MemberDAO.mybatis = mybatis;
	}

	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag=false;
		
		int cnt=mybatis.delete("member.create",dto);
		System.out.println(cnt);
		if(cnt>0)flag=true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return mybatis.selectList("member.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		return mybatis.selectOne("member.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag=false;
		int cnt=mybatis.delete("member.delete",pk);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		
		return mybatis.selectOne("member.total", map);
	}

	

}
