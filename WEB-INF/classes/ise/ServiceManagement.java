package ise;

import java.net.UnknownHostException;
import java.util.Date;
import java.util.*;
import java.sql.*;


public class ServiceManagement{
	private String dbUrl="jdbc:mysql://localhost:3306/";
	private String dbName="ise";
	private String driver="com.mysql.jdbc.Driver";
	private String dbUsername="root"; 
	private String dbPassword="root";
	
	public ServiceManagement(){

	}

	public boolean registerUser(String username, String password, String email){
		Connection conn=null;
		Statement st=null;
		try{
			Class.forName(driver).newInstance();
			conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
			st=conn.createStatement();

			ResultSet rs=st.executeQuery("SELECT * FROM user");
			if(rs.next()){
				String savedUsername=rs.getString("username");
				if(savedUsername.equals(username)){
					return false;
				}

			}
			st.executeUpdate("INSERT INTO user(username, password, email) VALUES('"+username+"', '"+password+"', '"+email+"')");

			rs.close();
			st.close();
			conn.close();
		}catch(Exception e){}
		return true;
	}

	public boolean login(String username, String password){
		Connection conn=null;
		Statement st=null;
		try{
			Class.forName(driver).newInstance();
			conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
			st=conn.createStatement();

			ResultSet rs=st.executeQuery("SELECT * FROM user");
			while(rs.next()){
				String savedUsername=rs.getString("username");
				String savedPassword=rs.getString("password");
				if(savedUsername.equals(username) && savedPassword.equals(password)){
					return true;
				}

			}

			rs.close();
			st.close();
			conn.close();
		}catch(Exception e){}
		return false;
	}

	public boolean createFlug(String von, String nach, String abfahrt, double preis, int platz, int flugsteig, int terminal, String status, String username){
		Connection conn=null;
		Statement st=null;
		try{
			Class.forName(driver).newInstance();
			conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
			st=conn.createStatement();

			
			st.executeUpdate("INSERT INTO flug(von, nach, abfahrt, preis, platz, flugsteig, terminal, user, status) VALUES('"+von+"', '"+nach+"', '"+abfahrt+"', "+preis+", "+platz+", "+flugsteig+", "+terminal+", '"+username+"', '"+status+"')");

		
			st.close();
			conn.close();
		}catch(Exception e){}
		return true;
	}

	public boolean createBuchung(int flugid, int userid, int platz){
		Connection conn=null;
		Statement st=null;
		try{
			Class.forName(driver).newInstance();
			conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
			st=conn.createStatement();

			
			st.executeUpdate("INSERT INTO buchung(flugid, userid, platz) VALUES("+flugid+", "+userid+", "+platz+")");

		
			st.close();
			conn.close();
		}catch(Exception e){}
		return true;
	}

}