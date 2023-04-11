package com.pandang.app.sns.vo;
//select ts.sns_number , ts.sns_title , ts.sns_content , sns_date,
//count(tsl.sns_number) as like_cnt,
//tsf.sns_file_system_name ,
//tc.channel_name ,
//tcf.channel_file_system_name ,
//ts.member_number 
//from tbl_sns ts
//left join tbl_sns_file tsf 
//on ts.sns_number = tsf.sns_number
//left join tbl_sns_like tsl 
//on ts.sns_number = tsl.sns_number
//left join tbl_member tm 
//on ts.member_number = tm.member_number 
//left join tbl_channel tc 
//on tm.member_number = tc.member_number 
//left join tbl_channel_file tcf 
//on tc.channel_number = tcf.channel_number 
//where ts.sns_number = 1
//group by tsf.sns_file_system_name,
//tc.channel_name ,
//tcf.channel_file_system_name;
public class SnsPostVO {
	private int snsNumber;
	private String snsTitle;
	private String snsContent;
	private String snsDate;
	private int likeCnt;
	private String snsFileSystemName;
	private String channelName;
	private String channelFileSystemName;
	private int memberNumber;
	
	
	public SnsPostVO() {
		// TODO Auto-generated constructor stub
	}


	public int getSnsNumber() {
		return snsNumber;
	}


	public void setSnsNumber(int snsNumber) {
		this.snsNumber = snsNumber;
	}


	public String getSnsTitle() {
		return snsTitle;
	}


	public void setSnsTitle(String snsTitle) {
		this.snsTitle = snsTitle;
	}


	public String getSnsContent() {
		return snsContent;
	}


	public void setSnsContent(String snsContent) {
		this.snsContent = snsContent;
	}


	public String getSnsDate() {
		return snsDate;
	}


	public void setSnsDate(String snsDate) {
		this.snsDate = snsDate;
	}


	public int getLikeCnt() {
		return likeCnt;
	}


	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}


	public String getSnsFileSystemName() {
		return snsFileSystemName;
	}


	public void setSnsFileSystemName(String snsFileSystemName) {
		this.snsFileSystemName = snsFileSystemName;
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


	public int getMemberNumber() {
		return memberNumber;
	}


	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}


	@Override
	public String toString() {
		return "snsPostVO [snsNumber=" + snsNumber + ", snsTitle=" + snsTitle + ", snsContent=" + snsContent
				+ ", snsDate=" + snsDate + ", likeCnt=" + likeCnt + ", snsFileSystemName=" + snsFileSystemName
				+ ", channelName=" + channelName + ", channelFileSystemName=" + channelFileSystemName
				+ ", memberNumber=" + memberNumber + "]";
	}
	
	
	
	
	
}
