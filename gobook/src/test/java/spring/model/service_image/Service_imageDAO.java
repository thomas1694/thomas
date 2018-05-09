package spring.model.service_image;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;

public class Service_imageDAO {
	
private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
   public Service_imageDTO read(int simg_num) {
		
		return sqlMapper.openSession().selectOne("service_image.read", simg_num);
	}

   public boolean create(Service_imageDTO dto) {
       boolean flag= false;
	   SqlSession session = sqlMapper.openSession();
	   int cnt = session.insert("service_image.create", dto);
       if(cnt>0)flag=true;
       session.commit();
       session.close();
       return flag;
   }
   
   public List<Service_imageDTO> list() {
	   return sqlMapper.openSession().selectList("service_image.list");
   }
   
   public boolean update(Service_imageDTO dto) {
       boolean flag= false;
	   SqlSession session = sqlMapper.openSession();
	   int cnt = session.update("service_image.update", dto);
       if(cnt>0)flag=true;
       session.commit();
       session.close();
       return flag;
   }
   
   public boolean delete(int simg_num) {
       boolean flag= false;
	   SqlSession session = sqlMapper.openSession();
	   int cnt = session.delete("service_image.delete", simg_num);
       if(cnt>0)flag=true;
       session.commit();
       session.close();
       return flag;
   }
}
