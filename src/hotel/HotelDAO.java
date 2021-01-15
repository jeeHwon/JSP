package hotel;

import java.sql.*;
import java.time.LocalDate;
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
		
		public void insert (ReserveDTO rdto, String userid) throws SQLException {
			//date_add('2021-01-05', interval 숙박일day)
			String outday = "date_add('"+rdto.getInday()+"', interval "+rdto.getSuk()+" day) ";
			String sql = "insert into reserve(rid,name,phone,inday,outday, ";
			sql = sql+"inwon1,inwon2,inwon3,opt1,opt2,opt3,suk_price,etc_price, ";
			sql = sql+"tot_price,writeday,userid) values (?,?,?,?,"+outday+",?,?,?,?,?,?,?,?,?,now(),?)";
			
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
			pstmt.setString(14, userid);
			
			pstmt.executeUpdate();
			conn.close();
			
		}
		
		public ReserveDTO get_reserve(String userid) throws SQLException {
			String sql = "select * from reserve where userid='"+userid+"' order by id desc limit 1";
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
		
		public int room_state(String rid, String xday) throws SQLException {	//룸 아이디와 'yyyy-mm-dd'받아 예약확인 
			String sql = "select count(*) as cnt from reserve where inday <=? and outday >? and rid =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, xday);
			pstmt.setString(2, xday);
			pstmt.setString(3, rid);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt("cnt");
		}
		
		public int suk_check(String year, String month, String day, String rid) throws SQLException {
			int yy = Integer.parseInt(year);
			int mm = Integer.parseInt(month);
			int dd = Integer.parseInt(day);
			LocalDate inday = LocalDate.of(yy, mm, dd);
			int chk = 0;
			
			for(int i=1; i<9; i++) {
				LocalDate xday = inday.plusDays(i);
				chk = i;
				String sql = "select * from reserve where inday <= ? and outday > ? and rid = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, xday.toString());
				pstmt.setString(2, xday.toString());
				pstmt.setString(3, rid);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) { //레코드 있으면 true, 없으면 false
					break;		//for문 종료
				}
			}
			return chk;			// 숙박 가능한 일수를 리턴
		}
		
		public void member_ok(MemberDTO mdto) throws SQLException {
			String sql = "insert into hotel_member(name, userid, pwd, phone, writeday) ";
			sql = sql + " values (?,?,?,?,now()) ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, mdto.getName());
	        pstmt.setString(2, mdto.getUserid());
	        pstmt.setString(3, mdto.getPwd());
	        pstmt.setString(4, mdto.getPhone());
	        pstmt.executeUpdate();
	        
	        conn.close();
			
		}
		
		public boolean isMember(String userid, String pwd) throws SQLException {
			String sql = "select * from hotel_member where userid=? and pwd=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			
			return rs.next();
		}
		
		public int isUserid(String userid) throws SQLException {
			// 아이디가 존재하면 1, 아니면 0
			String sql = "select count(*) as num from Hotel_member where userid='"+userid+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			
			//아이디가 존재하면 1, 아니면 0
			return rs.getInt("num");
			
		}
		
		public MemberDTO mypage(String userid) throws SQLException {
			String sql = "select * from hotel_member where userid = '"+userid+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			MemberDTO mdto = new MemberDTO();
			mdto.setName(rs.getString("name"));
			mdto.setPhone(rs.getString("phone"));
			
			return mdto;
			
			
			
		}
		
		public ArrayList<ReserveDTO> my_reserve(String userid) throws SQLException {
			String sql = "select r2.name, r1.inday, r1.outday, r1.opt1, r1.opt2, r1.opt3";
			sql = sql + ", r1.writeday from reserve as r1, room as r2 ";
			sql = sql + " where r1.rid = r2.id and userid = '"+userid+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();
			while(rs.next()) {
				ReserveDTO rdto = new ReserveDTO();
				rdto.setRoomname(rs.getString("name"));
				rdto.setInday(rs.getString("inday"));
				rdto.setOutday(rs.getString("outday"));
				rdto.setOpt1(rs.getInt("opt1"));
				rdto.setOpt2(rs.getInt("opt2"));
				rdto.setOpt3(rs.getInt("opt3"));
				rdto.setWriteday(rs.getString("writeday"));
				
				list.add(rdto);
			}
			return list;
		}

		
		
		
}

