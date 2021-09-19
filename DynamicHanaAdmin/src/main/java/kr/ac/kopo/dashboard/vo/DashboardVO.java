package kr.ac.kopo.dashboard.vo;

public class DashboardVO {
	private int cnt;
	private int compareValue;
	private double ratio;

	private String historyDate;
	private int subTotal;
	private double subTotalDouble;

	private String clusterNo;
	private String clusterName;
	private String category;

	private int lastMonth;
	private int thisMonth;

	private String cardName;

	private int morning;
	private int lunch;
	private int dinner;
	private int night;
	public DashboardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DashboardVO(int cnt, int compareValue, double ratio, String historyDate, int subTotal, double subTotalDouble,
			String clusterNo, String clusterName, String category, int lastMonth, int thisMonth, String cardName,
			int morning, int lunch, int dinner, int night) {
		super();
		this.cnt = cnt;
		this.compareValue = compareValue;
		this.ratio = ratio;
		this.historyDate = historyDate;
		this.subTotal = subTotal;
		this.subTotalDouble = subTotalDouble;
		this.clusterNo = clusterNo;
		this.clusterName = clusterName;
		this.category = category;
		this.lastMonth = lastMonth;
		this.thisMonth = thisMonth;
		this.cardName = cardName;
		this.morning = morning;
		this.lunch = lunch;
		this.dinner = dinner;
		this.night = night;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getCompareValue() {
		return compareValue;
	}
	public void setCompareValue(int compareValue) {
		this.compareValue = compareValue;
	}
	public double getRatio() {
		return ratio;
	}
	public void setRatio(double ratio) {
		this.ratio = ratio;
	}
	public String getHistoryDate() {
		return historyDate;
	}
	public void setHistoryDate(String historyDate) {
		this.historyDate = historyDate;
	}
	public int getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}
	public double getSubTotalDouble() {
		return subTotalDouble;
	}
	public void setSubTotalDouble(double subTotalDouble) {
		this.subTotalDouble = subTotalDouble;
	}
	public String getClusterNo() {
		return clusterNo;
	}
	public void setClusterNo(String clusterNo) {
		this.clusterNo = clusterNo;
	}
	public String getClusterName() {
		return clusterName;
	}
	public void setClusterName(String clusterName) {
		this.clusterName = clusterName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getLastMonth() {
		return lastMonth;
	}
	public void setLastMonth(int lastMonth) {
		this.lastMonth = lastMonth;
	}
	public int getThisMonth() {
		return thisMonth;
	}
	public void setThisMonth(int thisMonth) {
		this.thisMonth = thisMonth;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public int getMorning() {
		return morning;
	}
	public void setMorning(int morning) {
		this.morning = morning;
	}
	public int getLunch() {
		return lunch;
	}
	public void setLunch(int lunch) {
		this.lunch = lunch;
	}
	public int getDinner() {
		return dinner;
	}
	public void setDinner(int dinner) {
		this.dinner = dinner;
	}
	public int getNight() {
		return night;
	}
	public void setNight(int night) {
		this.night = night;
	}
	@Override
	public String toString() {
		return "DashboardVO [cnt=" + cnt + ", compareValue=" + compareValue + ", ratio=" + ratio + ", historyDate="
				+ historyDate + ", subTotal=" + subTotal + ", subTotalDouble=" + subTotalDouble + ", clusterNo="
				+ clusterNo + ", clusterName=" + clusterName + ", category=" + category + ", lastMonth=" + lastMonth
				+ ", thisMonth=" + thisMonth + ", cardName=" + cardName + ", morning=" + morning + ", lunch=" + lunch
				+ ", dinner=" + dinner + ", night=" + night + "]";
	}

	
}
