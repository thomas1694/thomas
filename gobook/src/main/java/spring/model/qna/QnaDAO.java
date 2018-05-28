package spring.model.qna;

import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.qna.QnaDTO;

@Repository
public class QnaDAO implements IQnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("qna.create", dto);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public boolean createReply(QnaDTO dto) throws Exception {
		boolean flag = false;
		
		int cnt = mybatis.insert("qna.createReply", dto);
		
		if(cnt>0)flag = true;

		return flag;
	}
	
	@Override
	public QnaDTO readReply(int q_num) throws Exception {
		
		return mybatis.selectOne("qna.readReply", q_num);
	}
	
	@Override
	public void upAnsnum(Map map) {
		
		mybatis.update("qna.upAnsnum", map);
	}
	
	@Override
	public List list(Map map) throws Exception {
		List list = mybatis.selectList("qna.list", map);
		
		return list;
	}

	@Override
	public Object read(Object pk) throws Exception {
		QnaDTO dto = mybatis.selectOne("qna.read", pk);
		
		return dto;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.update("qna.update", dto);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = mybatis.delete("qna.delete", pk);
		if(cnt>0)flag = true;
		
		return flag;
	}
	
	@Override
	public int total(Map map) throws Exception {
		
		return mybatis.selectOne("qna.total", map);
	}

	public boolean checkRefnum(int q_num) {
		
		boolean flag = false;
		int cnt = mybatis.selectOne("qna.checkRefnum",q_num);
		if(cnt>0)flag = true;
		
		return flag;
	}
}
