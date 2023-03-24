package com.pandang.app.sns.like.dto;

public class SnsLikeDTO {
	private int snsNumber;
	private int memberNumber;
	
	public SnsLikeDTO() {}

	public int getSnsNumber() {
		return snsNumber;
	}

	public void setSnsNumber(int snsNumber) {
		this.snsNumber = snsNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	@Override
	public String toString() {
		return "SnsLikeDTO [snsNumber=" + snsNumber + ", memberNumber=" + memberNumber + "]";
	}

	
	
}
