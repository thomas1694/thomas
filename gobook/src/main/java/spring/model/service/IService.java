package spring.model.service;

import spring.model.gobook.DAOSTDInter;

public interface IService extends DAOSTDInter {

	boolean Dcreate(Object dto) throws Exception;

	Object Dread(Object pk) throws Exception;

	Object finalnum() throws Exception;

	Object DCread(int sv_num) throws Exception;





}
