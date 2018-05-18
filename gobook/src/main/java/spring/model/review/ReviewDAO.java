package spring.model.review;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.gobook.DAOSTDInter;

@Repository
public class ReviewDAO implements IReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*test용*/
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public Object read(Object pk) throws Exception {
		System.out.println(pk);
		return mybatis.selectOne("review.read", pk);	
	}
   @Override
   public boolean create(Object dto)throws Exception{
		boolean flag = false;
		ReviewDTO rdto =(ReviewDTO)dto;
		System.out.println(rdto.getRe_title());
		rdto.setC_id("ctest");
		
		int cnt = mybatis.insert("review.create",rdto);
		System.out.println(cnt);
		if(cnt>0)flag = true;
		
		return flag;
	}
	
	@Override
	public List list(Map map) throws Exception {

		return mybatis.selectList("review.list",map);
	}
	 
	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		ReviewDTO rdto =(ReviewDTO)dto;
		System.out.println(rdto.getRe_title());
		rdto.setC_id("ctest");
		rdto.setS_id("stest");
		int cnt = mybatis.update("review.update",dto);
		if(cnt>0)flag=true;
		
		return flag;
	}
	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = mybatis.delete("review.delete",pk);
		if(cnt>0)flag=true;
		
		return flag;
	}
	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("review.total",map);
	
	
	}
	@Override
	public boolean passwdCheck(Map map) {
		return false;
	}
	
	public void re_count(int re_num) throws Exception {
		
		mybatis.update("review.upRe_count", re_num);
	
	}
	public void re_like(int re_num)throws Exception{
		
		mybatis.update("review.upRe_like", re_num);
	}

		
	}
	
	





