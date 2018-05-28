package spring.utility.gobook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import spring.model.visitor.VisitCountDAO;
import spring.model.visitor.VisitCountDTO;

public class VisitCounter implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		//등록되어있는 빈을 사용할수 있도록 설정해준다
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//request를 파라미터에 넣지 않고도 사용할수 있도록 설정
		//web.xml의 RequestContextListener가 현재 요청되어진 HttpServletRequest 객체의 레퍼런스 정보(current request에 대한 정보)를 저장하는 기능을 가진 리스너이기 때문에 가능하다.
		VisitCountDAO dao = (VisitCountDAO) wac.getBean("visitCountDAO");
		VisitCountDTO dto = new VisitCountDTO();
		dto.setVisit_ip(request.getRemoteAddr());
		dto.setVisit_agent(request.getHeader("User-Agent"));
		dto.setVisit_refer(request.getHeader("referer"));
		try {
			dao.insertVisitor(dto);
			session.setAttribute("totalCount", dao.totalCount());
			session.setAttribute("todayCount", dao.todayCount());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub

	}

}
