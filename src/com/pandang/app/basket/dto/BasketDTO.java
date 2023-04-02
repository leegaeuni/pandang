package com.pandang.app.basket.dto;

public class BasketDTO {
	private int basketCnt;
	private int storeNumber;
	private int memberNumber;
	
	public BasketDTO() {}
	
	public int getBasketCnt() {
		return basketCnt;
	}
	public void setBasketCnt(int basketCnt) {
		this.basketCnt = basketCnt;
	}
	public int getStoreNumber() {
		return storeNumber;
	}
	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	@Override
	public String toString() {
		return "BasketDTO [basketCnt=" + basketCnt + ", storeNumber=" + storeNumber + ", memberNumber=" + memberNumber
				+ "]";
	}

	
	
}
