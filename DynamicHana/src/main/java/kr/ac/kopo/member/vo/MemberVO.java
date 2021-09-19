package kr.ac.kopo.member.vo;

public class MemberVO {
	private int memberNo;
	private String id;
	private String name;
	private String pw;
	private String mobileNo;
	private String rrn;
	private String birthday;
	private int age;
	private String gender;
	private String isNative;
	private String managerNo;
	private String userType;
	private String address;
	private String addressDetail;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(int memberNo, String id, String name, String pw, String mobileNo, String rrn, String birthday,
			int age, String gender, String isNative, String managerNo, String userType, String address,
			String addressDetail) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.mobileNo = mobileNo;
		this.rrn = rrn;
		this.birthday = birthday;
		this.age = age;
		this.gender = gender;
		this.isNative = isNative;
		this.managerNo = managerNo;
		this.userType = userType;
		this.address = address;
		this.addressDetail = addressDetail;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIsNative() {
		return isNative;
	}
	public void setIsNative(String isNative) {
		this.isNative = isNative;
	}
	public String getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", id=" + id + ", name=" + name + ", pw=" + pw + ", mobileNo="
				+ mobileNo + ", rrn=" + rrn + ", birthday=" + birthday + ", age=" + age + ", gender=" + gender
				+ ", isNative=" + isNative + ", managerNo=" + managerNo + ", userType=" + userType + ", address="
				+ address + ", addressDetail=" + addressDetail + "]";
	}

	
}
