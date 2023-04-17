package com.pandang.app.store.vo;

//store_title 
//store_date 
//store_number 
//store_content o
//store_price o
//store_view_cnt o
//member_number(tbl_store) o 
//store_file_system_name o
//hashtag_number o 
//store_comment_number
//store_comment_content
//store_comment_date
//(store_like도 필요함)
//member_id

public class StoreUpdateVO {
	private String storeTitle;
	private String storeDate;
	private int storeNumber;
	private String storeContent;
	private int storePrice;
	private int storeViewCnt;
	private int memberNumber;
	private int hashtagNumber;
	private String hashtagName;
	private int storeCommentNumber;
	private String storeCommentContent;
	private String storeCommentDate;
	private String channelName;
	private int likeCount;
	private int commentCount;

	public StoreUpdateVO() {
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

	public int getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}

	public String getStoreContent() {
		return storeContent;
	}

	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}

	public int getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}

	public int getStoreViewCnt() {
		return storeViewCnt;
	}

	public void setStoreViewCnt(int storeViewCnt) {
		this.storeViewCnt = storeViewCnt;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getHashtagNumber() {
		return hashtagNumber;
	}

	public void setHashtagNumber(int hashtagNumber) {
		this.hashtagNumber = hashtagNumber;
	}

	public String getHashtagName() {
		return hashtagName;
	}

	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
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

	public String getStoreCommentDate() {
		return storeCommentDate;
	}

	public void setStoreCommentDate(String storeCommentDate) {
		this.storeCommentDate = storeCommentDate;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "StoreUpdateVO [storeTitle=" + storeTitle + ", storeDate=" + storeDate + ", storeNumber=" + storeNumber
				+ ", storeContent=" + storeContent + ", storePrice=" + storePrice + ", storeViewCnt=" + storeViewCnt
				+ ", memberNumber=" + memberNumber + ", hashtagNumber=" + hashtagNumber + ", hashtagName=" + hashtagName
				+ ", storeCommentNumber=" + storeCommentNumber + ", storeCommentContent=" + storeCommentContent
				+ ", storeCommentDate=" + storeCommentDate + ", channelName=" + channelName + ", likeCount=" + likeCount
				+ ", commentCount=" + commentCount + "]";
	}

}