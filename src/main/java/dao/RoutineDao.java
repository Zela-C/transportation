package dao;

import java.util.List;

import entity.Bus;
import entity.Station;

public class RoutineDao extends BaseDao<Bus>{
	public RoutineDao() {
		super();
	}

	public List<Bus> getAllRoutines() {
		return findAll(Bus.class);
	}

	public long getRoutineCount() {
		return findCount(Bus.class);
	}
	
	public Bus findByName(String name){
		List<Bus> list = find(" from Bus where name = '"+name+"'") ;
		if(list != null) return list.get(0);
		else return null;
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
