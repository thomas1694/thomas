package spring.model.message;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public boolean create(MessageDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.insert("message.create", dto);
		if(cnt>0) flag = true;
		
		return flag;	
	}
	
	public MessageDTO read(int num) {
		return mybatis.selectOne("message.read", num);
	}
	
	public boolean delete(int num) {
		boolean flag = false;
		
		int cnt = mybatis.delete("message.delete", num);
		if(cnt>0) flag = true;
		
		return flag;
	}

	public void upreadcheck(int num) {
		mybatis.update("message.upreadcheck", num);
	}
	
	public int readchecktotal(String id) {
		if(id==null)id="";
		return mybatis.selectOne("message.readchecktotal", id);
	}
	
	public List<MessageDTO> list(Map map) {
		return mybatis.selectList("message.list", map);
	}
	
	public List<MessageDTO> sendlist(Map map) {
		return mybatis.selectList("message.sendlist", map);
	}
	
	public int total(Map map) {
		return mybatis.selectOne("message.total", map);
	}
	
	public int sendtotal(Map map) {
		return mybatis.selectOne("message.sendtotal", map);
	}

}
