package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RegionDao;
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
		PrintWriter out = resp.getWriter();
		StationDao stationDao = new StationDao();
		RegionDao regionDao = new RegionDao();
		String name = req.getParameter("station");
		if (null != stationDao.findByName(name)) {
			System.out.println("站点重复");
			out.print("station_err");
			return ;
		}
		Double longitude=null;
		Double latitude=null;
		try {
			longitude = Double.valueOf(req.getParameter("longtitude"));
			latitude = Double.valueOf(req.getParameter("latitude"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println("经纬度输入错误");
			out.print("pos_err");
			return ;
		}
		String regionName = req.getParameter("region");
		Region region = regionDao.findByName(regionName);
		if(null == region){
			System.out.println("区域不存在");
			out.print("region_err");
			return ;
		}
		Station newStation = new Station();
		newStation.setPos((int) (stationDao.findCount(Station.class) + 1));
		newStation.setName(name);
		newStation.setLatitude(latitude);
		newStation.setLongitude(longitude);
		newStation.setRegion(region);
		newStation.setUnreferenced(true);
		stationDao.save(newStation);
		System.out.println("成功");
		out.print("suc");
		return ;
	}
}
