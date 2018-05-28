package spring.model.page_image;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Page_ImageDAO implements IPage_ImageDAO {
	
	@Autowired
	private  SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		System.out.println(((Page_ImageDTO)dto).getPg_filesize()+"@@@@@@@@@@@@@@@");
		int cnt = mybatis.delete("page_image.create", dto);
		if(cnt>0) flag = true;
		return flag;
	}


	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("page_image.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("page_image.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		
		boolean flag = false;
		int cnt = mybatis.update("page_image.update", dto);
		if(cnt>0) flag = true;
		return flag;
		
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = mybatis.delete("page_image.delete", pk);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		int total = mybatis.selectOne("page_image.total", map);
		return total;
	}

	public boolean updateContent(Page_ImageDTO dto) {
		boolean flag = false;
		int cnt = mybatis.update("page_image.updateContent", dto);
		if(cnt>0) flag = true;
		return flag;
	}



}
