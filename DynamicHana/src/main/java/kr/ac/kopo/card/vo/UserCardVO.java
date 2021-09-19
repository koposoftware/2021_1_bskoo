package kr.ac.kopo.card.vo;
// 아직 사용안햇음
public class UserCardVO {
	private String cardCode;
	private String cardType;
	private String annualFee;
	private String cardNo;
	private int memberNo;
	private String cardName;
	private String cardPassword;
	private String validDate;
	private String cvcNo;

	public UserCardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserCardVO(String cardCode, String cardType, String annualFee, String cardNo, int memberNo, String cardName,
			String cardPassword, String validDate, String cvcNo) {
		super();
		this.cardCode = cardCode;
		this.cardType = cardType;
		this.annualFee = annualFee;
		this.cardNo = cardNo;
		this.memberNo = memberNo;
		this.cardName = cardName;
		this.cardPassword = cardPassword;
		this.validDate = validDate;
		this.cvcNo = cvcNo;
	}

	public String getCardCode() {
		return cardCode;
	}

	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getAnnualFee() {
		return annualFee;
	}

	public void setAnnualFee(String annualFee) {
		this.annualFee = annualFee;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getCardPassword() {
		return cardPassword;
	}

	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}

	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	public String getCvcNo() {
		return cvcNo;
	}

	public void setCvcNo(String cvcNo) {
		this.cvcNo = cvcNo;
	}

	@Override
	public String toString() {
		return "UserCardVO [cardCode=" + cardCode + ", cardType=" + cardType + ", annualFee=" + annualFee + ", cardNo="
				+ cardNo + ", memberNo=" + memberNo + ", cardName=" + cardName + ", cardPassword=" + cardPassword
				+ ", validDate=" + validDate + ", cvcNo=" + cvcNo + "]";
	}

}
