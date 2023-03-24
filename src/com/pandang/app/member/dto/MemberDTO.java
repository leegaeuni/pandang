package com.pandang.app.member.dto;


public class MemberDTO {
	private int memberNumber;
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberNickname;
	private String memberBirth;
	private String memberGender;
	private String memberPhoneNumber;
	private String memberEmail;
	private String memberAsk;
	private String memberAnswer;
	private int memberStatus;
	private String memberAddress;
	private String memberAddressDetail;
	private String memberZoneCode;
	
	public MemberDTO() {	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}

	public void setMemberPhoneNumber(String memberPhoneNumber) {
		this.memberPhoneNumber = memberPhoneNumber;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAsk() {
		return memberAsk;
	}

	public void setMemberAsk(String memberAsk) {
		this.memberAsk = memberAsk;
	}

	public String getMemberAnswer() {
		return memberAnswer;
	}

	public void setMemberAnswer(String memberAnswer) {
		this.memberAnswer = memberAnswer;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberAddressDetail() {
		return memberAddressDetail;
	}

	public void setMemberAddressDetail(String memberAddressDetail) {
		this.memberAddressDetail = memberAddressDetail;
	}

	public String getMemberZoneCode() {
		return memberZoneCode;
	}

	public void setMemberZoneCode(String memberZoneCode) {
		this.memberZoneCode = memberZoneCode;
	}

	@Override
	public String toString() {
		return "MemberDTO [memberNumber=" + memberNumber + ", memberId=" + memberId + ", memberPassword="
				+ memberPassword + ", memberName=" + memberName + ", memberNickname=" + memberNickname
				+ ", memberBirth=" + memberBirth + ", memberGender=" + memberGender + ", memberPhoneNumber="
				+ memberPhoneNumber + ", memberEmail=" + memberEmail + ", memberAsk=" + memberAsk + ", memberAnswer="
				+ memberAnswer + ", memberStatus=" + memberStatus + ", memberAddress=" + memberAddress
				+ ", memberAddressDetail=" + memberAddressDetail + ", memberZoneCode=" + memberZoneCode + "]";
	}


	
	
	
}
