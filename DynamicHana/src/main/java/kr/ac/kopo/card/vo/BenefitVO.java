package kr.ac.kopo.card.vo;

public class BenefitVO {
	private String category;
	private String categoryKor;
	private String cardCode;
	private String cardName;
	private String notice;

	public BenefitVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BenefitVO(String category, String categoryKor, String cardCode, String cardName, String notice) {
		super();
		this.category = category;
		this.categoryKor = categoryKor;
		this.cardCode = cardCode;
		this.cardName = cardName;
		this.notice = notice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategoryKor() {
		return categoryKor;
	}

	public void setCategoryKor(String categoryKor) {
		this.categoryKor = categoryKor;
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

	@Override
	public String toString() {
		return "BenefitVO [category=" + category + ", categoryKor=" + categoryKor + ", cardCode=" + cardCode
				+ ", cardName=" + cardName + ", notice=" + notice + "]";
	}

}
