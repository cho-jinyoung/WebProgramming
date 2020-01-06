package bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;

	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://203.230.193.204:3306/201721380";
			String dbID ="201721380";
			String dbPassword="201721380";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate()
	{
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //db error
	}
	
	public int getNext()
	{
		String SQL = "select bbsID from Notice order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public ArrayList<Bbs> getList(int pageNumber)
	{
		String SQL = "select * from Notice where bbsID < ? AND bbsAvilable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsuserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsFileData(rs.getBinaryStream(6));
				bbs.setBbsFileName(rs.getString(7));
				bbs.setBbsCount(rs.getInt(8));
				bbs.setBbsAvailable(rs.getInt(8));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	
	public int write(String bbsTitle, String bbsuserID, String bbsContent, String bbsFileName, int bbsCount)
	{
		File imgFile = new File(bbsFileName);
		String realFileName = imgFile.getName();
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String SQL = "insert into Notice values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsTitle );
			pstmt.setString(3, bbsuserID );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, bbsContent );
			if( fin != null ) pstmt.setBinaryStream(6, fin, (int)imgFile.length() ); //파일 데이터
			pstmt.setString(7, realFileName );
			pstmt.setInt(8,  bbsCount );
			pstmt.setInt(9,  1 );
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int write(String bbsTitle, String bbsuserID, String bbsContent, int bbsCount)
	{
		
		String SQL = "insert into Notice values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsTitle );
			pstmt.setString(3, bbsuserID );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, bbsContent );
			pstmt.setBinaryStream(6, null ); //파일 데이터
			pstmt.setString(7, null );
			pstmt.setInt(8,  bbsCount );
			pstmt.setInt(9,  1 );
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
		
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from Notice where bbsID < ? AND bbsAvilable = 1 order by bbsID desc limit 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "select * from Notice where bbsID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsuserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsFileData(rs.getBinaryStream(6));
				bbs.setBbsFileName(rs.getString(7));
				bbs.setBbsCount(rs.getInt(8) );
				bbs.setBbsAvailable(rs.getInt(9));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int bbsID, String bbsTitle, String bbsuserID, String bbsContent, String bbsFileName)
	{
		File imgFile = new File(bbsFileName);
		String realFileName = imgFile.getName();
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String SQL = "update Notice set bbsTitle=?, bbsuserID=?, bbsContent=?, bbsFileName=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle );
			pstmt.setString(2, bbsuserID );
			pstmt.setString(3, bbsContent );
			pstmt.setString(4, bbsFileName );
			pstmt.setInt(5, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int update(int bbsID, String bbsTitle, String bbsuserID, String bbsContent)
	{
		String SQL = "update Notice set bbsTitle=?, bbsuserID=?, bbsContent=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle );
			pstmt.setString(2, bbsuserID );
			pstmt.setString(3, bbsContent );
			pstmt.setInt(4, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int count(int bbsID)
	{
		String SQL = "update Notice set bbsCount=bbsCount+1 where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int delete(int bbsID)
	{
		String SQL = "update Notice set bbsAvilable=0 where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}