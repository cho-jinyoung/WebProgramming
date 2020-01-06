package bbs;

import java.io.InputStream;

public class Bbs {
	private int bbsID;
	private String bbsTitle;
	private String bbsuserID;
	private String bbsDate;
	private String bbsContent;
    private InputStream bbsFileData;
    private String bbsFileName;
	private int bbsCount;
	private int bbsAvailable;

	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsuserID() {
		return bbsuserID;
	}
	public void setBbsuserID(String bbsuserID) {
		this.bbsuserID = bbsuserID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public InputStream getBbsFileData() {
		return bbsFileData;
	}
	public void setBbsFileData(InputStream bbsFileData) {
		this.bbsFileData = bbsFileData;
	}
	public String getBbsFileName() {
		return bbsFileName;
	}
	public void setBbsFileName(String bbsFileName) {
		this.bbsFileName = bbsFileName;
	}
	public int getBbsCount() {
		return bbsCount;
	}
	public void setBbsCount(int bbsCount) {
		this.bbsCount = bbsCount;
	}

}