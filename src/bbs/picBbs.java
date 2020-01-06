package bbs;

import java.io.InputStream;


public class picBbs {
	private int picId;
    private String picuserID;
    private String picDate;
	private String picFileName;
	private InputStream picFile;
	private String picText;
	private int picNice;
	private int picAvailable;
	
	public int getPicId() {
		return picId;
	}
	public void setPicId(int picId) {
		this.picId = picId;
	}
	public String getPicuserID() {
		return picuserID;
	}
	public void setPicuserID(String picuserID) {
		this.picuserID = picuserID;
	}
	public String getPicDate() {
		return picDate;
	}
	public void setPicDate(String picDate) {
		this.picDate = picDate;
	}
	public String getPicFileName() {
		return picFileName;
	}
	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	public InputStream getPicFile() {
		return picFile;
	}
	public void setPicFile(InputStream picFile) {
		this.picFile = picFile;
	}
	public String getPicText() {
		return picText;
	}
	public void setPicText(String picText) {
		this.picText = picText;
	}
	public int getPicAvailable() {
		return picAvailable;
	}
	public void setPicAvailable(int picAvailable) {
		this.picAvailable = picAvailable;
	}
	public int getPicNice() {
		return picNice;
	}
	public void setPicNice(int picNice) {
		this.picNice = picNice;
	}
}