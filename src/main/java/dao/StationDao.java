package dao;

import java.util.List;

import entity.Station;

public class StationDao extends BaseDao<Station> {
	public StationDao() {
		super();
	}

	public List<Station> getAllStations() {
		return findAll(Station.class);
	}

	public long getStationsCount() {
		return findCount(Station.class);
	}
	
	public Station findByName(String name){
		List<Station> list = find("select distinct * from Station where name = "+name) ;
		if(!list.isEmpty()&& list != null) return list.get(0);
		else return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Station> findByPage(String hql, int pageNo, int pageSize) {
		// 创建查询
		return getSessionFactory().openSession().createQuery(hql)
				// 执行分页
				.setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
	}
	
	public String getStationName(Integer id){
		return get(Station.class,id).getName();
	}
}
