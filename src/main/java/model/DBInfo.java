package model;

public interface DBInfo {

	String DRIVER = "oracle.jdbc.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String ID = "suamil";
	String PW = "1234";
	
	String loginPage = "../member/login.jsp";
}
