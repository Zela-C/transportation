package dao;

import java.io.Serializable;

import entity.User;

public class UserDao extends BaseDao<User> {
	
	
	
	public UserDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean isUserExist(Serializable name){
		if(get(User.class,name)==null)
			return false;
		else return true;
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
}
