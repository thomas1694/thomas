package spring.model.freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


 
@Repository
public class FreeboardDAO implements IFreeboardDAO  {
 	
	@Autowired
	private SqlSessionTemplate mybatis;
 	
	
		
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
 	}
	public FreeboardDTO readReply(int f_num){
		
		return mybatis.selectOne("freeboard.readReply",f_num);
	}

	public boolean createReply(FreeboardDTO dto) {
		System.out.println("createReply@#(%*@)(#%*");
		boolean flag = false;
		
		int cnt = mybatis.insert("freeboard.createReply", dto);
		
		if(cnt>0)flag = true;
				
				
		return flag;
	}

 	@Override
 	public boolean create(Object dto) throws Exception {
 		boolean flag=false;
		
		int cnt=mybatis.delete("freeboard.create",dto);
 		System.out.println(cnt);
 		if(cnt>0)flag=true;
		
 		return flag;
 	}
 	
 	@Override
 	public List list(Map map) throws Exception {
 		
		return mybatis.selectList("freeboard.list", map);
 	}
 	
 	@Override
 	public FreeboardDTO read(Object f_num){
 		
	return mybatis.selectOne("freeboard.read", f_num);
 	}
 
 	@Override
 public boolean update(Object dto) {
	 boolean flag = false;
		int cnt = mybatis.update("freeboard.update", dto);
		if(cnt>0)flag = true;
		return flag;	
 	}
 	@Override
 public boolean delete(Object f_num) {
 		boolean flag=false;
		int cnt=mybatis.delete("freeboard.delete",f_num);
 		if(cnt>0)flag=true;
 		return flag;
 	}
 	@Override
 	public int total(Map map) throws Exception {
 		
		return mybatis.selectOne("freeboard.total", map);
 	}


//	public boolean passCheck(Map map) {
//		boolean flag = false;
//		int cnt = mybatis.selectOne("freeboard.passCheck", map);
//		
//		if(cnt>0)flag = true;
//		
//		return flag;
//	}

	public void upAnsnum(Map map) {
		mybatis.update("freeboard.upAnsnum", map);
	}
	
	public void upViewcnt(int f_num) {
		
		mybatis.update("freeboard.upViewcnt", f_num);
		
	}
	
	public boolean checkRefnum(int f_num) {
		boolean flag = false;
		int cnt = mybatis.selectOne("freeboard.checkRefnum", f_num);
		if(cnt>0)flag = true;
		
		return flag;
	}
	
	
	
 
 	}