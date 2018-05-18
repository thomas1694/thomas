package spring.model.reservation;

import java.util.List;
import java.util.Map;

import spring.model.gobook.DAOSTDInter;

public interface IDAO extends DAOSTDInter {

	List list(Map map) throws Exception;

	List mlist(Map map) throws Exception;

	Object mread(Object res_code) throws Exception;
	

	List Dlist(int sv_num_upper) throws Exception;

	boolean mdelete(String res_code) throws Exception;

}
