package com.pandang.app.buy.vo;

/*select b.member_number, b.buy_date , b.buy_number , sf.store_file_system_name , 
s.store_number, s.store_title , s.store_price,
b.buy_cnt , b.buy_status , b.buy_post , b.buy_post_code ,
m.member_name , m.member_phone_number , m.member_email , 
m.member_address , m.member_address_detail , m.member_zone_code, b.buy_msg */

public class BuyVO {
	private int memberNumber;
	private String buyDate;
	private int buyNumber;
	private String storeFileSystemName;
	private int storeNumber;
	private String storeTitle;
	private int storePrice;
	private int buyCnt;
	private String buyStatus;
	private String buyPost;
	private String buyPostCode;
	
	// 여기서부터 pay에 필요한 내역 추가함
	private String memberName;
	private String memberPhoneNumber;
	private String memberEmail;
	private String memberAddress;
	private String memberAddressDetail;
	private String memberZoneCode;
	private String buyMsg; 
	
	public BuyVO() {}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public int getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(int buyNumber) {
		this.buyNumber = buyNumber;
	}

	public String getStoreFileSystemName() {
		return storeFileSystemName;
	}

	public void setStoreFileSystemName(String storeFileSystemName) {
		this.storeFileSystemName = storeFileSystemName;
	}

	public int getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}

	public String getStoreTitle() {
		return storeTitle;
	}

	public void setStoreTitle(String storeTitle) {
		this.storeTitle = storeTitle;
	}

	public int getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}

	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	public String getBuyStatus() {
		return buyStatus;
	}

	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}

	public void setMemberPhoneNumber(String memberPhoneNumber) {
		this.memberPhoneNumber = memberPhoneNumber;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberAddressDetail() {
		return memberAddressDetail;
	}

	public void setMemberAddressDetail(String memberAddressDetail) {
		this.memberAddressDetail = memberAddressDetail;
	}

	public String getMemberZoneCode() {
		return memberZoneCode;
	}

	public void setMemberZoneCode(String memberZoneCode) {
		this.memberZoneCode = memberZoneCode;
	}

	public String getBuyMsg() {
		return buyMsg;
	}

	public void setBuyMsg(String buyMsg) {
		this.buyMsg = buyMsg;
	}

	@Override
	public String toString() {
		return "BuyVO [memberNumber=" + memberNumber + ", buyDate=" + buyDate + ", buyNumber=" + buyNumber
				+ ", storeFileSystemName=" + storeFileSystemName + ", storeNumber=" + storeNumber + ", storeTitle="
				+ storeTitle + ", storePrice=" + storePrice + ", buyCnt=" + buyCnt + ", buyStatus=" + buyStatus
				+ ", buyPost=" + buyPost + ", buyPostCode=" + buyPostCode + ", memberName=" + memberName
				+ ", memberPhoneNumber=" + memberPhoneNumber + ", memberEmail=" + memberEmail + ", memberAddress="
				+ memberAddress + ", memberAddressDetail=" + memberAddressDetail + ", memberZoneCode=" + memberZoneCode
				+ ", buyMsg=" + buyMsg + "]";
	}
}
