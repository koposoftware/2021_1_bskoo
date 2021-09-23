package kr.ac.kopo.stmt.vo;

public class StmtVO {
	private int subTotal;
	private int cnt;
	private int month;
	private String category;

	private String cardCode;
	private String cardNo;
	private String cardName;

	private int amount;
	private int no;
	private String chk;
	private String historyDate;
	private String store;

	private int start;
	private int end;
	private String txt;

	public StmtVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StmtVO(int subTotal, int cnt, int month, String category, String cardCode, String cardNo, String cardName,
			int amount, int no, String chk, String historyDate, String store, int start, int end, String txt) {
		super();
		this.subTotal = subTotal;
		this.cnt = cnt;
		this.month = month;
		this.category = category;
		this.cardCode = cardCode;
		this.cardNo = cardNo;
		this.cardName = cardName;
		this.amount = amount;
		this.no = no;
		this.chk = chk;
		this.historyDate = historyDate;
		this.store = store;
		this.start = start;
		this.end = end;
		this.txt = txt;
	}

	public int getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCardCode() {
		return cardCode;
	}

	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	public String getHistoryDate() {
		return historyDate;
	}

	public void setHistoryDate(String historyDate) {
		this.historyDate = historyDate;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	@Override
	public String toString() {
		return "StmtVO [subTotal=" + subTotal + ", cnt=" + cnt + ", month=" + month + ", category=" + category
				+ ", cardCode=" + cardCode + ", cardNo=" + cardNo + ", cardName=" + cardName + ", amount=" + amount
				+ ", no=" + no + ", chk=" + chk + ", historyDate=" + historyDate + ", store=" + store + ", start="
				+ start + ", end=" + end + ", txt=" + txt + "]";
	}

}
