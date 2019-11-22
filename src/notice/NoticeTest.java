package notice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import notice.NoticeDAO;



public class NoticeTest {

	public static void main(String[] args) {
		NoticeDAO dao = new NoticeDAO();
		
		//total(dao);
		//List(dao);
		//create(dao);
		upViewcnt(dao);
		//read(dao);
		//passcheck(dao);
		//update(dao);
		//delete(dao);
	}

	private static void total(NoticeDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "내일");
		
		
		
		p("레코드 갯수:"+dao.total(map));
		
	}

	private static void delete(NoticeDAO dao) {
		int no = 5;
		if(dao.delete(no)) {
			p("성공");
		}else {
			p("실패");
		}
		
		
	}

	private static void update(NoticeDAO dao) {
		NoticeDTO dto = dao.read(2);
		
		dto.setTitle("안녕");
		dto.setContent("짜장면이다");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}	
		
	}

	private static void passcheck(NoticeDAO dao) {
		
		Map map = new HashMap();
		map.put("no",3);
		map.put("passwd", "1234");
		if(dao.passCheck(map)) {
			p("올바른 비번입니다.");
		}else {
			p("잘못된 비번입니다.");
		}
		
	}

	private static void read(NoticeDAO dao) {
		int no = 2;
		NoticeDTO dto = dao.read(no);
		p(dto);
		
	}

	private static void upViewcnt(NoticeDAO dao) {
		int no = 2;
		dao.viewcnt(no);
		
	}

	private static void create(NoticeDAO dao) {
		NoticeDTO dto = new NoticeDTO();
		
		dto.setTitle("내일 수업 없음");
		dto.setContent("나는 내일 알바감");
		dto.setPasswd("1234");
		
				if(dao.create(dto)) {
			p("성공");
		}else
			p("실패");
		
	}

	private static void List(NoticeDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "경자");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<NoticeDTO> list = dao.list(map);
		
		Iterator<NoticeDTO> iter= list.iterator();
		
		while(iter.hasNext()) {
			NoticeDTO dto = iter.next();
			p(dto);
			p("-------------");
		}
	
	}

	private static void p(NoticeDTO dto) {
		p("번호: "+dto.getNo());
		p("글쓴이: "+dto.getId());
		p("제목: "+dto.getTitle());
		p("내용: "+dto.getContent());
		p("날짜: "+dto.getWdate());
		//p("조회수: "+dto.getViewcnt());
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}