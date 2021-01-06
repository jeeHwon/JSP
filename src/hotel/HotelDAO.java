package hotel;

import java.sql.*;
import java.util.ArrayList;

public class HotelDAO {

		String url = "jdbc:mysql://localhost:3307/jee";
		String user = "root";
		String password = "1234";
		Connection conn = null;
		
		public HotelDAO() throws Exception {
		
			Class.forName("com.mysql.jdbc.Driver");	
			conn = DriverManager.getConnection(url, user, password);
		}
		
		public ArrayList<HotelDTO> get_room() throws SQLException
		{
			String sql = "select name,id from room order by price asc";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ArrayList<HotelDTO> list = new ArrayList<HotelDTO>();
			while (rs.next()) {
				HotelDTO hdto = new HotelDTO();
				hdto.setId(rs.getInt("id"));
				hdto.setName(rs.getString("name"));
				list.add(hdto);
				
			}
			return list;
		}


}

