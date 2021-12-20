package main;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SuamilDAO;
import util.CookieManager;

@WebServlet("/main/main.do")
public class MainController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getParameter("mode")!=null && req.getParameter("mode").equals("logout")) {
			HttpSession session = req.getSession();
			session.removeAttribute("USER_ID");
			session.removeAttribute("USER_NAME");
			session.removeAttribute("USER_EMAIL");
			resp.sendRedirect("../main/main.do");
			return;
		}
		
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user = CookieManager.readCookie(req, "USER_ID");
		req.setAttribute("user", user);
		
		req.getRequestDispatcher("/main/main_servlet.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//폼값받기
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String id_save = req.getParameter("id_save");
		String backUrl = req.getParameter("backUrl");

		//dao생성
		SuamilDAO dao = new SuamilDAO();

		//함수호출
		Map<String, String> memberInfo = dao.memberLogin(id, pass);

		if(memberInfo.get("name")!=null){
			//세션영역에 저장
			session.setAttribute("USER_ID", memberInfo.get("id"));
			session.setAttribute("USER_NAME", memberInfo.get("name"));
			session.setAttribute("USER_EMAIL", memberInfo.get("email"));
	
			//아이디저장 체크여부 판단하기
			if(id_save==null){		
				//체크가 해제된경우(쿠키값을 지움) : 쿠키삭제시에는 빈값으로 만들어주면 됨.
				Cookie ck = new Cookie("USER_ID","");
				ck.setPath(req.getContextPath());
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}
			else{
				//체크가 된경우(쿠키를 생성)
				Cookie ck = new Cookie("USER_ID", id);		
				System.out.println(req.getContextPath());
				ck.setPath(req.getContextPath());		
				ck.setMaxAge(60*60*24*100);		
				resp.addCookie(ck);
			}
		}
		
		if(backUrl==null || backUrl.equals("")){
      		resp.sendRedirect("../main/main.do");
      	}
      	else{
      		resp.sendRedirect(backUrl);
      	}
	}
}
