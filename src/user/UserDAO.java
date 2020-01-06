package user;

import java.sql.*;

import bbs.Bbs;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword)
	{
		String SQL = "select userPassword , userAvailable From UserDB where userID  =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			
			rs = pstmt.executeQuery();
			if( rs.next())
			{
				if(rs.getString(1).equals(userPassword)) {
					if(rs.getInt(2)==1)
						return 1; //login success
					else 
						return -3;
				}
				else
					return 0; //password error
			}
			return -1; //id not exist
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; //db error
	}
	
	public int join(User user)
	{
		String SQL = "insert into UserDB values (?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getPhone());
			pstmt.setString(5,user.getGender());
			pstmt.setInt(6,1);
			return pstmt.executeUpdate();
	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public User getBbs(String userID) {
		String SQL = "select * from UserDB where userID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User bbs = new User();
				bbs.setUserID(rs.getString(1) );
				bbs.setUserPassword(rs.getString(2));
				bbs.setUserName(rs.getString(3));
				bbs.setPhone(rs.getString(4));				
				bbs.setGender(rs.getString(5));
				bbs.setUserAvailable(rs.getInt(6));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	public int update(String userName, String userID, String userPassword, String phone, String gender)
	{
				
		String SQL = "update UserDB set userName=?, userPassword=?, phone=?, gender=? where userId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userName );
			pstmt.setString(2, userPassword );
			pstmt.setString(3, phone );
			pstmt.setString(4, gender );
			pstmt.setString(5, userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int reupdate(String userName, String userID, String userPassword, String phone, String gender)
	{
				
		String SQL = "update UserDB set userName=?, userPassword=?, phone=?, gender=?, userAvailable=1 where userId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName );
			pstmt.setString(2, userPassword );
			pstmt.setString(3, phone );
			pstmt.setString(4, gender );
			pstmt.setString(5, userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int delete(String userID)
	{
		String SQL = "update UserDB set userAvailable=0 where userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
