package servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Array;

import dao.*;
import entity.Bus;
import entity.Station;

@WebServlet(name = "pathFind", urlPatterns = { "/findPath" })
public class PathServlet extends HttpServlet {
	final int MAXN = 680000;
	StationDao stationDao;
	RoutineDao routineDao;

	class Path {
		List<Integer> path;
		List<Integer> busTime;
		double time;
		int transfer;
	}

	class Edge {
		int from;
		int to;
		int next;
	}

	int numOfEdges;
	int head[] = new int[MAXN];
	int numOfBus;
	int numOfStations;
	int startId, endId;
	int idOfStation[] = new int[MAXN];
	boolean isBus[] = new boolean[MAXN];
	boolean hasStation[] = new boolean[MAXN];
	boolean vis[] = new boolean[MAXN];
	Edge edges[] = new Edge[MAXN * 2];
	List<List<Integer>> pathes;
	ArrayList<Path> ret;

	void addEdge(int from, int to) {
		edges[numOfEdges].from = from;
		edges[numOfEdges].to = to;
		edges[numOfEdges].next = head[from];
		head[from] = numOfEdges++;
	}

	void constructGraph() {
		numOfEdges = 0;
		numOfStations = 0;
		Arrays.fill(head, -1);
		Arrays.fill(hasStation, false);
		Arrays.fill(isBus, false);
		Arrays.fill(vis, false);

		List<Bus> routines = routineDao.findAll(Bus.class);
		numOfBus = routines.size();
		int cnt = 0;
		for (Bus routine : routines) {
			isBus[cnt] = true;
			String[] idTo = routine.getIdTo().trim().split("\\$");

			for (int i = 0; i < idTo.length; i++) {
				int id = Integer.valueOf(idTo[i]);
				if (!hasStation[id]) {
					hasStation[id] = true;
					idOfStation[id] = numOfBus + id;
				}
				addEdge(cnt, idOfStation[id]);
				addEdge(idOfStation[id], cnt);
			}

			String from = routine.getIdFrom().trim();
			String[] idFrom = null;

			if (null != from && !from.equals("")) {
				idFrom = from.split("\\$");

				for (int i = 0; i < idFrom.length; i++) {
					int id = Integer.valueOf(idFrom[i]);
					if (!hasStation[id]) {
						hasStation[id] = true;
						idOfStation[id] = numOfBus + id;
					}
					addEdge(cnt, idOfStation[id]);
					addEdge(idOfStation[id], cnt);
				}
			}
			cnt++;
		}
	}

	void dfs(int u, List<Integer> path) {
		path.add(u);
		if (u-numOfBus == endId) {
			pathes.add(path);
			return;
		}
		for (int i = head[u]; i != -1; i = edges[i].next) {
			int v = edges[i].to;
			if (vis[v])
				continue;
			vis[v] = true;
			dfs(v, path);
		}

	}

	private void formRet() {
		for (int i = 0; i < pathes.size(); i++) {
			List<Integer> temp = pathes.get(i);
			Path tPath = new Path();
			tPath.path = temp;
			tPath.time = 0;
			tPath.transfer=0;
			tPath.busTime=new ArrayList<Integer>();
			int cnt = 0;
			for (int j = 1; j < temp.size(); j += 2) {
				cnt++;
				int preId = temp.get(j - 1);
				int proId = temp.get(j + 1);
				int pos1 = 0, pos2 = 0;
				int appear = 0;
				int routineId = temp.get(j);
				String[] lenTo = routineDao.get(Bus.class, routineId).getLenTo().trim().split("\\$");
				String[] idTo = routineDao.get(Bus.class, routineId).getIdTo().trim().split("\\$");
				for (int k = 0; k < idTo.length; k++) {
					if (Integer.valueOf(idTo[k]).equals(preId) || Integer.valueOf(idTo[k]).equals(proId)) {
						appear++;
						if (appear == 1)
							pos1 = k;
						else
							pos2 = k;
					}
					if (appear == 2) {
						break;
					}
				}
				if (appear == 2) {
					pos1 = pos1 + pos2;
					pos2 = (pos1 - pos2 < pos2) ? (pos1 - pos2) : pos2;
					pos1 -= pos2;
					int sum = 0;
					for (int k = pos1; k + 1 <= pos2; k++) {
						sum += Integer.valueOf(lenTo[k]);
					}
					tPath.busTime.add(sum);
					tPath.time+=sum;
				} else {
					String from = routineDao.get(Bus.class, routineId).getLenFrom().trim();
					String lenFrom[] = null;
					if (null != from) {
						lenFrom = from.split("\\$");
						String[] idFrom = routineDao.get(Bus.class, routineId).getIdFrom().trim().split("\\$");
						for (int k = 0; k < idTo.length; k++) {
							if (Integer.valueOf(idFrom[k]).equals(preId) || Integer.valueOf(idFrom[k]).equals(proId)) {
								appear++;
								if (appear == 1)
									pos1 = k;
								else
									pos2 = k;
							}
							if (appear == 2) {
								break;
							}
						}
						if (appear == 2) {
							pos1 = pos1 + pos2;
							pos2 = (pos1 - pos2 < pos2) ? (pos1 - pos2) : pos2;
							pos1 -= pos2;
							int sum = 0;
							for (int k = pos1; k + 1 <= pos2; k++) {
								sum += Integer.valueOf(lenFrom[k]);
							}
							tPath.busTime.add(sum);
							tPath.time+=sum;
						}
					}
				}
			}
			tPath.transfer=cnt-1;
			ret.add(tPath);
		}
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charSet=utf-8");
		String start = request.getParameter("start");
		String end = request.getParameter("end");

		stationDao = new StationDao();
		routineDao = new RoutineDao();

		Station s=stationDao.findByName(start);
		Station t=stationDao.findByName(end);
		ret=new ArrayList<PathServlet.Path>();
		if(null != s && null != t){
			startId = s.getId();
			endId = t.getId();
			pathes = new ArrayList<List<Integer>>();
			constructGraph();
			dfs(startId, new ArrayList<Integer>());
			formRet();
		}
		if(0!=ret.size())
			request.setAttribute("PathRET", ret);
		else request.setAttribute("PathRET", null);
		
		request.getRequestDispatcher("routine.jsp").forward(request,response);  
	}
}
