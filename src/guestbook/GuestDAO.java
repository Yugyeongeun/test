package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import utility.DBClose;
import utility.DBOpen;

public class GuestDAO {
	
	public boolean checkRefnum(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum )");
		sql.append(" from guest ");
		sql.append(" where refnum = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
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
	public boolean reply_create(GuestDTO dto){
		boolean flag= false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO guest(no, wname, title, content, passwd, wdate,  ");
		sql.append(" grpno, indent, ansnum,refnum)  ");
		sql.append(" VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM  guest), ");
		sql.append(" ?, ?, ?, ?, sysdate,");
		sql.append(" ?,?,?,? ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent()+1); //0이어서 +1해줘야해
			pstmt.setInt(7, dto.getAnsnum()+1); //얘도
			pstmt.setInt(8, dto.getNo());
			
			
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

	public void reply_ansnum(Map map) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		int grpno = (Integer) map.get("grpno");
		int ansnum = (Integer) map.get("ansnum");

		StringBuffer sql = new StringBuffer();
		sql.append(" update guest   ");
		sql.append(" SET   ");
		sql.append("            ansnum = ansnum + 1   ");
		sql.append(" where   ");
		sql.append(" grpno = ?  ");
		sql.append(" and   ");
		sql.append(" ansnum > ?   "); // 부모의

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public GuestDTO reply_read(int no) {
		GuestDTO dto = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append("select no,grpno,indent,ansnum,title ");
		sql.append(" from guest ");
		sql.append(" where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new GuestDTO();
				dto.setNo(rs.getInt("no"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setTitle(rs.getString("title"));

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from guest ");
		sql.append(" where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;

	}

	public boolean update(GuestDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update guest");
		sql.append(" set wname = ? ,title = ? ,content = ? ");
		sql.append(" where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNo());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean passcheck(Map map) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int no = (Integer) map.get("no");
		String passwd = (String) map.get("passwd");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT count(no) as cnt ");
		sql.append(" from guest ");
		sql.append(" where no = ? ");
		sql.append(" and passwd= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();

			rs.next();

			int cnt = rs.getInt("cnt");

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return flag;

	}

	public GuestDTO read(int no) {
		GuestDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select no,wname,title,content,viewcnt,wdate ");
		sql.append(" from guest ");
		sql.append(" where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new GuestDTO();
				dto.setNo(no);
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getString("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;

	}

	public void upViewcnt(int no) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" update guest ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where no = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public boolean create(GuestDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO guest(no, wname, title, content, passwd, wdate,grpno)  ");
		sql.append(" VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM guest), ");
		sql.append(" ?, ?, ?, ?, sysdate,");
		sql.append("(SELECT NVL(MAX(grpno), 0) + 1 as no FROM guest))");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;

	}
	
	public int total(Map map) {
		int total =0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append("  select count(*) from guest  ");
		if(word.length()>0 && col.equals("title_content")) {
			sql.append("       where title like '%' ||?||'%'  ");
			sql.append("       or content like '%' ||?||'%'  ");
		}else if(word.length()>0) {
			sql.append("       where "+col+" like '%'||?||'%' ");
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.length()>0 && col.equals("title_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			}else if(word.length()>0) {
				pstmt.setString(1, word);
			}
			
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt,rs);
		}
	
		return total;
	}
	

	public List<GuestDTO> list(Map map) {
		List<GuestDTO> list = new ArrayList<GuestDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno =(Integer)map.get("sno");
		int eno =(Integer)map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append("  select no, wname, title, viewcnt,to_char(wdate,'yyyy-mm-dd')wdate,  ");
		sql.append("  grpno,indent,ansnum, r  ");
		sql.append("  from(  ");
		sql.append("          select no, wname, title, viewcnt,wdate,  ");
		sql.append("          grpno,indent,ansnum,rownum r  ");
		sql.append("          from(   SELECT no, wname, title,  viewcnt, wdate, grpno, indent, ansnum  ");
		sql.append("          FROM guest ");
		if(word.length()>0 && col.equals("title_content")) {
			sql.append("       where title like '%'||?||'%'  ");
			sql.append("       or content like '%'||?||'%'  ");
		}else if(word.length()>0) {
			sql.append("       where "+col+" like '%'||?||'%' ");
		}
		sql.append("            ORDER BY grpno DESC, ansnum  ");
		sql.append("            )  ");
		sql.append("      )     ");
		sql.append("  where r>=? and r<=?  ");

		try {
			int i =0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.length()>0 && col.equals("title_content")) {
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			}else if(word.length()>0) {
				pstmt.setString(++i, word);
			}

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GuestDTO dto = new GuestDTO();

				dto.setNo(rs.getInt("no"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getString("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));

				list.add(dto);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

}
