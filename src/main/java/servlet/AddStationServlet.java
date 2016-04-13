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

@WebServlet(name = "AddStationServlet", urlPatterns = { "/addstation" })
public class AddStationServlet extends HttpServlet {

	private static final long serialVersionUID = 1159925882638305032L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		StationDao dao = new StationDao();
		String name = req.getParameter("station");
		if (null != dao.findByName(name)) {
			// TODO 站点重复，弹出错误
		}
		Double longitude=null;
		Double latitude=null;
		try {
			longitude = Double.valueOf(req.getParameter("longtitude"));
			latitude = Double.valueOf(req.getParameter("latitude"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println("经纬度输入错误");
		}
		String regionName = req.getParameter("region");

		// 目前只有松江区
		Region region = new Region();
		region.setId(1);
		region.setName(regionName);

		Station newStation = new Station();
		newStation.setPos((int) (dao.findCount(Station.class) + 1));
		newStation.setName(name);
		newStation.setLatitude(latitude);
		newStation.setLongitude(longitude);
		newStation.setRegion(region);
		
		dao.save(newStation);

		resp.sendRedirect("station.jsp");
	}
}
