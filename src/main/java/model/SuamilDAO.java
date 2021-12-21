package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class SuamilDAO {
	
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public SuamilDAO() {
		try {
			Class.forName(DBInfo.DRIVER);
			con = DriverManager.getConnection(DBInfo.URL, DBInfo.ID, DBInfo.PW);
			System.out.println("Homepy DB Success^^*");
		}
		catch(Exception e) {
			System.out.println("Homepy DB Fail;");
			e.printStackTrace();
		}		
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	public int memberRegist(MemberDTO dto) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO sua_members ( "
				+ " id,pass,name,tel,mobile,email,zipcode,"
				+ " addr1,addr2) "
				+ " VALUES ( "
				+ " ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getMobile());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getZipcode());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}	
		
	public Map<String, String> memberLogin(String id,
			String pwd){
		
		Map<String, String> maps = 
				new HashMap<String, String>();
		
		String query = "SELECT id, pass, name, email FROM "
				+ " sua_members WHERE id=? AND pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			
			//결과셋이 있는 경우에만 레코드를 읽어온다.
			if(rs.next()) {		
				//Map에 추가할때는 put()메소드 사용함.
				maps.put("id", rs.getString(1));
				maps.put("pass", rs.getString(2));
				maps.put("name", rs.getString("name"));
				maps.put("email", rs.getString("email"));
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch(Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		
		return maps;
	}
	
	//회원정보 가져오기
	public MemberDTO getMemberInfo(String id)
	{		
		MemberDTO dto = new MemberDTO();
		
		String query = " "
			+"SELECT * FROM sua_members "
			+" WHERE id=?";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setZipcode(rs.getString(7));
				dto.setAddr1(rs.getString(8));
				dto.setAddr2(rs.getString(9));
			}
		}
		catch(Exception e) {
			System.out.println("회원정보가져오기 중 "
					+ " 예외발생");
			e.printStackTrace();
		}	
		
		return dto;
	}
	
	//아이디/비번 찾기
	public MemberDTO findMemberIdPw(String p_name, String p_id, String p_email)
	{		
		MemberDTO dto = new MemberDTO();
		String query = null;
			
		if(p_name!=null && p_id!=null && p_email!=null) {
			query = " "
				+"SELECT * FROM sua_members "
				+" WHERE name=? and id=? and email=?";
		}
		else {
			query = " "
					+"SELECT * FROM sua_members "
					+" WHERE name=? and email=?";
		}
		
		try {
			
			psmt = con.prepareStatement(query);
			if(p_name!=null && p_id!=null && p_email!=null) {
				psmt.setString(1, p_name);
				psmt.setString(2, p_id);
				psmt.setString(3, p_email);
			}
			else {
				psmt.setString(1, p_name);
				psmt.setString(2, p_email);
			}
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setZipcode(rs.getString(7));
				dto.setAddr1(rs.getString(8));
				dto.setAddr2(rs.getString(9));
			}
		}
		catch(Exception e) {
			System.out.println("회원정보가져오기 중 예외발생");
			e.printStackTrace();
		}	
		
		return dto; 
	}
	
	//회원정보 수정하기
	public int memberModify(MemberDTO dto) 
	{		
		int affected = 0;
		
		try {
			String query = "UPDATE sua_members SET"
					+ " pass=?,name=?,tel=?,mobile=?,email=?,"
					+ " zipcode=?,addr1=?,addr2=? "
					+ " WHERE id=?";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getTel());
			psmt.setString(4, dto.getMobile());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getZipcode());
			psmt.setString(7, dto.getAddr1());
			psmt.setString(8, dto.getAddr2());
			
			psmt.setString(9, dto.getId());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("회원정보수정 중 예외발생");
			e.printStackTrace();
		}
				
		return affected;
	}
	
	//게시물 갯수를 카운트하기 위한 메소드
	public int getTotalRecordCount(Map<String,Object> map) {		
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM sua_board ";
		String whereQuery = "";
		
		if(map.get("Word")!=null) 
		{
			if(map.get("Column").equals("both")) 
			{
				whereQuery +=" WHERE "
				  +" title LIKE '%"+ map.get("Word") +"%' "
				  +" OR "
				  +" content LIKE '%"+ map.get("Word") +"%' ";
			}
			else {
				whereQuery +=" WHERE "+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' ";
			}			
		}
		//멀티게시판 추가
		if(whereQuery.equals("")) {
			whereQuery += " WHERE b_flag=? ";	
		}
		else {
			whereQuery += " AND b_flag=? ";
		}		
		
		query += whereQuery;
		System.out.println("query="+query);
		
		try {
			psmt = con.prepareStatement(query);
			
			//멀티게시판 추가
			psmt.setString(1, map.get("b_flag").toString() );
			
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
			System.out.println("totalCount="+totalCount);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
				
		return totalCount;
	}
	
	//게시판 리스트 가져오기(검색처리, 페이지처리)
	public List<BoardDTO> selectList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = " "		
			+" SELECT * FROM ( " 
			+"	 SELECT Tb.*, ROWNUM rNum FROM ( "
			+"	    SELECT B.*, M.name FROM sua_board B "
			+"		  INNER JOIN sua_members M"
			+"			ON M.id=B.id WHERE b_flag=? ";

		if(map.get("Word")!=null) 
		{
			if(map.get("Column").equals("both")) 
			{
				query +=" AND "
				  + "title LIKE '%"+ map.get("Word") +"%' "
				  +" OR "
				  +" content LIKE '%"+ map.get("Word") +"%' ";
			}
			else {
				query +=" AND "+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' ";
			}			
		}				
		query += " "
		    +"    	ORDER BY num DESC "
		    +"    ) Tb "
		    +" ) "
		    +" WHERE rNum BETWEEN ? AND ?";			
		
		System.out.println("쿼리문:"+ query);			
			
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
			
			//멀티게시판 추가
			psmt.setString(1, map.get("b_flag").toString() );
			
			psmt.setString(2, map.get("start").toString());
			psmt.setString(3, map.get("end").toString());			
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();
			
			//5.결과셋의 갯수만큼 반복
			while(rs.next()) {
				
				//6.결과셋을 하나씩 DTO객체에 저장
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString(3));
				dto.setPostDate(rs.getDate(4));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				
				//7번은 첨부파일
				dto.setChumfile(rs.getString(7));
				
				//b_flag가 추가되므로 name은 한칸뒤로 밀리게 된다.
				//join에 의한 name 필드추가
				dto.setName(rs.getString(9));
				
				//7.DTO객체를 컬렉션에 추가
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public Map<String, BoardDTO> calendarList(String dateParam){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		Map<String, BoardDTO> calendar = new HashMap<String, BoardDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT B.*, to_char(postdate, 'yyyy-mm-dd') pdate "
				+ " FROM sua_board B"
				+ " WHERE b_flag='program' AND to_char(postdate, 'yyyy-mm')='"+dateParam+"' "
				+ " ORDER BY postdate ASC";		
		System.out.println("쿼리문:"+ query);			
			
		try {
			psmt = con.prepareStatement(query);			
			rs = psmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString("pdate")+" "+rs.getString("title"));
				
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPostDateStr(rs.getString("pdate"));
				
				calendar.put(rs.getString("pdate"), dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return calendar;
	}
	
	
	//게시판 글쓰기 처리
	public int insertWrite(BoardDTO dto) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query;
			if(dto.getPostDateStr()==null) {
				query = "INSERT INTO sua_board ( "
						+ " num,title,content,id,visitcount,b_flag,chumfile) "
						+ " VALUES ( "
						+ " seq_borad_num.NEXTVAL, ?, ?, ?, 0, ?, ?)";	
			}
			else {
				query = "INSERT INTO sua_board ( "
						+ " num,title,content,id,visitcount,b_flag,chumfile,postdate) "
						+ " VALUES ( "
						+ " seq_borad_num.NEXTVAL, ?, ?, ?, 0, ?, ?, ?)";
			}
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getB_flag());
			psmt.setString(5, dto.getChumfile());
			if(dto.getPostDateStr()!=null) 
				psmt.setString(6, dto.getPostDateStr());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	//게시판 상세보기
	public BoardDTO selectView(String num) {
		
		BoardDTO dto = new BoardDTO();
		
		String query = " "
			+"SELECT B.*, M.name, M.email FROM "
			+" sua_board B INNER JOIN "
			+" sua_members M "
			+" ON B.id = M.id "
			+" WHERE num=?";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
								
				/* DB에서 추출한후 DTO객체에 담기전 미리 줄바꿈 처리를				
				진행한다. */
				dto.setContent(rs.getString("content").replace("\r\n", "<br/>"));
				dto.setPostDate(rs.getDate(4));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				
				//첨부파일
				dto.setChumfile(rs.getString(7));
				
				//member테이블과 join된 결과추가
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				
				//멀티게시판
				dto.setB_flag(rs.getString("b_flag"));
			}
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}				
				
		return dto;
	}
	
	//조회수 증가시키기
	public void updateVisitCount(String num) {
		
		String query = "UPDATE sua_board SET "
			+ " visitcount=visitcount+1 "
			+ " WHERE num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("조회수 증가시 예외발생");
			e.printStackTrace();
		}		
	}
	
	//메인화면 공지사항 출력
	public List<BoardDTO> noticeList(){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = " "		
			+" SELECT * FROM ( " 
			+"	 SELECT Tb.*, ROWNUM rNum FROM ( "
			+"	    SELECT B.num, B.title, to_char(B.postdate, 'yyyy.mm.dd') pdate FROM sua_board B "
			+"		  INNER JOIN sua_members M"
			+"			ON M.id=B.id "
			+ "           WHERE b_flag='notice' ";
		query += " "
		    +"    	ORDER BY num DESC "
		    +"    ) Tb "
		    +" ) "
		    +" WHERE rNum BETWEEN ? AND ?";			
		
		System.out.println("쿼리문:"+ query);			
			
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, "1");
			psmt.setString(2, "4");			
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();
			
			//5.결과셋의 갯수만큼 반복
			while(rs.next()) {
				
				//6.결과셋을 하나씩 DTO객체에 저장
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPostDateStr(rs.getString("pdate"));
								
				//7.DTO객체를 컬렉션에 추가
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	//게시물 수정하기
	public int updateEdit(BoardDTO dto) {
		
		int affected = 0;
		try {
			String query = "UPDATE sua_board SET"
					+ " title=?, content=?, chumfile=?"
					+ " WHERE num=?";
			System.out.println("query="+query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getChumfile());
			psmt.setString(4, dto.getNum());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("update중 예외발생");
			e.printStackTrace();
		}
		
		return affected;		
	}
	
	
	//게시물 삭제하기
	public int delete(BoardDTO dto) {
		int affected = 0;
		try {
			String query = "DELETE FROM sua_board "
					+ " WHERE num=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, dto.getNum());
			 
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		
		return affected;	
	}
}
