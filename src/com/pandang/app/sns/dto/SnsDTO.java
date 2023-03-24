package com.pandang.app.sns.dto;

public class SnsDTO {
	private int snsNumber;
	private String snsTitle;
	private String snsContent;
	private String snsDate;
	private int snsViewCnt;
	private int memberNumber;
	
	public SnsDTO() {}
	
	public int getSnsNumber() {
		return snsNumber;
	}
	public void setSnsNumber(int snsNumber) {
		this.snsNumber = snsNumber;
	}
	public String getSnsTitle() {
		return snsTitle;
	}
	public void setSnsTitle(String snsTitle) {
		this.snsTitle = snsTitle;
	}
	public String getSnsContent() {
		return snsContent;
	}
	public void setSnsContent(String snsContent) {
		this.snsContent = snsContent;
	}
	public String getSnsDate() {
		return snsDate;
	}
	public void setSnsDate(String snsDate) {
		this.snsDate = snsDate;
	}
	public int getSnsViewCnt() {
		return snsViewCnt;
	}
	public void setSnsViewCnt(int snsViewCnt) {
		this.snsViewCnt = snsViewCnt;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	@Override
	public String toString() {
		return "SnsDTO [snsNumber=" + snsNumber + ", snsTitle=" + snsTitle + ", snsContent=" + snsContent + ", snsDate="
				+ snsDate + ", snsViewCnt=" + snsViewCnt + ", memberNumber=" + memberNumber + "]";
	}

	
	
}
