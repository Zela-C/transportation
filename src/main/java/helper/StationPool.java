package helper;

import java.util.ArrayList;
import java.util.List;

import dao.StationDao;
import entity.Station;

public class StationPool {
	private static ArrayList<String> list = null;

	private static void initList(){
		list = new ArrayList<String>();
		StationDao dao = new StationDao();
		List<Station> stationList = dao.findAll(Station.class);
		for (Station station : stationList) {
			list.add(station.getName());
		}
	}

	public static ArrayList<String> getList() {
		if(null == list)
			initList();
		return list;
	}
	
	public static boolean deleteFromList(Integer pos){
		if(null != list && list.size()>pos)
			list.remove(pos);
		return false;
	}
}
