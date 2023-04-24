package com.pandang.app.main.vo;


public class MainFollowVO {
	private int storeNumber;
	private String storeTitle;
	private int storeViewCnt;
	private String storeFileSystemName;
	private String channelName;
	private int channelNumber;
	private int memberNumber;
	private int likeCnt;
	private int memberNumberTo;
	private int memberNumberFrom;
	
	public MainFollowVO() {}

	public int getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}

	public String getStoreTitle() {
		return storeTitle;
	}

	public void setStoreTitle(String storeTitle) {
		this.storeTitle = storeTitle;
	}

	public int getStoreViewCnt() {
		return storeViewCnt;
	}

	public void setStoreViewCnt(int storeViewCnt) {
		this.storeViewCnt = storeViewCnt;
	}

	public String getStoreFileSystemName() {
		return storeFileSystemName;
	}

	public void setStoreFileSystemName(String storeFileSystemName) {
		this.storeFileSystemName = storeFileSystemName;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public int getChannelNumber() {
		return channelNumber;
	}

	public void setChannelNumber(int channelNumber) {
		this.channelNumber = channelNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
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

	@Override
	public String toString() {
		return "MainFollowVO [storeNumber=" + storeNumber + ", storeTitle=" + storeTitle + ", storeViewCnt="
				+ storeViewCnt + ", storeFileSystemName=" + storeFileSystemName + ", channelName=" + channelName
				+ ", channelNumber=" + channelNumber + ", memberNumber=" + memberNumber + ", likeCnt=" + likeCnt
				+ ", memberNumberTo=" + memberNumberTo + ", memberNumberFrom=" + memberNumberFrom + "]";
	}
	
	
}

	
