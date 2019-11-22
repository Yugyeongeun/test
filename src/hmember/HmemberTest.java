package hmember;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import hmember.HmemberDTO;

public class HmemberTest {

	public static void main(String[] args) {
		HmemberDAO dao = new HmemberDAO();

		// idCheck(dao);
		// create(dao);
		// list(dao);
		// total(dao);
		// read(dao);
		update(dao);
	}

	private static void update(HmemberDAO dao) {
		HmemberDTO dto = dao.read("user2");
		dto.setTel("010-8564-4657");
		dto.setZipcode("0000");
		dto.setAddress1("관악구");
		dto.setAddress2("구구구");
		
		if (dao.update(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void read(HmemberDAO dao) {
		HmemberDTO dto = dao.read("user1");
		p(dto);

	}

	private static void total(HmemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "user1");
		p("레코드 갯수:" + dao.total(map));

	}

	private static void list(HmemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<HmemberDTO> list = dao.list(map);
		Iterator<HmemberDTO> iter = list.iterator();

		while (iter.hasNext()) {
			HmemberDTO dto = iter.next();
			p(dto);
			p("----------");
		}

	}

	private static void create(HmemberDAO dao) {
		HmemberDTO dto = new HmemberDTO();
		dto.setId("user4");
		dto.setPasswd("1234");
		dto.setMname("코코");
		dto.setTel("111-111");
		dto.setZipcode("111-123");
		dto.setAddress1("서울시");
		dto.setAddress2("감자맛집");
		dto.setFname("member.jpg");

		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void idCheck(HmemberDAO dao) {
		if (dao.duplicateId("user1")) {
			p("중복");
		} else {
			p("사용가능");
		}

	}

	private static void p(HmemberDTO dto) {
		p("id:" + dto.getId());
		p("이름 :" + dto.getMname());
		p("전화번호:" + dto.getTel());
		p("우편번호:" + dto.getZipcode());
		p("주소:" + dto.getAddress1());
		p("상세주소:" + dto.getAddress2());
		p("사진:" + dto.getFname());
		p("등록날짜:" + dto.getMdate());

	}

	private static void p(String string) {
		System.out.println(string);

	}

}
