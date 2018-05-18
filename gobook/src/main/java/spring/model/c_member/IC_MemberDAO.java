package spring.model.c_member;

import java.util.List;
import java.util.Map;

import spring.model.gobook.DAOSTDInter;

public interface IC_MemberDAO extends DAOSTDInter {
	boolean create(Object dto) throws Exception;

	List list(Map map) throws Exception;

	Object read(Object pk) throws Exception;

	boolean update(Object dto) throws Exception;

	boolean delete(Object pk) throws Exception;

	int total(Map map) throws Exception;
	
	public boolean emailCheck(String c_email) throws Exception;
	
	public boolean idCheck(String c_id)throws Exception;
	
	public boolean updatePasswd(Map map) throws Exception;
	
	public boolean passwdCheck(Map map) throws Exception;
}
