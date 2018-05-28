package spring.model.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO implements IDAO {
	
    public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Autowired 
	private SqlSessionTemplate mybatis;


	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag=false;

		int cnt=mybatis.insert("reservation.create", dto);
		if(cnt>0)flag=true;
	
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("reservation.list", map);
	}
	
	@Override
	public Object read(Object pk) throws Exception {
		
		return mybatis.selectOne("reservation.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag=false;
		System.out.println(dto);
		int cnt=mybatis.update("reservation.update", dto);
		if(cnt>0)flag=true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag=false;
		int cnt=mybatis.delete("reservation.delete", pk);
		if(cnt>0)flag=true;
		
		return flag;
	}
	
	@Override
	public List mlist(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("reservation.Mlist", map);
	}
	
	@Override
	public Object mread(Object res_code) throws Exception {
	     
		return mybatis.selectOne("reservation.Mread", res_code);
		
	}
	
	@Override
	public boolean mdelete(String res_code) throws Exception {
		boolean flag=false;
		int cnt=mybatis.delete("reservation.Mdelete", res_code);
		System.out.println(cnt);
		if(cnt>0)flag=true;
		
		return flag;
	}


	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public List list() throws Exception {
		
		return mybatis.selectList("reservation.list");
		
	}
	
	@Override
	public List Dlist(int sv_num_upper) throws Exception {
		
		return mybatis.selectList("reservation.Dlist",sv_num_upper);
		
	}

	public boolean checkres(int sv_num) {
		boolean flag=false;
		int cnt= mybatis.selectOne("reservation.checkres",sv_num);
		if(cnt>0)flag=true;
		return flag;
	}

	public List resdate(Map map) {
		List list=mybatis.selectList("reservation.resdate", map);
		return list;
	}
	


}
