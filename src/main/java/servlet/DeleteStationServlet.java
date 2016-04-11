package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RoutineDao;
import dao.StationDao;
import entity.Routine;
import entity.Station;

@WebServlet(name = "DeleteStationServlet", urlPatterns = { "/deletestation" })
public class DeleteStationServlet extends HttpServlet {
	private static final long serialVersionUID = -4366693297024664604L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		System.out.println("你妈炸了！！！！");
		Integer pos = Integer.valueOf(req.getParameter("pos"));
		StationDao stationDao = new StationDao();
		RoutineDao routineDao = new RoutineDao();
		List<Routine> routineList = routineDao.getAllRoutines();
		for (Routine bus : routineList) {
			if (bus.getPosTo().contains(String.valueOf(pos) + '$') || bus.getPosFrom().contains(String.valueOf(pos) + '$')
					|| bus.getPosTo().contains('$' + String.valueOf(pos))
					|| bus.getPosFrom().contains('$' + String.valueOf(pos))) {
				resp.sendRedirect("balala.jsp");
				break;
			}
		}
		stationDao.delete(Station.class, stationDao.findByPos(pos).getId());
		List<Station> list = stationDao.find("from Station where pos>" + pos);
		if (!list.isEmpty()) {
			for (Station station : list) {
				station.setPos(station.getPos() - 1);
				stationDao.update(station);
			}
		}
		resp.sendRedirect("station.jsp");
	}
}
