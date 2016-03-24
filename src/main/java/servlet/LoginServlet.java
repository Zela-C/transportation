package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet(name="Login" , urlPatterns={"/login"})
public class LoginServlet extends HttpServlet{

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charSet=utf-8");
		
		String name = request.getParameter("name");
		String pwd = request.getParameter("passWord");
		UserDao userDao = new UserDao();
		if(!userDao.isUserExist(name)){
			
		}
		else if(!userDao.checkPassWord(name, pwd)){
			
		}
		else{
			request.getRequestDispatcher("/balala.jsp").forward(request, response);
		}
		
	}

}
