package spring.model.review;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	private int re_num;
	private String re_title;
	private String re_content;
	private String re_filename;
	private int re_filesize;
	private int re_count;
	private double re_rating;
	private int re_like;	
	private String s_id;
	private String c_id;
	private String re_wdate;
	
	private MultipartFile filenameMF;
	
	public MultipartFile getFilenameMF() {
		return filenameMF;
	}
	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}

	
	
	public int getRe_num() {
		return re_num;
	}
	public String getRe_title() {
		return re_title;
	}
	public String getRe_content() {
		return re_content;
	}
	public String getRe_filename() {
		return re_filename;
	}
	public int getRe_filesize() {
		return re_filesize;
	}
	public int getRe_count() {
		return re_count;
	}
	public double getRe_rating() {
		return re_rating;
	}
	public int getRe_like() {
		return re_like;
	}
	public String getS_id() {
		return s_id;
	}
	public String getC_id() {
		return c_id;
	}
	public String getRe_wdate() {
		return re_wdate;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public void setFilename(String filename) {
		this.re_filename = filename;
	}
	public void setFilesize(int filesize) {
		this.re_filesize = filesize;
	}
	public void setRe_count(int re_count) {
		this.re_count = re_count;
	}
	public void setRe_rating(double re_rating) {
		this.re_rating = re_rating;
	}
	public void setRe_like(int re_like) {
		this.re_like = re_like;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public void setRe_wdate(String re_wdate) {
		this.re_wdate = re_wdate;
	}
    

}
