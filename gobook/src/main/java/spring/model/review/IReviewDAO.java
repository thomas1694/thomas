package spring.model.review;

import java.util.Map;

import spring.model.gobook.DAOSTDInter;

public interface IReviewDAO extends DAOSTDInter {

	boolean passwdCheck(Map map);

}
