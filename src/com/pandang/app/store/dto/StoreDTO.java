package com.pandang.app.store.dto;

public class StoreDTO {
	private int storeNumber;
	private String storeTitle;
	private String storeContent;
	private String storeDate;
	private int storePrice;
	private int storeViewCnt;
	private int hashtagNumber;
	private int memberNumber;
	private String hashtagName;
	
	public StoreDTO() {}

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

	public String getStoreContent() {
		return storeContent;
	}

	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}

	public String getStoreDate() {
		return storeDate;
	}

	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
	}

	public int getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}

	public int getStoreViewCnt() {
		return storeViewCnt;
	}

	public void setStoreViewCnt(int storeViewCnt) {
		this.storeViewCnt = storeViewCnt;
	}

	public int getHashtagNumber() {
		return hashtagNumber;
	}

	public void setHashtagNumber(int hashtagNumber) {
		this.hashtagNumber = hashtagNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	
	public String getHashtagName() {
		return hashtagName;
	}

	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}

	@Override
	public String toString() {
		return "StoreDTO [storeNumber=" + storeNumber + ", storeTitle=" + storeTitle + ", storeContent=" + storeContent
				+ ", storeDate=" + storeDate + ", storePrice=" + storePrice + ", storeViewCnt=" + storeViewCnt
				+ ", hashtagNumber=" + hashtagNumber + ", memberNumber=" + memberNumber + ", hashtagName=" + hashtagName
				+ "]";
	}

	
	
	
}
