package helper;

import java.util.ArrayList;
import java.util.List;

import dao.StationDao;
import entity.Station;

public class StationPool {
	private ArrayList<String> list=null;
	public StationPool(){
		list=new ArrayList<String>();
		StationDao dao=new StationDao();
		List<Station> stationList=dao.findAll(Station.class);
		for(Station station:stationList){
			list.add(station.getName());
		}
	}
	public ArrayList<String> getList() {
		return list;
	}
	public void setList(ArrayList<String> list) {
		this.list = list;
	}
	
}
