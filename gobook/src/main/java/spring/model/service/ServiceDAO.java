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

	
	public List<ServiceDTO> list() throws Exception {
		
		 List list = new ArrayList<ServiceDTO>(); 
		  list = mybatis.selectList("service.list");
		 
		 System.out.println(list.get(0));
		 
		 return list;
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
		return 0;
	}

	@Override
	public Object read(Object sv_num) throws Exception {
		
		return mybatis.selectOne("service.read", sv_num);
		
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
