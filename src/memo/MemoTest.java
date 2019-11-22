package memo;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MemoTest {

	public static void main(String[] args) {
		MemoDAO dao = new MemoDAO();
		
		total(dao);
		//List(dao);
		// read(dao);
		// update(dao);
		// create(dao);
		// delete(dao);
	}

	private static void total(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "아이씨");
		p("레코드 갯수"+dao.total(map));
		
	}

	private static void delete(MemoDAO dao) {
		// TODO Auto-generated method stub
		int memono =120;
		
		try {
			if(dao.delete(memono)) {
				p("성공");
			}else {
				p("실패");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	private static void create(MemoDAO dao) {
		MemoDTO dto = dao.read(1);
		dto.getTitle();
		dto.getContent();
		p(dto);
		
	}
		
	private static void Update(MemoDAO dao) {
		MemoDTO dto = dao.read(1);
		dto.setTitle(" 메모수정 ");
		dto.setContent(" 토익시험 아주잘봄 ");

		if (dao.update(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void read(MemoDAO dao) {
		int memono = 1;
		MemoDTO dto = dao.read(memono);

		p(dto);

	}

	private static void List(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "오늘");
		map.put("sno", 1);
		map.put("eno", 5);
		
		
		List<MemoDTO> list = dao.list(map);
		Iterator<MemoDTO> iter = list.iterator();

		while (iter.hasNext()) {
			MemoDTO dto = iter.next();
			p(dto);
			p("---------------");
		}

	}

	private static void p(MemoDTO dto) {
		p("번호: " + dto.getMemono());
		p("제목: " + dto.getTitle());
		p("내용: " + dto.getContent());
		p("날짜: " + dto.getWdate());
		p("조회수: " + dto.getViewcnt());

	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}

