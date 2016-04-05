package servlet;

import java.io.IOException;
import java.security.MessageDigest;
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
		String name = request.getParameter("username");
		String pwd = bytesToMD5(request.getParameter("password").getBytes());
		UserDao userDao = new UserDao();
		System.out.println(pwd);
		if(!userDao.isUserExist(name)){
			System.out.println("Error in username");
		}
		else if(!userDao.checkPassWord(name, pwd)){
			System.out.println("Error in password");
		}
		else{ 
			int admin=(int)userDao.getUserAuthority(name);
			System.out.println(admin);
			request.getSession().setAttribute("authority", admin);
			response.sendRedirect("path.jsp");
		}
		
	}
	public String bytesToHex(byte[] bytes) {
		StringBuffer md5str = new StringBuffer();
		//把数组每一字节换成16进制连成md5字符串
		int digital;
		for (int i = 0; i < bytes.length; i++) {
			 digital = bytes[i];
			if(digital < 0) {
				digital += 256;
			}
			if(digital < 16){
				md5str.append("0");
			}
			md5str.append(Integer.toHexString(digital));
		}
		return md5str.toString();
	}
	
	//把字节数组转换成md5
	public String bytesToMD5(byte[] input) {
		String md5str = null;
		try {
			//创建一个提供信息摘要算法的对象，初始化为md5算法对象
			MessageDigest md = MessageDigest.getInstance("MD5");
			//计算后获得字节数组
			byte[] buff = md.digest(input);
			//把数组每一字节换成16进制连成md5字符串
			md5str = bytesToHex(buff);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return md5str;
	}
}
