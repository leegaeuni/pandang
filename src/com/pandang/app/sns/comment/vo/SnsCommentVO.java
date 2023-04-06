package com.pandang.app.sns.comment.vo;

//select ts.sns_number , tsc.sns_comment_number , tsc.sns_comment_content ,
//tm.member_nickname , tc.channel_name  , tcf.channel_file_system_name , 
//tsc.sns_comment_date 
//from tbl_sns ts join tbl_sns_comment tsc 
//on ts.sns_number = ts.sns_number 
//left join tbl_member tm
//on tsc.member_number = tm.member_number 
//left join tbl_channel tc 
//on tm.member_number = tc.member_number 
//left join tbl_channel_file tcf 
//on tc.channel_number = tcf.channel_number 
//where ts.sns_number = 1;

public class SnsCommentVO {
	private int snsNumber;
	private int snsCommentNumber;
	private String snsCommentContent;
	private String memberNickname;
	private String channelName;
	private String channelFileSystemName;
	private String snsCommentDate;
	
	
	public SnsCommentVO() {
		// TODO Auto-generated constructor stub
	}


	public int getSnsNumber() {
		return snsNumber;
	}


	public void setSnsNumber(int snsNumber) {
		this.snsNumber = snsNumber;
	}


	public int getSnsCommentNumber() {
		return snsCommentNumber;
	}


	public void setSnsCommentNumber(int snsCommentNumber) {
		this.snsCommentNumber = snsCommentNumber;
	}


	public String getSnsCommentContent() {
		return snsCommentContent;
	}


	public void setSnsCommentContent(String snsCommentContent) {
		this.snsCommentContent = snsCommentContent;
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


	public String getChannelFileSystemName() {
		return channelFileSystemName;
	}


	public void setChannelFileSystemName(String channelFileSystemName) {
		this.channelFileSystemName = channelFileSystemName;
	}


	public String getSnsCommentDate() {
		return snsCommentDate;
	}


	public void setSnsCommentDate(String snsCommentDate) {
		this.snsCommentDate = snsCommentDate;
	}


	@Override
	public String toString() {
		return "SnsCommentVO [snsNumber=" + snsNumber + ", snsCommentNumber=" + snsCommentNumber
				+ ", snsCommentContent=" + snsCommentContent + ", memberNickname=" + memberNickname + ", channelName="
				+ channelName + ", channelFileSystemName=" + channelFileSystemName + ", snsCommentDate="
				+ snsCommentDate + "]";
	}
	
	
	
	
	
	
	
}
