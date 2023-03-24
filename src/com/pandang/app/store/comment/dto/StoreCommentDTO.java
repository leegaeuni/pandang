package com.pandang.app.store.comment.dto;

public class StoreCommentDTO {
	private int storeCommentNumber;
	private String storeCommentContent;
	private String storeDate;
	private int memberNumber;
	private int storeNumber;
	
	public StoreCommentDTO() {}

	public int getStoreCommentNumber() {
		return storeCommentNumber;
	}

	public void setStoreCommentNumber(int storeCommentNumber) {
		this.storeCommentNumber = storeCommentNumber;
	}

	public String getStoreCommentContent() {
		return storeCommentContent;
	}

	public void setStoreCommentContent(String storeCommentContent) {
		this.storeCommentContent = storeCommentContent;
	}

	public String getStoreDate() {
		return storeDate;
	}

	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
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

	@Override
	public String toString() {
		return "StoreCommentDTO [storeCommentNumber=" + storeCommentNumber + ", storeCommentContent="
				+ storeCommentContent + ", storeDate=" + storeDate + ", memberNumber=" + memberNumber + ", storeNumber="
				+ storeNumber + "]";
	}

	
	
}
