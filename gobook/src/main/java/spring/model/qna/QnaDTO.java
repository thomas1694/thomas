package spring.model.qna;

public class QnaDTO {
	private int q_num;
	private String q_title;
	private String q_content;
	private String q_wdate;
	private String id;
	private String q_lock;
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_wdate() {
		return q_wdate;
	}
	public void setQ_wdate(String q_wdate) {
		this.q_wdate = q_wdate;
	}

	public String getQ_lock() {
		return q_lock;
	}
	public void setQ_lock(String q_lock) {
		this.q_lock = q_lock;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
