package bean;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import dao.RoutineDao;
import dao.StationDao;
import entity.Routine;

public class RoutineBean {
	private RoutineDao routineDao = new RoutineDao();
	private StationDao stationDao = new StationDao();
	int count = (int) routineDao.getRoutineCount();
	int curPage = 1;
	private static final int pageSize = 10;

	public List<HashMap<String, Object>> getByPage(int curPage) {
		// 按页查询
		List<Routine> routines = routineDao.findByPage("select en from " + Routine.class.getSimpleName() + " en",
				curPage, pageSize);
		return getList(routines,curPage);
	}
	
	public List<HashMap<String,Object>> searchByPage(String name,int curPage){
		List<Routine> routines = routineDao.findByPage("from Routine where name like '%"+name+"%'",
				curPage, pageSize);
		return getList(routines,curPage);	
	}
	
	private List<HashMap<String, Object>> getList(List<Routine> routines , int curPage){
		List<HashMap<String, Object>> list = new LinkedList<HashMap<String, Object>>();
		// 遍历该页所有对象
		for (Routine routine : routines) {
			// 初始化
			HashMap<String, Object> map = new HashMap<String, Object>();
			String[] posTo = routine.getPosTo().trim().split("\\$");
			String[] endTimeTo = routine.getEndTimeTo().trim().split("\\$");
			String[] startTimeTo = routine.getStartTimeTo().trim().split("\\$");
			for (int i =0;i<posTo.length;i++) {
				posTo[i] = stationDao.findByPos(Integer.valueOf(posTo[i])).getName();
			}
			String from = routine.getPosFrom().trim();

			String[] posFrom = null;
			String[] endTimeFrom = null;
			String[] startTimeFrom = null;
			if (null != from && !from.equals("")) {// 不是环线
				posFrom = from.split("\\$");
				endTimeFrom = routine.getEndTimeFrom().trim().split("\\$");
				startTimeFrom = routine.getStartTimeFrom().trim().split("\\$");

				for (int i = 0 ; i<posFrom.length;i++) {
					posFrom[i]= stationDao.findByPos(Integer.valueOf(posFrom[i])).getName();
				}
			}
			map.put("id", routine.getId());	
			map.put("time", routine.getTime());
			map.put("length", routine.getLength());
			map.put("name", routine.getName());
			map.put("stationNameTo", posTo);
			map.put("endTimeTo", endTimeTo);
			map.put("startTimeTo", startTimeTo);
			map.put("stationNameFrom", posFrom);
			map.put("endTimeFrom", endTimeFrom);
			map.put("startTimeFrom", startTimeFrom);
			list.add(map);
		}
		return list;

	}
}
