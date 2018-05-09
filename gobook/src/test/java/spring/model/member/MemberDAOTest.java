package spring.model.member;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;



public class MemberDAOTest {
	
	private static BeanFactory beans;
	private static MemberDAO dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("daoTest.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = (MemberDAO) beans.getBean("mdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@Ignore
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	@Ignore
	public void total() {
		Map map=new HashMap();
		assertNotNull(dao.total(map));
		
	}
	@Test
	@Ignore
	public void delete() throws Exception {

		String id="stest5";
		assertTrue(dao.delete(id));
		
	}
	
	@Test
	@Ignore
	public void list() {
		
		Map map=new HashMap();
		List list;
		try {
			list = dao.list(map);
			for(int i=0;i<list.size();i++){
				MemberDTO dto=(MemberDTO)list.get(i);
				p(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void read() {
		String pk="stest";
		try {
			MemberDTO dto=(MemberDTO) dao.read(pk);
			String id=dto.getId();
			System.out.println(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Test
	@Ignore
	public void create() {
		MemberDTO dto=new MemberDTO();
		dto.setId("stest5");
		dto.setGrade("S");
		
		try {
			if(dao.create(dto)){
				p("생성 성공!");
			}else{
				p("생성 실패!");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void p(String string) {
		System.out.println(string);
	}

	
	public static void p(MemberDTO dto) {
	System.out.println(dto.getId());
	System.out.println(dto.getGrade());
	System.out.println("================================");
	
}
}
