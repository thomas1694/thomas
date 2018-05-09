package spring.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class ServiceDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
   public ServiceDTO read(int sv_num) {
		
		return sqlMapper.openSession().selectOne("service.read", sv_num);
	}
   
   public List<ServiceDTO> list() {
	   return sqlMapper.openSession().selectList("service.list");
   }

   public boolean update(ServiceDTO dto) {
	   SqlSession session = sqlMapper.openSession();
	   boolean flag = false;
	   int cnt = session.update("service.update", dto);
	   if(cnt>0)flag=true;
	   session.commit();
	   session.close();
	   return flag;
   }
   
   public boolean create(ServiceDTO dto) {
	   boolean flag = false;
	   SqlSession session = sqlMapper.openSession();
	   int cnt = session.insert("service.create", dto);
	   if(cnt>0)flag=true;
	   session.commit();
	   session.close();
	   return flag;
   }
	
   public boolean delete(int sv_num) {
	   SqlSession session = sqlMapper.openSession();
	   boolean flag = false;  
	   int cnt = session.delete("service.delete", sv_num);
	   if(cnt>0)flag=true;
	   session.commit();
	   session.close();
	   return flag;
   }
}





