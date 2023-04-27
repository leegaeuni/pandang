package com.pandang.app.store.vo;

public class StoreFollowVO {
	private int memberNumberFrom;
	private int memberNumberTo;

	public StoreFollowVO() {
	}

	public int getMemberNumberFrom() {
		return memberNumberFrom;
	}

	public void setMemberNumberFrom(int memberNumberFrom) {
		this.memberNumberFrom = memberNumberFrom;
	}

	public int getMemberNumberTo() {
		return memberNumberTo;
	}

	public void setMemberNumberTo(int memberNumberTo) {
		this.memberNumberTo = memberNumberTo;
	}

	@Override
	public String toString() {
		return "StoreFollowVO [memberNumberFrom=" + memberNumberFrom + ", memberNumberTo=" + memberNumberTo + "]";
	}

}
