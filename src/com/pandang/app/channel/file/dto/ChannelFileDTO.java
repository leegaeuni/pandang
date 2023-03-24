package com.pandang.app.channel.file.dto;

public class ChannelFileDTO {
	private String channelFileSystemName;
	private String channelFileOriginalName;
	private int channelNumber;
	
	public ChannelFileDTO() {}
	
	public String getChannelFileSystemName() {
		return channelFileSystemName;
	}
	public void setChannelFileSystemName(String channelFileSystemName) {
		this.channelFileSystemName = channelFileSystemName;
	}
	public String getChannelFileOriginalName() {
		return channelFileOriginalName;
	}
	public void setChannelFileOriginalName(String channelFileOriginalName) {
		this.channelFileOriginalName = channelFileOriginalName;
	}
	public int getChannelNumber() {
		return channelNumber;
	}
	public void setChannelNumber(int channelNumber) {
		this.channelNumber = channelNumber;
	}

	@Override
	public String toString() {
		return "ChannelFileDTO [channelFileSystemName=" + channelFileSystemName + ", channelFileOriginalName="
				+ channelFileOriginalName + ", channelNumber=" + channelNumber + "]";
	}

	
	
}
