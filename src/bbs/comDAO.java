package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class comDAO {
	private Connection conn;

	private ResultSet rs;
	
	public comDAO() {
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
	
	public ArrayList<comBbs> getList(int pageNumber)
	{
		String SQL = "select * from Com where  comID < ? AND comAvailable = 1";
		ArrayList<comBbs> list = new ArrayList<comBbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comBbs bbs = new comBbs();
				bbs.setComID(rs.getInt(1) );
				bbs.setComNum(rs.getInt(2) );
				bbs.setComUserID(rs.getString(3));
				bbs.setComDate(rs.getString(4));
				bbs.setComText(rs.getString(5));
				bbs.setComAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	public int getNext()
	{
		String SQL = "select comID from Com order by comID desc";
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
	public int write(int comNum, String comUserID, String comText)
	{
		
		String SQL = "insert into Com values (?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setInt(2, comNum );
			pstmt.setString(3, comUserID );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, comText );
			pstmt.setInt(6,  1 );
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public comBbs getBbs(int comID) {
		String SQL = "select * from Com where comID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, comID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				comBbs bbs = new comBbs();
				bbs.setComID(rs.getInt(1) );
				bbs.setComNum(rs.getInt(2) );
				bbs.setComUserID(rs.getString(3));
				bbs.setComDate(rs.getString(4));
				bbs.setComText(rs.getString(5));
				bbs.setComAvailable(rs.getInt(6));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	public int update(int comID, String comUserID, String comText)
	{
		String SQL = "update Com set comUserID=?, comText=? where comID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, comUserID );
			pstmt.setString(2, comText );
			pstmt.setInt(3, comID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int delete(int comID)
	{
		String SQL = "update Com set comAvailable=0 where comID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, comID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
