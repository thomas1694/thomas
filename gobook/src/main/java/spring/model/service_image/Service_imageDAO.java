package spring.model.service_image;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Service_imageDAO {
	
@Autowired	
private SqlSessionTemplate mybatis;

public void setMybatis(SqlSessionTemplate mybatis) {
	this.mybatis = mybatis;
}

public Service_imageDTO read(int simg_num) {
		
		return mybatis.selectOne("service_image.read", simg_num);
	}

   public String getFilename(int sv_num) {
	return mybatis.selectOne("service_image.getFilename", sv_num);
   }

   public boolean create(Service_imageDTO dto) {
       boolean flag = false;
	   int cnt = mybatis.insert("service_image.create", dto);
	   System.out.println(cnt);
       if(cnt>0)flag=true;
   
       return flag;
   }
   
   public List<Service_imageDTO> list() {
	   return mybatis.selectList("service_image.list");
   }
   
   public boolean updatefile(Map map) {
       boolean flag= false;
	
	   int cnt = mybatis.update("service_image.updatefile", map);
       if(cnt>0)flag=true;
     
       return flag;
   }
   
   public boolean delete(int simg_num) {
       boolean flag= false;
	   int cnt = mybatis.delete("service_image.delete", simg_num);
       if(cnt>0)flag=true;
  
       return flag;
   }
}
