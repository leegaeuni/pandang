package com.pandang.app.member.vo;

//select c.channel_name , c.channel_comment , cf.channel_file_system_name,
//m.member_number, m.member_password ,
//m.member_nickname , m.member_phone_number , 
//m.member_address , m.member_address_detail , m.member_zone_code 
//from tbl_member m join tbl_channel c
//on m.member_number = #{memberNumber} and m.member_number = c.member_number
//left outer join tbl_channel_file cf
//on c.channel_number = cf.channel_number ;

public class MemberVO {
	// member테이블의 값 memberMapper에서 select안 한 값도 받아도 됩니다!
	private int memberNumber;		
	private String memberPassword;		
	private String memberNickname;	
	private String memberPhoneNumber;	
	private String memberAddress;
	private String memberAddressDetail;
	private String memberZoneCode;	
	// channel_file 테이블의 값
	private String channelFileSystemName;
	// channel 테이블의 값
	private String channelName;
	private String channelComment;
		
	public MemberVO() {}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}

	public void setMemberPhoneNumber(String memberPhoneNumber) {
		this.memberPhoneNumber = memberPhoneNumber;
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

	public String getChannelFileSystemName() {
		return channelFileSystemName;
	}

	public void setChannelFileSystemName(String channelFileSystemName) {
		this.channelFileSystemName = channelFileSystemName;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getChannelComment() {
		return channelComment;
	}

	public void setChannelComment(String channelComment) {
		this.channelComment = channelComment;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNumber=" + memberNumber + ", memberPassword=" + memberPassword + ", memberNickname="
				+ memberNickname + ", memberPhoneNumber=" + memberPhoneNumber + ", memberAddress=" + memberAddress
				+ ", memberAddressDetail=" + memberAddressDetail + ", memberZoneCode=" + memberZoneCode
				+ ", channelFileSystemName=" + channelFileSystemName + ", channelName=" + channelName
				+ ", channelComment=" + channelComment + "]";
	}
}

