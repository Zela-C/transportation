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

	public Station findByName(String name) {

		List<Station> list = find("from Station where name = '" + name + "'");
		System.out.println("查询的结果：" + list.size());
		if (null != list && 0 != list.size())
			return list.get(0);
		else
			return null;
	}

	public Station findByPos(Integer pos) {
		List<Station> list = find("from Station where pos = '" + pos + "'");
		System.out.println("查询的结果：" + list.size());
		if (null != list && 0 != list.size())
			return list.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Station> findByPage(String hql, int pageNo, int pageSize) {
		// 创建查询
		return getSessionFactory().openSession().createQuery(hql)
				// 执行分页
				.setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
	}

	@Override
	public List<Station> find(String hql) {
		return super.find(hql);
	}

	public String getStationName(Integer pos) {
		return get(Station.class, findByPos(pos).getId()).getName();
	}
}
