package com.pandang.app.buy.dto;

public class BuyDTO {
	private int buyNumber;
	private String buyStatus;
	private String buyDate;
	private int buyCnt;
	private int memberNumber;
	private int storeNumber;
	private String buyPhoneNumber;
	private String buyName;
	private String buyMsg;
	private String buyAddress;
	private String buyAddressDetail;
	private String buyZoneCode;
	private String buyPost;
	private String buyPostCode;
	
	public BuyDTO() {}

	public int getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(int buyNumber) {
		this.buyNumber = buyNumber;
	}

	public String getBuyStatus() {
		return buyStatus;
	}

	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}

	public String getBuyPhoneNumber() {
		return buyPhoneNumber;
	}

	public void setBuyPhoneNumber(String buyPhoneNumber) {
		this.buyPhoneNumber = buyPhoneNumber;
	}

	public String getBuyName() {
		return buyName;
	}

	public void setBuyName(String buyName) {
		this.buyName = buyName;
	}

	public String getBuyMsg() {
		return buyMsg;
	}

	public void setBuyMsg(String buyMsg) {
		this.buyMsg = buyMsg;
	}

	public String getBuyAddress() {
		return buyAddress;
	}

	public void setBuyAddress(String buyAddress) {
		this.buyAddress = buyAddress;
	}

	public String getBuyAddressDetail() {
		return buyAddressDetail;
	}

	public void setBuyAddressDetail(String buyAddressDetail) {
		this.buyAddressDetail = buyAddressDetail;
	}

	public String getBuyZoneCode() {
		return buyZoneCode;
	}

	public void setBuyZoneCode(String buyZoneCode) {
		this.buyZoneCode = buyZoneCode;
	}

	public String getBuyPost() {
		return buyPost;
	}

	public void setBuyPost(String buyPost) {
		this.buyPost = buyPost;
	}

	public String getBuyPostCode() {
		return buyPostCode;
	}

	public void setBuyPostCode(String buyPostCode) {
		this.buyPostCode = buyPostCode;
	}

	@Override
	public String toString() {
		return "BuyDTO [buyNumber=" + buyNumber + ", buyStatus=" + buyStatus + ", buyDate=" + buyDate + ", buyCnt="
				+ buyCnt + ", memberNumber=" + memberNumber + ", storeNumber=" + storeNumber + ", buyPhoneNumber="
				+ buyPhoneNumber + ", buyName=" + buyName + ", buyMsg=" + buyMsg + ", buyAddress=" + buyAddress
				+ ", buyAddressDetail=" + buyAddressDetail + ", buyZoneCode=" + buyZoneCode + ", buyPost=" + buyPost
				+ ", buyPostCode=" + buyPostCode + "]";
	}

	
	
	
}
