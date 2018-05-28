package spring.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.service_image.Service_imageDTO;

@Repository
public class ServiceDAO implements IService {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean Dcreate(Object dto) throws Exception {
		  boolean flag = false;
		  
		   int cnt = mybatis.insert("service.Dcreate", dto);
		   System.out.println(cnt);
		  
		   if(cnt>0)flag=true;
		 
		   return flag;
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		  boolean flag = false;
		   
		   int cnt = mybatis.insert("service.create", dto);
		   System.out.println(cnt);
		   if(cnt>0)flag=true;
		 
		   return flag;
	}

	
	

	
	@Override
	public Object Dread(Object sv_num) throws Exception {
		
		return mybatis.selectOne("service.Dread", sv_num);
		
	}
	
	@Override
	public Object DCread(int sv_num) throws Exception {
		
		return mybatis.selectOne("service.DCread", sv_num);
		
	}

	@Override
	public boolean update(Object dto) throws Exception {
		 boolean flag = false;
		   int cnt = mybatis.update("service.update", dto);
		   if(cnt>0)flag=true;
		
		   return flag;
	}

	@Override
	public boolean delete(Object sv_num) throws Exception {
		   
		   boolean flag = false;  
		   int cnt = mybatis.delete("service.delete", sv_num);
		   if(cnt>0)flag=true;
		   
		   return flag;
	}
	
	
	@Override
	public Object finalnum() throws Exception {
		
		  return mybatis.selectOne("service.finalnum");
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("service.total",map);
	}

	@Override
	public Object read(Object sv_num) throws Exception {
		
		return mybatis.selectOne("service.read", sv_num);
		
	}

	@Override
	public List list(Map map) throws Exception {
		List list = new ArrayList<ServiceDTO>(); 
		list = mybatis.selectList("service.list",map);
		 
		return list;
	}
	
	public boolean MCcheck(Map map) throws Exception{
		boolean flag=false;
		int cnt=mybatis.selectOne("service.MCcheck", map);
		if(cnt>=3) {
			flag=true;
		}
		return flag;
	}
	
	public List mwtotal(String id) throws Exception{
		List list=mybatis.selectList("service.mwtotal", id);
		return list;
	}
	
	public List resdate(String id) throws Exception{
		List list=mybatis.selectList("service.resdate", id);
		return list;
	}
	
	public List mwlist(Map map) throws Exception{
		List list=mybatis.selectList("service.mwlist", map);
		return list;
	}

	public boolean checkchild(int sv_num) {
		boolean flag=false;
		int cnt= mybatis.selectOne("service.checkchild",sv_num);
		if(cnt>0)flag=true;
		return flag;
	}

	public boolean checknumupper(int sv_num) {
		boolean flag=false;
		Object cnt=mybatis.selectOne("service.checknumupper",sv_num);
		if(cnt==null)cnt=0;
		if((Integer)cnt>0)flag=true;
		return flag;
	}

	public int tp(int sv_num) {
		
		return mybatis.selectOne("service.tp",sv_num);
	}
}
