package bean;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import dao.StationDao;
import entity.Station;

public class StationBean {
	private StationDao stationDao = new StationDao();
	private static final int pageSize = 10;

	public StationBean() {
		// doNothing
	}

	// without search criteria
	public List<HashMap<String, Object>> getByPage(int curPage) {
		// 按页查询
		List<Station> stations = stationDao.findByPage("select en from " + Station.class.getSimpleName() + " en",
				curPage, pageSize);
		return getList(stations, curPage);
	}

	// search with some criteria
	public List<HashMap<String, Object>> searchByPage(String name, int curPage) {
		List<Station> stations = stationDao.findByPage("from Station where name like '%" + name + "%'", curPage,
				pageSize);
		return getList(stations, curPage);
	}

	private List<HashMap<String, Object>> getList(List<Station> stations, int curPage) {
		List<HashMap<String, Object>> list = new LinkedList<HashMap<String, Object>>();
		// 遍历该页所有对象
		for (Station station : stations) {
			// 初始化
			HashMap<String, Object> map = new HashMap<String, Object>();
			Integer pos = station.getPos();
			String name = station.getName();
			Double longitude = station.getLongitude();
			Double latitude = station.getLatitude();

			map.put("pos", pos);
			map.put("name", name);
			map.put("longitude", longitude);
			map.put("latitude", latitude);

			list.add(map);
		}
		return list;
	}
	
}
