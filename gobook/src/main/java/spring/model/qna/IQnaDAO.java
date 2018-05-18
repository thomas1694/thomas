package spring.model.qna;

import java.util.Map;

import spring.model.gobook.DAOSTDInter;

public interface IQnaDAO extends DAOSTDInter {

	public boolean createReply(QnaDTO dto) throws Exception;
	
	public QnaDTO readReply(int q_num) throws Exception;
	
	public void upAnsnum(Map map);
}
