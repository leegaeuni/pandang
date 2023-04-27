package com.pandang.app.main.vo;


public class MainFollowingVO {
	private int memberNumber;
	private String memberNickname;
	private int memberNumberTo;
	private int memberNumberFrom;
	private int isFollow;
	private String channelComment;
	private int channelNumber;
	private String channelName;
	private String channelFileSystemName;
	
	public MainFollowingVO() {}

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

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getIsFollow() {
		return isFollow;
	}

	public void setIsFollow(int isFollow) {
		this.isFollow = isFollow;
	}
	
	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
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
		return "MainFollowingVO [memberNumber=" + memberNumber + ", memberNickname=" + memberNickname
				+ ", memberNumberTo=" + memberNumberTo + ", memberNumberFrom=" + memberNumberFrom + ", isFollow="
				+ isFollow + ", channelComment=" + channelComment + ", channelNumber=" + channelNumber
				+ ", channelName=" + channelName + ", channelFileSystemName=" + channelFileSystemName + "]";
	}

	
}

	
