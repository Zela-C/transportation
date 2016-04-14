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
import helper.StationPool;

@WebServlet(name = "DeleteStopServlet", urlPatterns = { "/deletestop" })
public class DeleteStopServlet extends HttpServlet {
	private static final long serialVersionUID = -6152661531015995138L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		System.out.println("你妈炸了！！！！");
		Integer id = Integer.valueOf(req.getParameter("id"));
		Integer pos = Integer.valueOf(req.getParameter("pos"));
		Integer dir = Integer.valueOf(req.getParameter("dir"));
		RoutineDao routineDao = new RoutineDao();
		Routine routine = routineDao.get(Routine.class, id);
		// delete correspond data in the static station pool.
		// StationPool.deleteFromList(pos);

		// delete correspond data in database.
		if (dir == 0) {
			routine.setPosTo(cutFromString(routine.getPosTo(), pos));
			routine.setLenTo(cutFromString(routine.getLenTo(), pos));
			routine.setStartTimeTo(cutFromString(routine.getStartTimeTo(), pos));
			routine.setEndTimeTo(cutFromString(routine.getEndTimeTo(), pos));
		} else {
			routine.setPosFrom(cutFromString(routine.getPosFrom(), pos));
			routine.setLenFrom(cutFromString(routine.getLenFrom(), pos));
			routine.setStartTimeFrom(cutFromString(routine.getStartTimeFrom(), pos));
			routine.setEndTimeFrom(cutFromString(routine.getEndTimeFrom(), pos));
		}
		routineDao.update(routine);

		// check if the station is no longer be referenced.
		List<Routine> routineList = routineDao.getAllRoutines();
		String position = String.valueOf(pos);
		boolean isRefered = false;
		for (Routine bus : routineList) {
			if (bus.getPosTo().contains(position + '$') || bus.getPosFrom().contains(position + '$')
					|| bus.getPosTo().contains('$' + position) || bus.getPosFrom().contains('$' + position)) {
				isRefered = true;
				break;
			}
		}
		if (false == isRefered) {
			StationDao stationDao = new StationDao();
			Station station = stationDao.findByPos(pos);
			station.setUnreferenced(1);
			stationDao.update(station);
		}

		// refresh the page
		resp.sendRedirect("routine.jsp");
	}

	private String cutFromString(String from, Integer pos) {
		if (pos == 0)// 删除第一个
			return from.substring(from.indexOf('$') + 1);
		int start = -1;
		int end = -1;
		for (int i = 0, index = 0; i < from.length(); i++) {
			if (from.charAt(i) != '$') {
				continue;
			}
			if (index + 1 == pos) {
				start = i;
			} else if (index == pos) {
				end = i;
				break;
			}
			index++;
		}
		if (-1 == end)// 删除最后一个
			return from.substring(0, start);
		else
			return from.substring(0, start) + from.substring(end);
	}
}
