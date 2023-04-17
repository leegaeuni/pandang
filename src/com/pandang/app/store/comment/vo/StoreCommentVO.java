package com.pandang.app.store.comment.vo;

public class StoreCommentVO {
	private int storeCommentNumber;
	private String storeCommentContent;
	private String storeCommentDate;
	private int storeNumber;
	private int memberNumber;
	private String memberNickname;
	
	public StoreCommentVO() {}

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

	public String getStoreCommentDate() {
		return storeCommentDate;
	}

	public void setStoreCommentDate(String storeCommentDate) {
		this.storeCommentDate = storeCommentDate;
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

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	@Override
	public String toString() {
		return "StoreCommentVO [storeCommentNumber=" + storeCommentNumber + ", storeCommentContent="
				+ storeCommentContent + ", storeCommentDate=" + storeCommentDate + ", storeNumber=" + storeNumber
				+ ", memberNumber=" + memberNumber + ", memberNickname=" + memberNickname + "]";
	}
}
