package dao;

import java.util.List;

import entity.Company;

public class CompanyDao extends BaseDao<Company> {
	
	public CompanyDao() {
		super();
	}
	
	public List<Company> getAllCompanys() {
		return findAll(Company.class);
	}
	
	public Company findByName(String name){
		List<Company> list = find("from Company where name = '" + name + "'");
		if (null != list && 0 != list.size())
			return list.get(0);
		else
			return null;
	}
}
