package spring.model.visitor;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitCountDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
		
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	
	public void insertVisitor(VisitCountDTO dto) throws Exception {
		mybatis.insert("VisitCounter.insertVisitor", dto);
	}
	
	public int totalCount() {
		return mybatis.selectOne("VisitCounter.totalCount");
	}
	
	public int todayCount() {
		return mybatis.selectOne("VisitCounter.todayCount");
	}
}