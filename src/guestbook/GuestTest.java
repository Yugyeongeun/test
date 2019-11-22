package guestbook;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class GuestTest {

	public static void main(String[] args) {
		GuestDAO dao = new GuestDAO();
		
		//total(dao);
		List(dao);
		//create(dao);
		//upViewcnt(dao);
		//read(dao);
		//passcheck(dao);
		//update(dao);
		//delete(dao);
	}

	private static void total(GuestDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "길동");
		
		
		
		p("레코드 갯수:"+dao.total(map));
		
	}

	private static void delete(GuestDAO dao) {
		int no = 2;
		if(dao.delete(no)) {
			p("성공");
		}else {
			p("실패");
		}
		
		
	}

	private static void update(GuestDAO dao) {
		GuestDTO dto = dao.read(2);
		dto.setWname("유경은");
		dto.setTitle("안녕");
		dto.setContent("짜장면이다");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}	
		
	}

	private static void passcheck(GuestDAO dao) {
		
		Map map = new HashMap();
		map.put("no",3);
		map.put("passwd", "123");
		if(dao.passcheck(map)) {
			p("올바른 비번입니다.");
		}else {
			p("잘못된 비번입니다.");
		}
		
	}

	private static void read(GuestDAO dao) {
		int no = 2;
		GuestDTO dto = dao.read(no);
		p(dto);
		
	}

	private static void upViewcnt(GuestDAO dao) {
		int no = 2;
		dao.upViewcnt(no);
		
	}

	private static void create(GuestDAO dao) {
		GuestDTO dto = new GuestDTO();
		dto.setWname("박길동");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setPasswd("123");
		
				if(dao.create(dto)) {
			p("성공");
		}else
			p("실패");
		
	}

	private static void List(GuestDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "경자");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<GuestDTO> list = dao.list(map);
		
		Iterator<GuestDTO> iter= list.iterator();
		
		while(iter.hasNext()) {
			GuestDTO dto = iter.next();
			p(dto);
			p("-------------");
		}
	
	}

	private static void p(GuestDTO dto) {
		p("번호: "+dto.getNo());
		p("글쓴이: "+dto.getWname());
		p("제목: "+dto.getTitle());
		p("내용: "+dto.getContent());
		p("날짜: "+dto.getWdate());
		p("조회수: "+dto.getViewcnt());
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}