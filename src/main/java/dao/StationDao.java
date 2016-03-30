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

	@SuppressWarnings("unchecked")
	@Override
	public List<Station> findByPage(String hql, int pageNo, int pageSize) {
		// 创建查询
		return getSessionFactory().openSession().createQuery(hql)
				// 执行分页
				.setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
	}
}
