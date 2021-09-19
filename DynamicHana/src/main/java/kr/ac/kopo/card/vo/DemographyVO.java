package kr.ac.kopo.card.vo;

public class DemographyVO {
	private int male;
	private int female;
	        
	private int minor;
	private int age20;
	private int age30;
	private int age40;
	private int age50;
	private int senior;
	public DemographyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DemographyVO(int male, int female, int minor, int age20, int age30, int age40, int age50, int senior) {
		super();
		this.male = male;
		this.female = female;
		this.minor = minor;
		this.age20 = age20;
		this.age30 = age30;
		this.age40 = age40;
		this.age50 = age50;
		this.senior = senior;
	}
	public int getMale() {
		return male;
	}
	public void setMale(int male) {
		this.male = male;
	}
	public int getFemale() {
		return female;
	}
	public void setFemale(int female) {
		this.female = female;
	}
	public int getMinor() {
		return minor;
	}
	public void setMinor(int minor) {
		this.minor = minor;
	}
	public int getAge20() {
		return age20;
	}
	public void setAge20(int age20) {
		this.age20 = age20;
	}
	public int getAge30() {
		return age30;
	}
	public void setAge30(int age30) {
		this.age30 = age30;
	}
	public int getAge40() {
		return age40;
	}
	public void setAge40(int age40) {
		this.age40 = age40;
	}
	public int getAge50() {
		return age50;
	}
	public void setAge50(int age50) {
		this.age50 = age50;
	}
	public int getSenior() {
		return senior;
	}
	public void setSenior(int senior) {
		this.senior = senior;
	}
	@Override
	public String toString() {
		return "DemographyVO [male=" + male + ", female=" + female + ", minor=" + minor + ", age20=" + age20
				+ ", age30=" + age30 + ", age40=" + age40 + ", age50=" + age50 + ", senior=" + senior + "]";
	}

	
}
