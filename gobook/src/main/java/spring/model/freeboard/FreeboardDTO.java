package spring.model.freeboard;

public class FreeboardDTO {
	private int f_num;
	private String f_content;
	private int f_count;
	private String f_wdate;
	private String id;
	private int f_grpno;
	private int f_indent;
	private int f_ansnum;
	private String f_filename;
	private int f_filesize;
	private String f_title;

	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public int getF_count() {
		return f_count;
	}
	public void setF_count(int f_count) {
		this.f_count = f_count;
	}
	
	public String getF_wdate() {
		return f_wdate;
	}
	public void setF_wdate(String f_wdate) {
		this.f_wdate = f_wdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getF_grpno() {
		return f_grpno;
	}
	public void setF_grpno(int f_grpno) {
		this.f_grpno = f_grpno;
	}
	public int getF_indent() {
		return f_indent;
	}
	public void setF_indent(int f_indent) {
		this.f_indent = f_indent;
	}
	public int getF_ansnum() {
		return f_ansnum;
	}
	public void setF_ansnum(int f_ansnum) {
		this.f_ansnum = f_ansnum;
	}
	public String getF_filename() {
		return f_filename;
	}
	public void setF_filename(String f_filename) {
		this.f_filename = f_filename;
	}
	public int getF_filesize() {
		return f_filesize;
	}
	public void setF_filesize(int f_filesize) {
		this.f_filesize = f_filesize;
	}
	
}
