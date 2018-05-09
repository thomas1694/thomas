package spring.model.admin_member;

public class Admin_MemberDAO {
	
		
		private static SqlSessionFactory sqlMapper;
		
		static{

			sqlMapper = MyAppSqlConfig.getSqlMapInstance();
		}
		
		@Override
		public boolean create(Object dto) throws Exception {
			boolean flag=false;
			SqlSession session=sqlMapper.openSession();
			int cnt=session.delete("admin_member.create",dto);
			System.out.println(cnt);
			if(cnt>0)flag=true;
			session.commit();
			session.close();
			return flag;
		}

		@Override
		public List list(Map map) throws Exception {
			
			return sqlMapper.openSession().selectList("admin_member.list", map);
		}

		@Override
		public Object read(Object pk) throws Exception {
			
			return sqlMapper.openSession().selectOne("admin_member.read", pk);
		}

		@Override
		public boolean update(Object dto) throws Exception {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public boolean delete(Object pk) throws Exception {
			boolean flag=false;
			int cnt=sqlMapper.openSession().delete("admin_member.delete",pk);
			if(cnt>0)flag=true;
			return flag;
		}

		@Override
		public int total(Map map) throws Exception {
			
			return sqlMapper.openSession().selectOne("admin_member.total", map);
		}

		@Override
		public boolean passwdCheck(Map map) {
			// TODO Auto-generated method stub
			return false;
		}

	
}
