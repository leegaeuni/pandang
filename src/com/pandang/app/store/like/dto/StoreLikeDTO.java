package com.pandang.app.store.like.dto;

public class StoreLikeDTO {
	private int storeNumber;
	private int memberNumber;
	
	public StoreLikeDTO() {}

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
		return "StoreLikeDTO [storeNumber=" + storeNumber + ", memberNumber=" + memberNumber + "]";
	}
	
	
}
