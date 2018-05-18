package spring.model.freeboard_reply;

public class Freeboard_replyDTO {
	
	private int fr_num;
	private	String fr_content;
	private	String fr_wdate;
	private int f_num;
	private String id;
	
	public int getFr_num() {
		return fr_num;
	}
	public void setFr_num(int fr_num) {
		this.fr_num = fr_num;
	}
	public String getFr_content() {
		return fr_content;
	}
	public void setFr_content(String fr_content) {
		this.fr_content = fr_content;
	}
	public String getFr_wdate() {
		return fr_wdate;
	}
	public void setFr_wdate(String fr_wdate) {
		this.fr_wdate = fr_wdate;
	}
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
