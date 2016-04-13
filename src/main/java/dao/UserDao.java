package dao;

import java.io.Serializable;
import java.util.List;

import entity.Station;
import entity.User;

public class UserDao extends BaseDao<User> {
	public UserDao() {
		super();
	}

	public boolean isUserExist(Serializable name){
		if(get(User.class,name)==null)
			return false;
		else return true;
	}
	
	public boolean isEmailExist(Serializable email){
		List<User> list = find("from User where email = '" + email + "'");
		System.out.println("查询的结果：" + list.size());
		if (null != list && 0 != list.size())
			return true;
		else
			return false;
	}
	
	public boolean checkPassWord(Serializable name,Serializable pwd){
		User user = get(User.class,name);
		if(user==null)
			return false;
		if(user.getPassWord().equals(pwd)){
			return true;
		}
		else return false;
	}
	
	public int getUserAuthority(Serializable name){
		User user=((User)get(User.class,name));
		return user==null?-1:user.getIsAdmin();
	}
	
}
