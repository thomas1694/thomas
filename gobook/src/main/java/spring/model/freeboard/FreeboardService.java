package spring.model.freeboard;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.freeboard_reply.Freeboard_replyDAO;


@Service
public class FreeboardService {
	@Autowired
	private Freeboard_replyDAO rdao;
	
	@Autowired
	private FreeboardDAO dao = null;


	  public void delete(int f_num) throws Exception{
		  
          rdao.bdelete(f_num); //댓글들 삭제
          dao.delete(f_num);   //댓글을 포함하는 글 삭제
   }

	public void reply(FreeboardDTO dto) throws Exception {
		Map map = new HashMap();
		map.put("f_ansnum", dto.getF_ansnum());
		map.put("f_grpno", dto.getF_grpno());
		
		dao.upAnsnum(map);
		
		dao.createReply(dto);
		
	}

}
