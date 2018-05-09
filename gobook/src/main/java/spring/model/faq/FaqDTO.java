package spring.model.faq;

public class FaqDTO {
	private int faq_num;
	private String faq_category;
	private String faq_title;
	private String faq_content;
	private String faq_wdate;
	private String a_id;
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_wdate() {
		return faq_wdate;
	}
	public void setFaq_wdate(String faq_wdate) {
		this.faq_wdate = faq_wdate;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	
}
