package com.pandang.app.sns.vo;
//select
//member_nickname,
//c.channel_name ,
//(select count(*) from tbl_follow where member_number_from = m.member_number) as from_count,
//(select count(*) from tbl_follow where member_number_to = m.member_number) as to_count,
//count(distinct sns_number) as sns_count,
//channel_comment
//from
//tbl_member m
//join tbl_follow f on m.member_number = f.member_number_from 
//left join tbl_sns s on m.member_number = s.member_number 
//join tbl_channel c on m.member_number = c.member_number
//where
//m.member_number = 1
//group by
//member_nickname,
//from_count,
//to_count,
//channel_comment;
public class SnsHeaderVO {
	
	private String memberNickname;
	private String channelName;
	private int fromCount;
	private int toCount;
	private int snsCount;
	private String channelComment;
	private int memberNumber;
	
	public SnsHeaderVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getFromCount() {
		return fromCount;
	}
	public void setFromCount(int fromCount) {
		this.fromCount = fromCount;
	}
	public int getToCount() {
		return toCount;
	}
	public void setToCount(int toCount) {
		this.toCount = toCount;
	}
	public int getSnsCount() {
		return snsCount;
	}
	public void setSnsCount(int snsCount) {
		this.snsCount = snsCount;
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


	public String getChannelName() {
		return channelName;
	}


	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}


	@Override
	public String toString() {
		return "SnsHeaderVO [memberNickname=" + memberNickname + ", channelName=" + channelName + ", fromCount="
				+ fromCount + ", toCount=" + toCount + ", snsCount=" + snsCount + ", channelComment=" + channelComment
				+ ", memberNumber=" + memberNumber + "]";
	}
	
	
	
}
