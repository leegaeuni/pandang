package com.pandang.app.channel.dto;

public class ChannelDTO {
	int channelNumber;
	String channelName;
	String channelComment;
	int memberNumber;
	
	public ChannelDTO() {	}
	
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
	public String getChannelComment() {
		return channelComment;
	}
	public void setChannelComment(String channelComment) {
		this.channelComment = channelComment;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	@Override
	public String toString() {
		return "ChannelDTO [channelNumber=" + channelNumber + ", channelName=" + channelName + ", channelComment="
				+ channelComment + ", memberNumber=" + memberNumber + "]";
	}

	
	
}
