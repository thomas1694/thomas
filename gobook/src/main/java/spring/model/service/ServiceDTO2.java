package spring.model.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import spring.model.service_image.Service_imageDTO;

@Repository
public class ServiceDTO2 {

	private int sv_num;
	private int sv_num_upper;
	private int sv_timeperson;
	private String sv_title;
	private String s_id;
	private int sv_price;
	private String sv_content;
	private String sv_template;
	

	private Service_imageDTO serdto;
	
	
	public ServiceDTO2() {
		super();
	}
	
	public ServiceDTO2(int sv_num, int sv_num_upper, int sv_timeperson, String sv_title,
			String s_id, int sv_price, String sv_content, String sv_template,
			Service_imageDTO serdto) {
		super();
		this.sv_num = sv_num;
		this.sv_num_upper = sv_num_upper;
		this.sv_timeperson = sv_timeperson;
		this.sv_title = sv_title;
		this.s_id = s_id;
		this.sv_price = sv_price;
		this.sv_content = sv_content;
		this.sv_template = sv_template;
		this.serdto = serdto;
	}
	
	public Service_imageDTO getSerdto() {
		return serdto;
	}
	
	public void setSerdto(Service_imageDTO serdto) {
		this.serdto = serdto;
	}
	

	public int getSv_num() {
		return sv_num;
	}

	public void setSv_num(int sv_num) {
		this.sv_num = sv_num;
	}

	public int getSv_num_upper() {
		return sv_num_upper;
	}

	public void setSv_num_upper(int sv_num_upper) {
		this.sv_num_upper = sv_num_upper;
	}

	public int getSv_timeperson() {
		return sv_timeperson;
	}

	public void setSv_timeperson(int sv_timeperson) {
		this.sv_timeperson = sv_timeperson;
	}

	public String getSv_title() {
		return sv_title;
	}

	public void setSv_title(String sv_title) {
		this.sv_title = sv_title;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public int getSv_price() {
		return sv_price;
	}

	public void setSv_price(int sv_price) {
		this.sv_price = sv_price;
	}

	public String getSv_content() {
		return sv_content;
	}

	public void setSv_content(String sv_content) {
		this.sv_content = sv_content;
	}

	public String getSv_template() {
		return sv_template;
	}

	public void setSv_template(String sv_template) {
		this.sv_template = sv_template;
	}




	
}
