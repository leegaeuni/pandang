package com.pandang.app.main.vo;

/*
 *	member_number int unsigned auto_increment primary key,
 * member_nickname varchar(300),
 * channel_comment varchar(300),
 * channel_number int,
 * channel_name  varchar(300),
 * channel_file_system_name varchar(300),
 * member_number_to int
 * member_number_from int
 */

public class MainVO {
	private int memberNumber;
	private String memberNickname;
	private int memberNumberTo;
	private int memberNumberFrom;
	private String channelComment;
	private int channelNumber;
	private String channelName;
	private String channelFileSystemName;

	public MainVO() {}

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

	public int getMemberNumberTo() {
		return memberNumberTo;
	}

	public void setMemberNumberTo(int memberNumberTo) {
		this.memberNumberTo = memberNumberTo;
	}

	public int getMemberNumberFrom() {
		return memberNumberFrom;
	}

	public void setMemberNumberFrom(int memberNumberFrom) {
		this.memberNumberFrom = memberNumberFrom;
	}

	public String getChannelComment() {
		return channelComment;
	}

	public void setChannelComment(String channelComment) {
		this.channelComment = channelComment;
	}

	public int getChannelNumber() {
		return channelNumber;
	}

	public void setChannelNumber(int channelNumber) {
		this.channelNumber = channelNumber;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getChannelFileSystemName() {
		return channelFileSystemName;
	}

	public void setChannelFileSystemName(String channelFileSystemName) {
		this.channelFileSystemName = channelFileSystemName;
	}

	@Override
	public String toString() {
		return "MainVO [memberNumber=" + memberNumber + ", memberNickname=" + memberNickname + ", memberNumberTo="
				+ memberNumberTo + ", memberNumberFrom=" + memberNumberFrom + ", channelComment=" + channelComment
				+ ", channelNumber=" + channelNumber + ", channelName=" + channelName + ", channelFileSystemName="
				+ channelFileSystemName + "]";
	}

	
	
}

	
