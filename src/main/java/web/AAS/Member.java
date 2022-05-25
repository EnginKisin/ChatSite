package web.AAS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Member {
	
	private int userID;
	private String userName;
	private String email;
	private String registerDate;
	private String password_;
	private String birthDate;
	private String gender;
	private String privelege;
	
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	
	public void setuserID(int userID) {
		this.userID = userID;
	}
	public int getUserID() {
		return userID;
	}
	public String getPrivelege() {
		return privelege;
	}
	public void setPrivelege(String privelege) {
		this.privelege = privelege;
	}
}
