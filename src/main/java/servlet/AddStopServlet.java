package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StationDao;
import entity.Station;

@WebServlet(name="AddStopServlet" , urlPatterns={"/addstop"})
public class AddStopServlet extends HttpServlet{
	private static final long serialVersionUID = 8865419503632224425L;
		
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String name=req.getParameter("stop");

		StationDao dao=new StationDao();
		Station stop=dao.findByName(name);
		if(stop==null)
			resp.sendRedirect("balala.jsp");
		else{
			
		}
	}
}
