package spring.model.notice;

public class NoticeDTO {

	private int n_num;
	private String n_title;
	private String n_content;
	private String n_wdate;
	private String a_id;
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_wdate() {
		return n_wdate;
	}
	public void setN_wdate(String n_wdate) {
		this.n_wdate = n_wdate;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
}
