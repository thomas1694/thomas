package spring.model.admin_member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Admin_MemberDAO {
	
		@Autowired
		private SqlSessionTemplate mybatis;
		
		
		
		public void setMybatis(SqlSessionTemplate mybatis) {
			this.mybatis = mybatis;
		}

		public boolean create(Object dto) throws Exception {
			boolean flag=false;
			int cnt=mybatis.delete("admin_member.create",dto);
			System.out.println(cnt);
			if(cnt>0)flag=true;
			return flag;
		}

		public List list(Map map) throws Exception {
			
			return mybatis.selectList("admin_member.list", map);
		}

		public Object read(String id) throws Exception {
			
			return mybatis.selectOne("admin_member.read", id);
		}

		public boolean update(Object dto) throws Exception {
			boolean flag=false;
			int cnt=mybatis.update("admin_member.update", dto);
			if(cnt>0)flag=true;
			return flag;
		}

		public boolean delete(Object pk) throws Exception {
			boolean flag=false;
			int cnt=mybatis.delete("admin_member.delete",pk);
			if(cnt>0)flag=true;
			return flag;
		}

		public int total(Map map) throws Exception {
			
			return mybatis.selectOne("admin_member.total", map);
		}

		public boolean passwdCheck(Map map) {
			boolean flag=false;
			int cnt=mybatis.selectOne("admin_member.passwdCheck", map);
			if(cnt>0)flag=true;
			return flag;
		}

	
}
