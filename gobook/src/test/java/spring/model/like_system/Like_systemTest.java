package gobook.review;


public class Like_systemTest {

	public static void main(String[] args) {
		
		Like_systemDAO dao = new Like_systemDAO();
		
		//read(dao);
		//create(dao);
		//delete(dao);
	}  
 

	private static void delete(Like_systemDAO dao) {
		
		int re_num = 2;
		try {
			if(dao.delete(re_num)){
				p("삭제성공");
			}else{
				p("삭제 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	private static void create(Like_systemDAO dao) {
		
		Like_systemDTO dto = new Like_systemDTO();
		dto.setRe_num(1);
		dto.setVoteid("13432");
		
		try {
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	}


	private static void read(Like_systemDAO dao) {
		int pk=1;
		try {
			Like_systemDTO dto=(Like_systemDTO) dao.read(pk);
			p(dto);			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(Like_systemDTO dto) {
		p("번호:"+dto.getRe_num());
		p("voteid:"+dto.getVoteid());

		
	}

}
