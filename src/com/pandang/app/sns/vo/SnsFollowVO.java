package com.pandang.app.sns.vo;


public class SnsFollowVO {
	private int memberNumberFrom;
	private int memberNumberTo;
	
	public SnsFollowVO() {
		// TODO Auto-generated constructor stub
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
		return "SnsFollowVO [memberNumberFrom=" + memberNumberFrom + ", memberNumberTo=" + memberNumberTo + "]";
	}
	
	
	
}
