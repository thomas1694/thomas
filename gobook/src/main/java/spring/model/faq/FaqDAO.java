package spring.model.faq;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.faq.FaqDAO;


@Repository
public class FaqDAO implements IFaqDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
		
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	
	
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("faq.create", dto);
		if(cnt>0)flag=true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		List list = mybatis.selectList("faq.list", map);
		
		return list;
	}

	@Override
	public Object read(Object pk) throws Exception {
		FaqDTO dto = mybatis.selectOne("faq.read", pk);
		
		return dto;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.update("faq.update", dto);
		System.out.println(cnt);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = mybatis.delete("faq.delete", pk);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("faq.total", map);
	}
}