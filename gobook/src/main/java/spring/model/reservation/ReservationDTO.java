package spring.model.reservation;

public class ReservationDTO {
	private int res_code;
	public int getRes_code() {
		return res_code;
	}
	public void setRes_code(int res_code) {
		this.res_code = res_code;
	}
	public int getSv_num() {
		return sv_num;
	}
	public void setSv_num(int sv_num) {
		this.sv_num = sv_num;
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
	private int sv_num;
	private String res_time;
	private String c_id;
	
}
