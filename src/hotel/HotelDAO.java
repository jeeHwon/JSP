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
		
		//사용자가 선택한 방의 정보 가져오기
		public HotelDTO select_room(String id) throws SQLException {
			String sql = "select * from room where id= "+id;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			
			HotelDTO hdto = new HotelDTO();
			hdto.setId(rs.getInt("id"));
			hdto.setName(rs.getString("name"));
			hdto.setMax_in(rs.getInt("max_in"));
			hdto.setMin_in(rs.getInt("min_in"));
			hdto.setPrice(rs.getInt("price"));
			
			return hdto;
		}
		
		public void insert (ReserveDTO rdto) throws SQLException {
			//date_add('2021-01-05', interval 숙박일day)
			String outday = "date_add('"+rdto.getInday()+"', interval "+rdto.getSuk()+" day) ";
			String sql = "insert into reserve(rid,name,phone,inday,outday, ";
			sql = sql+"inwon1,inwon2,inwon3,opt1,opt2,opt3,suk_price,etc_price, ";
			sql = sql+"tot_price,writeday) values (?,?,?,?,"+outday+",?,?,?,?,?,?,?,?,?,now())";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRid());
			pstmt.setString(2, rdto.getName());
			pstmt.setString(3, rdto.getPhone());
			pstmt.setString(4, rdto.getInday());
			pstmt.setInt(5, rdto.getInwon1());
			pstmt.setInt(6, rdto.getInwon2());
			pstmt.setInt(7, rdto.getInwon3());
			pstmt.setInt(8, rdto.getOpt1());
			pstmt.setInt(9, rdto.getOpt2());
			pstmt.setInt(10, rdto.getOpt3());
			pstmt.setInt(11, rdto.getSuk_price());
			pstmt.setInt(12, rdto.getEtc_price());
			pstmt.setInt(13, rdto.getTot_price());
			
			pstmt.executeUpdate();
			conn.close();
			
		}
		
		public ReserveDTO get_reserve(String phone) throws SQLException {
			String sql = "select * from reserve where phone='"+phone+"' order by id desc limit 1";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			ReserveDTO rdto =  new ReserveDTO();
			rdto.setId(rs.getInt("id"));
			rdto.setRid(rs.getInt("rid"));
			rdto.setName(rs.getString("name"));
			rdto.setPhone(rs.getString("phone"));
			rdto.setInday(rs.getString("inday"));
			rdto.setOutday(rs.getString("outday"));
			rdto.setInwon1(rs.getInt("inwon1"));
			rdto.setInwon2(rs.getInt("inwon2"));
			rdto.setInwon3(rs.getInt("inwon3"));
			rdto.setOpt1(rs.getInt("opt1"));
			rdto.setOpt2(rs.getInt("opt2"));
			rdto.setOpt3(rs.getInt("opt3"));
			rdto.setSuk_price(rs.getInt("suk_price"));
			rdto.setEtc_price(rs.getInt("etc_price"));
			rdto.setTot_price(rs.getInt("tot_price"));
			rdto.setWriteday(rs.getString("writeday"));
			
			return rdto;
					
		}
		


}

