package spring.model.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements INoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	
	@Override
	public boolean create(Object dto) throws Exception {
	boolean flag = false;
	int cnt = mybatis.insert("notice.create", dto);
	System.out.println("cnt:"+cnt);
	if(cnt>0)flag = true;
	
	return flag;
	}

	
	@Override
	public List list(Map map) throws Exception {
		
	List list = mybatis.selectList("notice.list", map);
	return list;
	}

	@Override
	public Object read(Object pk) throws Exception {
	NoticeDTO dto = mybatis.selectOne("notice.read", pk);
	return dto;
	}

	
	@Override
	public boolean update(Object dto) throws Exception {
		
	boolean flag = false;
	int cnt = mybatis.update("notice.update", dto);
	if(cnt>0)flag = true;
	return flag;
	}

	
	@Override
	public boolean delete(Object pk) throws Exception {
	boolean flag = false;
	int cnt = mybatis.delete("notice.delete", pk);
	if(cnt>0)flag = true;
	return flag;
	}

	
	@Override
	public int total(Map map) throws Exception {
	int cnt=(Integer)mybatis.selectOne("notice.total", map);
	return cnt;
	}
}	