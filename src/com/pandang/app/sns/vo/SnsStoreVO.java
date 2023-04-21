package com.pandang.app.sns.vo;
//select ts.store_number , ts.store_title , ts.store_content , store_date,
//count(tsl.store_number) as like_cnt,
//count(distinct tsc.store_number) as store_comment_cnt,
//ts.store_view_cnt ,
//tsf.store_file_system_name ,
//tc.channel_name ,
//tcf.channel_file_system_name ,
//ts.member_number
//select ts.store_title, ts.store_number,
//ts.store_date, th.hashtag_name, ts.store_view_cnt from tbl_store ts 


public class SnsStoreVO {
	private int storeNumber;
	private String storeTitle;
	private String storeDate;
	private int storeViewCnt;
	private int likeCnt;
	private int memberNumber;
	private String storeContent;
	private int storeCommentCnt;
	private String storeFileSystemName;
	private String channelName;
	private String channelFileSystemName;
	private String hashtagName;
	
	
	
	public SnsStoreVO() {
		// TODO Auto-generated constructor stub
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



	public String getStoreDate() {
		return storeDate;
	}



	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
	}



	public int getStoreViewCnt() {
		return storeViewCnt;
	}



	public void setStoreViewCnt(int storeViewCnt) {
		this.storeViewCnt = storeViewCnt;
	}



	public int getLikeCnt() {
		return likeCnt;
	}



	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}



	public int getMemberNumber() {
		return memberNumber;
	}



	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}



	public String getStoreContent() {
		return storeContent;
	}



	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}



	public int getStoreCommentCnt() {
		return storeCommentCnt;
	}



	public void setStoreCommentCnt(int storeCommentCnt) {
		this.storeCommentCnt = storeCommentCnt;
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



	public String getChannelFileSystemName() {
		return channelFileSystemName;
	}



	public void setChannelFileSystemName(String channelFileSystemName) {
		this.channelFileSystemName = channelFileSystemName;
	}



	public String getHashtagName() {
		return hashtagName;
	}



	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}



	@Override
	public String toString() {
		return "SnsStoreVO [storeNumber=" + storeNumber + ", storeTitle=" + storeTitle + ", storeDate=" + storeDate
				+ ", storeViewCnt=" + storeViewCnt + ", likeCnt=" + likeCnt + ", memberNumber=" + memberNumber
				+ ", storeContent=" + storeContent + ", storeCommentCnt=" + storeCommentCnt + ", storeFileSystemName="
				+ storeFileSystemName + ", channelName=" + channelName + ", channelFileSystemName="
				+ channelFileSystemName + ", hashtagName=" + hashtagName + "]";
	}



	

	
	
	
	
}
