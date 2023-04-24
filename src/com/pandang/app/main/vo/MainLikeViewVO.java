package com.pandang.app.main.vo;

/*
 * select ts.store_number, ts.store_title, ts.store_view_cnt, count(tsl.store_number) as like_cnt, sf.store_file_system_name, tc.channel_name, tc.channel_number 
from tbl_store ts
left join tbl_store_like tsl 
on ts.store_number = tsl.store_number 
left join tbl_store_file sf
on ts.store_number = sf.store_number
left join tbl_channel tc
on ts.member_number = tc.member_number
where ts.member_number
group by ts.store_number, ts.store_title, ts.store_view_cnt, sf.store_file_system_name, tc.channel_name, tc.channel_number 
order by ts.store_view_cnt desc;
 */
public class MainLikeViewVO {
	private int storeNumber;
	private String storeTitle;
	private int storeViewCnt;
	private String storeFileSystemName;
	private String channelName;
	private int channelNumber;
	private int memberNumber;
	private int likeCnt;
	private int isLike;

	public MainLikeViewVO() {
	}

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

	public int getIsLike() {
		return isLike;
	}

	public void setIsLike(int isLike) {
		this.isLike = isLike;
	}

	@Override
	public String toString() {
		return "MainLikeViewVO [storeNumber=" + storeNumber + ", storeTitle=" + storeTitle + ", storeViewCnt="
				+ storeViewCnt + ", storeFileSystemName=" + storeFileSystemName + ", channelName=" + channelName
				+ ", channelNumber=" + channelNumber + ", memberNumber=" + memberNumber + ", likeCnt=" + likeCnt
				+ ", isLike=" + isLike + "]";
	}

}
