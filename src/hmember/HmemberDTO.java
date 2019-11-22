package hmember;

public class HmemberDTO {        
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", mname=" + mname + ", tel=" + tel + 
				", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", "
						+ " mdate=" + mdate + ", fname=" + fname + ", grade=" + grade + "]";
	}
	public HmemberDTO(String id, String passwd, String mname, String tel,  String zipcode, String address1,
			String address2,  String mdate, String fname, String grade) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.mname = mname;
		this.tel = tel;
		
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		
		this.mdate = mdate;
		this.fname = fname;
		this.grade = grade;
	}
	public HmemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String  id          ;
	private String passwd       ;
	private String mname        ;
	private String tel          ;
	
	private String zipcode      ;
	private String address1     ;
	private String address2     ;
	
	private String mdate        ;
	private String fname        ;
	private String grade        ;

}
