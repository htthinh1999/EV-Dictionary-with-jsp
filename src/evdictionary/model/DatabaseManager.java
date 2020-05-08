package evdictionary.model;
import java.sql.*;
import java.util.*;

public class DatabaseManager {
	
	public static Hashtable<String, String> dictionary = new Hashtable<String, String>();
	public static List<String> words = new ArrayList<String>();
	
	Connection con;
	Statement stm;
	ResultSet rs;

	String url = "jdbc:mysql://localhost:3306/edict";
	String username = "root";
	String password = "a123";
	
	
	public void GetData() {
		try {
			con = DriverManager.getConnection(url, username, password);
			stm = con.createStatement();
			String sql = "SELECT * FROM tbl_edict";
			rs = stm.executeQuery(sql);
			
			while(rs.next()) {
				String word = rs.getString(2);
				String detail = rs.getString(3);
				
				words.add(word);
				dictionary.put(word, detail);
				
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
