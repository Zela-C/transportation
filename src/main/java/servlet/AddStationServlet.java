package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StationDao;
import entity.Region;
import entity.Station;


@WebServlet(name="AddStationServlet" , urlPatterns={"/addstation"})
public class AddStationServlet extends HttpServlet {

	private static final long serialVersionUID = 1159925882638305032L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String name=req.getParameter("station");
		Double longitude=Double.valueOf(req.getParameter("longtitude"));
		Double latitude=Double.valueOf(req.getParameter("latitude"));
		String regionName=req.getParameter("region");
		
		Region region=new Region();
		region.setId(1);
		region.setName(regionName);

		StationDao dao=new StationDao();
		Station newStation=new Station();
		newStation.setPos((int)(dao.findCount(Station.class)+1));
		newStation.setName(name);
		newStation.setLatitude(latitude);
		newStation.setLongitude(longitude);
		newStation.setRegion(region);
		dao.save(newStation);
		
		resp.sendRedirect("station.jsp");
	}
}
