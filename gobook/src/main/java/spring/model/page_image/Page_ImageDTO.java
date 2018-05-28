package spring.model.page_image;

public class Page_ImageDTO {
	private int pg_num;
	private String pg_filename;
	private int pg_filesize;
	private String s_id;
	private String pg_content;
	
	public int getPg_num() {
		return pg_num;
	}
	public void setPg_num(int pg_num) {
		this.pg_num = pg_num;
	}
	public String getPg_filename() {
		return pg_filename;
	}
	public void setPg_filename(String pg_filename) {
		this.pg_filename = pg_filename;
	}
	public int getPg_filesize() {
		return pg_filesize;
	}
	public void setPg_filesize(int pg_filesize) {
		this.pg_filesize = pg_filesize;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getPg_content() {
		return pg_content;
	}
	public void setPg_content(String pg_content) {
		this.pg_content = pg_content;
	}
	
	
}
