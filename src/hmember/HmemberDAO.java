package hmember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import hmember.HmemberDTO;
import utility.DBClose;
import utility.DBOpen;

public class HmemberDAO {
	
	public String getGrade(String id) {
		String grade = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade  ");
		sql.append("  from hmember ");
		sql.append(" where id =?   ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				grade=rs.getString("grade");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return grade;
	}
	public String Searchpw(Map map) {
		String passwd = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String mname= (String)map.get("mname");
		String id= (String)map.get("id");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select passwd ");
		sql.append(" from hmember  ");
		sql.append(" where mname =? and id = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt .setString(1, mname);
			pstmt .setString(2,id);
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				passwd = rs.getString("passwd");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		
		
		return passwd;
	}
	
	public String Search(Map map) {
		String id = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String mname= (String)map.get("mname");
	
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select id  ");
		sql.append(" from hmember  ");
		sql.append(" where mname =?   ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt .setString(1, mname);
			
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		
		
		return id;
	}
	
	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		
		StringBuffer sql = new StringBuffer();
		sql.append("  delete from hmember   ");
		sql.append("  where id =?  ");
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public boolean loginCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
ResultSet rs = null;
		
String id = (String)map.get("id");
String pw = (String)map.get("pw");
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) as cnt  ");
		sql.append(" from hmember  ");
		sql.append(" where id = ?   ");
		sql.append(" and passwd = ?  ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			
			int cnt = rs.getInt(1);
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		
		return flag;
	}
	
	
	public boolean update(HmemberDTO dto) {
		boolean flag=false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  UPDATE hmember   ");
		sql.append("  SET ");
		sql.append("  tel=?,  ");
		sql.append("  zipcode=?,   ");
		sql.append("  address1=?,  ");
		sql.append("  address2=?  ");
		sql.append("  WHERE id = ?  ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getZipcode());
			pstmt.setString(3, dto.getAddress1());
			pstmt.setString(4, dto.getAddress2());
			pstmt.setString(5, dto.getId());
			
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt);
		}
		return flag;
	}
	
	public boolean updatePw(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		String id= (String)map.get("id");
		String pw= (String)map.get("pw");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update hmember ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt);
		}
		
		
		
		return flag;
	}
	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		String id= (String)map.get("id");
		String fname= (String)map.get("fname");
		StringBuffer sql = new StringBuffer();
		sql.append("  update hmember ");
		sql.append(" set fname = ?   ");
		sql.append("  where id = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			
			int cnt =pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt);
		}
		
		
		return flag;
	}
	
	public HmemberDTO read(String id) {
		HmemberDTO dto =null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,  mname, tel , zipcode,   ");
		sql.append(" address1, address2, mdate, fname, grade  ");
		sql.append(" from hmember  ");
		sql.append(" where id = ?  ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
			dto=new HmemberDTO();
			dto.setId(rs.getString("id"));
			dto.setMname(rs.getString("mname"));
			dto.setTel(rs.getString("tel"));
			dto.setZipcode(rs.getString("zipcode"));
			dto.setAddress1(rs.getString("address1"));
			dto.setAddress2(rs.getString("address2"));
			dto.setMdate(rs.getString("mdate"));
			dto.setFname(rs.getString("fname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
			}
		
		
		return dto;
	}
	
	public int total(Map map) {
		int total =0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append("  select count(*) from hmember  ");
		
		if(word.trim().length()>0) { //값이 공백이 아니면?
			sql.append("   where  "+col+"  like '%'||?||'%'  ");
					}
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
			rs= pstmt.executeQuery();
			
			rs.next();
			
			total=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		
		
		return total;
	}
		
	
	
	public List<HmemberDTO> list(Map map){
		List<HmemberDTO> list = new ArrayList<HmemberDTO>();
		Connection con  = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno=(Integer)map.get("sno");
		int eno=(Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append("    select id, mname, tel,zipcode, address1, address2,    ");
		sql.append("    fname, r    ");
		sql.append("    from(    ");
		sql.append("    select id, mname, tel, zipcode, address1, address2,    ");
		sql.append("    fname, rownum r    ");
		sql.append("    from(    ");
		sql.append("        select id, mname, tel, zipcode, address1,    ");
		sql.append("        address2, fname    ");
		sql.append("        from hmember    ");

		if(word.trim().length()>0) {
			sql.append("        where   "+col+"   like '%'||?||'%'    ");
		}
		sql.append("        order by mdate desc    ");
		sql.append("        )    ");
		sql.append("    )    ");
		sql.append("    where r >= ? and r <= ?    ");
		
		try {
			int i=1;
			pstmt=con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0) {
				pstmt.setString(i++, word);
			}
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);
					
			rs = pstmt.executeQuery();

			while(rs.next()) {
				HmemberDTO dto = new HmemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setFname(rs.getString("fname"));
			
				list.add(dto); //리스트에 담아줘야지 끄읕!
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}

			return list;
		}
	
	public boolean create(HmemberDTO dto) {
		boolean flag =false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO hmember(id, passwd, mname, tel, zipcode,    ");
		sql.append(" address1,address2,mdate, fname, grade)   ");
		sql.append(" VALUES(?,?,?,?,?,?,?,sysdate,?, 'H' )  ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());			
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			pstmt.setString(8, dto.getFname());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
		
	}
	
	
	public boolean duplicateId(String id) {
	boolean flag =false;
	Connection con = DBOpen.open();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	StringBuffer sql  = new StringBuffer();
	sql.append("  select count(id)  ");
	sql.append("  from hmember  ");
	sql.append("  where id =? ");
	
	try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		rs.next();
		
		int cnt=rs.getInt(1);
		if(cnt>0)flag=true;
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		DBClose.close(con, pstmt,rs);
	}
	
	
	return flag;
	}



}
