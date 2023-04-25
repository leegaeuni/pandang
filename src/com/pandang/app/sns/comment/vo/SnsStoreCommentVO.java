package com.pandang.app.sns.comment.vo;
//select ts.store_number , tsc.store_comment_number , tsc.store_comment_content ,
//tm.member_nickname , tc.channel_name  ,tsc.member_number ,
//tsc.store_comment_date
//from tbl_store ts left join tbl_store_comment tsc
//on ts.store_number = tsc.store_number
//left join tbl_member tm
//on tsc.member_number = tm.member_number
//left join tbl_channel tc
//on tm.member_number = tc.member_number
//where ts.store_number = 1
public class SnsStoreCommentVO {
	
	private int storeNumber;
	private int storeCommentNumber;
	private String storeCommentContent;
	private String memberNickname;
	private String channelName;
	private int memberNumber;
	private String storeCommentDate;
	private String channelFileSystemName;
	
	public SnsStoreCommentVO() {
		// TODO Auto-generated constructor stub
	}


	public int getStoreNumber() {
		return storeNumber;
	}


	public int getStoreCommentNumber() {
		return storeCommentNumber;
	}


	public void setStoreCommentNumber(int storeCommentNumber) {
		this.storeCommentNumber = storeCommentNumber;
	}


	public String getStoreCommentContent() {
		return storeCommentContent;
	}


	public void setStoreCommentContent(String storeCommentContent) {
		this.storeCommentContent = storeCommentContent;
	}


	public String getMemberNickname() {
		return memberNickname;
	}


	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}


	public String getChannelName() {
		return channelName;
	}


	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}


	public int getMemberNumber() {
		return memberNumber;
	}


	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}


	public String getStoreCommentDate() {
		return storeCommentDate;
	}


	public void setStoreCommentDate(String storeCommentDate) {
		this.storeCommentDate = storeCommentDate;
	}


	public String getChannelFileSystemName() {
		return channelFileSystemName;
	}


	public void setChannelFileSystemName(String channelFileSystemName) {
		this.channelFileSystemName = channelFileSystemName;
	}


	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}


	@Override
	public String toString() {
		return "SnsStoreCommentVO [storeNumber=" + storeNumber + ", storeCommentNumber=" + storeCommentNumber
				+ ", storeCommentContent=" + storeCommentContent + ", memberNickname=" + memberNickname
				+ ", channelName=" + channelName + ", memberNumber=" + memberNumber + ", storeCommentDate="
				+ storeCommentDate + ", channelFileSystemName=" + channelFileSystemName + "]";
	}

	
	
	
}
