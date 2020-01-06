package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.Part;

public class diaryDAO {
	
	private Connection conn;

	private ResultSet rs;
	
	public diaryDAO() {
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
		String SQL = "select diaryID from Diary order by diaryID desc";
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
	
	public ArrayList<diaryBbs> getList(int pageNumber)
	{
		String SQL = "select * from Diary where diaryID < ? AND diaryAvailable = 1 order by diaryID desc limit 10";
		ArrayList<diaryBbs> list = new ArrayList<diaryBbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				diaryBbs bbs = new diaryBbs();
				bbs.setDiaryID(rs.getInt(1) );
				bbs.setDiaryTitle(rs.getString(2));
				bbs.setDiaryuserID(rs.getString(3));
				bbs.setDiaryDate(rs.getString(4));
				bbs.setDiaryContent(rs.getString(5));
				bbs.setDiaryOption(rs.getString(6));
				bbs.setDiaryW(rs.getString(7));
				bbs.setDiaryAvailable(rs.getInt(8));				
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	

	public int write(String diaryTitle, String diaryuserID, String diaryContent, String diaryOption, String diaryW)
	{
		String SQL = "insert into Diary values (?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, diaryTitle );
			pstmt.setString(3, diaryuserID );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, diaryContent );
			pstmt.setString(6, diaryOption );
			pstmt.setString(7, diaryW );
			pstmt.setInt(8, 1 );	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from Diary where diaryID < ? AND diaryAvailable = 1 order by diaryID desc limit 10";
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
	
	public diaryBbs getBbs(int diaryID) {
		String SQL = "select * from Diary where diaryID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, diaryID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				diaryBbs bbs = new diaryBbs();
				bbs.setDiaryID(rs.getInt(1) );
				bbs.setDiaryTitle(rs.getString(2));
				bbs.setDiaryuserID(rs.getString(3));
				bbs.setDiaryDate(rs.getString(4));
				bbs.setDiaryContent(rs.getString(5));
				bbs.setDiaryOption(rs.getString(6));
				bbs.setDiaryW(rs.getString(7));
				bbs.setDiaryAvailable(rs.getInt(8));	
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	public int update(int diaryID, String diaryTitle, String diaryuserID, String diaryContent, String diaryOption, String diaryW)
	{
		String SQL = "update Diary set diaryTitle=?, diaryuserID=?, diaryContent=?, diaryOption=?, diaryW=?, diaryDate=? where diaryID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, diaryTitle );
			pstmt.setString(2, diaryuserID );
			pstmt.setString(3, diaryContent );
			pstmt.setString(4, diaryOption );
			pstmt.setString(5, diaryW );
			pstmt.setString(6, getDate() );
			pstmt.setInt(7, diaryID );	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int delete(int diaryID)
	{
		String SQL = "update Diary set diaryAvailable=0 where diaryID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, diaryID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	

}
