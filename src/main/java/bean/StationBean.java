package bean;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StationDao;
import entity.Station;

public class StationBean {
	private HttpServletResponse response = null;
	private HttpServletRequest request = null;
	private StationDao stationDao = new StationDao();
	private int count = (int) stationDao.getStationsCount();
	private int curPage = 1;
	private static final int pageSize = 10;
	private List<Station> stations=null;
	
	public void pre() throws IOException {
		String param = request.getParameter("curPage");
		if (null == param)
			curPage = 1;
		else
			curPage = Integer.valueOf(param);
		if (curPage < 1 || curPage > count / 10 + 1) {
			response.sendRedirect("/transportation/station.jsp");
		}
		List<Station> stations = stationDao.findByPage("select en from " + Station.class.getSimpleName() + " en",
				curPage, pageSize);
	}

	public void inflateContent() throws IOException {
		pre();
	}

	public void generatePageIndex() {

	}
}
