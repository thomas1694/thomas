package spring.model.reservation;

public class ReservationDTO {
	private String res_code;
	private String sv_num;
	private String res_time;
	private String c_id;
	
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}
	public String getSv_num() {
		return sv_num;
	}
	public void setSv_num(String s_id) {
		this.sv_num = s_id;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
}
