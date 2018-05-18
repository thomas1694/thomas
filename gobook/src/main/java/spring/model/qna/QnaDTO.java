package spring.model.qna;

public class QnaDTO {
	private int q_num;
	private String q_title;
	private String q_content;
	private String q_wdate;
	private String id;
	private String q_lock;
	private int viewcnt;
	private int q_grpno;
	private int q_indent;
	private int q_ansnum;
	private int q_refnum;
	
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getQ_grpno() {
		return q_grpno;
	}
	public void setQ_grpno(int q_grpno) {
		this.q_grpno = q_grpno;
	}
	public int getQ_indent() {
		return q_indent;
	}
	public void setQ_indent(int q_indent) {
		this.q_indent = q_indent;
	}
	public int getQ_ansnum() {
		return q_ansnum;
	}
	public void setQ_ansnum(int q_ansnum) {
		this.q_ansnum = q_ansnum;
	}
	public int getQ_refnum() {
		return q_refnum;
	}
	public void setQ_refnum(int q_refnum) {
		this.q_refnum = q_refnum;
	}

	
}
