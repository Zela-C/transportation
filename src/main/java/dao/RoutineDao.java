package dao;

import java.util.List;

import org.hibernate.Session;

import entity.Routine;

public class RoutineDao extends BaseDao<Routine> {
	public RoutineDao() {
		super();
	}

	public List<Routine> getAllRoutines() {
		return findAll(Routine.class);
	}

	public long getRoutineCount() {
		return findCount(Routine.class);
	}

	public Routine findByName(String name) {
		List<Routine> list = find("select distinct * from routine where name = " + name);
		if (list != null)
			return list.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Routine> findByPage(String hql, int pageNo, int pageSize) {
		Session session = getSessionFactory().openSession();
		// 创建查询
		List<Routine> list = session.createQuery(hql)
				// 执行分页
				.setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
		session.close();
		return list;
	}

}
