package dao;

import java.util.List;

import entity.Region;
import entity.Station;

public class RegionDao extends BaseDao<Region>{
	
	public RegionDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Region findByName(String name){
		List<Region> list = find("from Region where name = '" + name + "'");
		if (null != list && 0 != list.size())
			return list.get(0);
		else
			return null;
	}

}
