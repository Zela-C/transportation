package helper;

import java.util.ArrayList;

public class Path implements Cloneable{
	public ArrayList<String> path;
	public ArrayList<Integer> busTime;
	public int time;
	public int transfer;
	
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	
}

