package spring.model.freeboard_reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class Freeboard_replyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
   public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

   public Freeboard_replyDTO read(int fr_num) {
		
	return (Freeboard_replyDTO)mybatis.selectOne("freeboard_reply.read", fr_num);
	}

	public boolean create(Freeboard_replyDTO dto) {
		boolean flag = false;
		int cnt = (Integer)mybatis.insert("freeboard_reply.create", dto);
		if(cnt>0)flag=true;
		
		return flag;
	}
	
	public boolean update(Freeboard_replyDTO dto){
		boolean flag = false;
		int cnt = mybatis.update("freeboard_reply.update", dto);
		if(cnt>0)flag = true;
		return flag;
	}
	public boolean delete(int fr_num){
		boolean flag = false;
		
		int cnt = mybatis.delete("freeboard_reply.delete", fr_num);
		if(cnt>0) flag = true;
		
		return flag;
	}

	public List<Freeboard_replyDTO> list(Map map) {
		return mybatis.selectList("freeboard_reply.list",map);
	}

	public int total(int f_num) {
		return (Integer)mybatis.selectOne("freeboard_reply.total", f_num);	
	}

	public int bdelete(int f_num) throws Exception{
		   return mybatis.delete("freeboard_reply.bdelete", f_num);
		   
		}
		
	}
	







