package spring.model.service_image;

public class Service_imageDTO {

	private int simg_num;
	private String simg_filename;
	private int simg_filesize;
	private int sv_num;
	
	

	public int getSv_num() {
		return sv_num;
	}
	public void setSv_num(int sv_num) {
		this.sv_num = sv_num;
	}
	public int getSimg_num() {
		return simg_num;
	}
	public void setSimg_num(int simg_num) {
		this.simg_num = simg_num;
	}
	public String getSimg_filename() {
		return simg_filename;
	}
	public void setSimg_filename(String simg_filename) {
		this.simg_filename = simg_filename;
	}
	public int getSimg_filesize() {
		return simg_filesize;
	}
	public void setSimg_filesize(int simg_filesize) {
		this.simg_filesize = simg_filesize;
	}
}
