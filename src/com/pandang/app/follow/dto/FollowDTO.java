package com.pandang.app.follow.dto;

public class FollowDTO {
	private int memberNumberFrom;
	private int memberNumberTo;
	
	public FollowDTO() {}
	
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
		return "FollowDTO [memberNumberFrom=" + memberNumberFrom + ", memberNumberTo=" + memberNumberTo + "]";
	}

	
	
}
