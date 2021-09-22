package kr.ac.kopo.admincard.vo;

public class AdminCardVO {
	private String cardCode;
	private String cardName;
	private String notice;

	private String age;
	private String gender;
	private String region;
	private String clusterNo;
	private String mailContent;

	private String emailAddress;
	private int memberNo;
	private String name;

	private int cnt;

	private int mailNo;
	private String sendingDate;
	private int total;
	private int sendingSuccess;
	private int sendingFail;

	public AdminCardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminCardVO(String cardCode, String cardName, String notice, String age, String gender, String region,
			String clusterNo, String mailContent, String emailAddress, int memberNo, String name, int cnt, int mailNo,
			String sendingDate, int total, int sendingSuccess, int sendingFail) {
		super();
		this.cardCode = cardCode;
		this.cardName = cardName;
		this.notice = notice;
		this.age = age;
		this.gender = gender;
		this.region = region;
		this.clusterNo = clusterNo;
		this.mailContent = mailContent;
		this.emailAddress = emailAddress;
		this.memberNo = memberNo;
		this.name = name;
		this.cnt = cnt;
		this.mailNo = mailNo;
		this.sendingDate = sendingDate;
		this.total = total;
		this.sendingSuccess = sendingSuccess;
		this.sendingFail = sendingFail;
	}

	public String getCardCode() {
		return cardCode;
	}

	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getClusterNo() {
		return clusterNo;
	}

	public void setClusterNo(String clusterNo) {
		this.clusterNo = clusterNo;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public String getSendingDate() {
		return sendingDate;
	}

	public void setSendingDate(String sendingDate) {
		this.sendingDate = sendingDate;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getSendingSuccess() {
		return sendingSuccess;
	}

	public void setSendingSuccess(int sendingSuccess) {
		this.sendingSuccess = sendingSuccess;
	}

	public int getSendingFail() {
		return sendingFail;
	}

	public void setSendingFail(int sendingFail) {
		this.sendingFail = sendingFail;
	}

	@Override
	public String toString() {
		return "AdminCardVO [cardCode=" + cardCode + ", cardName=" + cardName + ", notice=" + notice + ", age=" + age
				+ ", gender=" + gender + ", region=" + region + ", clusterNo=" + clusterNo + ", mailContent="
				+ mailContent + ", emailAddress=" + emailAddress + ", memberNo=" + memberNo + ", name=" + name
				+ ", cnt=" + cnt + ", mailNo=" + mailNo + ", sendingDate=" + sendingDate + ", total=" + total
				+ ", sendingSuccess=" + sendingSuccess + ", sendingFail=" + sendingFail + "]";
	}

}
