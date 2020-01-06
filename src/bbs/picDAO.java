package bbs;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.Part;

public class picDAO {
	
	private Connection conn;

	private ResultSet rs;

	public picDAO() {
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
		String SQL = "select picId from Picture order by picId desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //db error
	}
	
	public int write(String picText, String picFileName, String picuserID, int picNice) 
	{
	
		File imgFile = new File(picFileName);
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String SQL = "insert into Picture values (?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, picuserID );
			pstmt.setString(3, getDate() );
			pstmt.setString(4, picFileName );
			if( fin != null ) pstmt.setBinaryStream(5, fin, (int)imgFile.length() );
			pstmt.setString(6, picText );
			pstmt.setInt(7, picNice);
			pstmt.setInt(8, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0; //db error
	}
	
	public picBbs getBbs(int picId) {
		String SQL = "select * from Picture where picId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, picId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				picBbs bbs = new picBbs();
				bbs.setPicId(rs.getInt(1) );
				bbs.setPicuserID(rs.getString(2));
				bbs.setPicDate(rs.getString(3));
				bbs.setPicFileName(rs.getString(4));
				bbs.setPicFile(rs.getBinaryStream(5));
				bbs.setPicText(rs.getString(6));
				bbs.setPicNice(rs.getInt(7));
				bbs.setPicAvailable(rs.getInt(8));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}

	public ArrayList<picBbs> getList(int pageNumber)
	{
		String SQL = "select * from Picture where picId < ? AND picAvailable = 1 order by picId desc limit 10";
		ArrayList<picBbs> list = new ArrayList<picBbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				picBbs bbs = new picBbs();
				bbs.setPicId(rs.getInt(1) );
				bbs.setPicuserID(rs.getString(2));
				bbs.setPicDate(rs.getString(3));
				bbs.setPicFileName(rs.getString(4));
				bbs.setPicFile(rs.getBinaryStream(5));
				bbs.setPicText(rs.getString(6));
				bbs.setPicNice(rs.getInt(7));
				bbs.setPicAvailable(rs.getInt(8));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from Picture where picId < ? AND picAvailable = 1 order by picId desc limit 10";
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
	
	public int update(int picId, String picText, String picFileName, String picuserID )
	{
		File imgFile = new File(picFileName);
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String SQL = "update Picture set picuserID=?, picText=?, picFile=? where picId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);		
			pstmt.setString(1, picuserID );
			pstmt.setString(2, picText );
			if( fin != null ) pstmt.setBinaryStream(3, fin, (int)imgFile.length() );
			pstmt.setInt(4, picId);	
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update(int picId, String picText, String picuserID )
	{
		String SQL = "update Picture set picuserID=?, picText=? where picId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, picuserID );
			pstmt.setString(2, picText );
			pstmt.setInt(3, picId);	

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}

	public int delete(int picId)
	{
		String SQL = "update Picture set picAvailable=0 where picId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, picId );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int nice(int picId)
	{
		String SQL = "update Picture set picNice=picNice+1 where picId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, picId );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}

