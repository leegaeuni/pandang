package com.pandang.app.sns.comment.dto;

public class SnsCommentDTO {
	private int snsCommentNumber;
	private String snsCommentContent;
	private String snsCommentDate;
	private int snsNumber;
	private int memberNumber;
	
	public SnsCommentDTO() {}
	
	public int getSnsCommentNumber() {
		return snsCommentNumber;
	}
	public void setSnsCommentNumber(int snsCommentNumber) {
		this.snsCommentNumber = snsCommentNumber;
	}
	public String getSnsCommentContent() {
		return snsCommentContent;
	}
	public void setSnsCommentContent(String snsCommentContent) {
		this.snsCommentContent = snsCommentContent;
	}
	public String getSnsCommentDate() {
		return snsCommentDate;
	}
	public void setSnsCommentDate(String snsCommentDate) {
		this.snsCommentDate = snsCommentDate;
	}
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
		return "SnsCommentDTO [snsCommentNumber=" + snsCommentNumber + ", snsCommentContent=" + snsCommentContent
				+ ", snsCommentDate=" + snsCommentDate + ", snsNumber=" + snsNumber + ", memberNumber=" + memberNumber
				+ "]";
	}

	
	
}
