package dao;

import java.util.List;

import entity.Bus;
import entity.Station;

public class RoutineDao extends BaseDao<Bus>{
	public RoutineDao() {
		super();
	}

	public List<Bus> getAllStations() {
		return findAll(Bus.class);
	}

	public long getStationsCount() {
		return findCount(Bus.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Bus> findByPage(String hql, int pageNo, int pageSize) {
		// 创建查询
		return getSessionFactory().openSession().createQuery(hql)
				// 执行分页
				.setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
	}
	
}
