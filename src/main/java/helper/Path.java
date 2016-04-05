package helper;

import java.util.ArrayList;
import java.util.List;

public class Path implements Cloneable{
	public ArrayList<String> path;
	public ArrayList<Integer> busTime;
	public double time;
	public int transfer;
	
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	
}

