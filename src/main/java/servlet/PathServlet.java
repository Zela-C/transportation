package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.PriorityQueue;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import entity.Bus;
import entity.Station;
import helper.Edge;
import helper.Path;
import helper.Node;

@WebServlet(name = "pathFind", urlPatterns = { "/findPath" })
public class PathServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 18;
	private final int MAXN = (int) 2e9;
	private final int ROUTINE_NUM = 18000;
	private final int STATION_NUM = 600000;
	private StationDao stationDao;
	private RoutineDao routineDao;
	private Station startStation;
	private Station endStation;
	private List<Bus> routines;
	private List<Station> stations;

	private int numOfEdges;
	private int head[] = new int[ROUTINE_NUM + STATION_NUM];
	private int count[] = new int[ROUTINE_NUM];
	private int numOfBus;
	private int numOfStations;
	private int startId, endId;
	private int idOfStation[] = new int[STATION_NUM];
	private int dis[] = new int[ROUTINE_NUM + STATION_NUM];
	private int timeFrom[][] = new int[ROUTINE_NUM][200];
	private int timeTo[][] = new int[ROUTINE_NUM][200];
	private boolean hasStation[] = new boolean[STATION_NUM];
	private boolean vis[] = new boolean[ROUTINE_NUM + STATION_NUM];

	private Edge edges[] = new Edge[ROUTINE_NUM * 200 * 2];
	private ArrayList<Path> ret;

	private void addEdge(int from, int to) {
		edges[numOfEdges] = new Edge();
		edges[numOfEdges].from = from;
		edges[numOfEdges].to = to;
		edges[numOfEdges].next = head[from];
		head[from] = numOfEdges++;
	}

	private void constructGraph() {
		numOfEdges = 0;
		numOfStations = 0;
		Arrays.fill(count, 0);
		Arrays.fill(head, -1);
		Arrays.fill(idOfStation, -1);
		for (int i = 0; i < ROUTINE_NUM; i++) {
			Arrays.fill(timeFrom[i], 0);
			Arrays.fill(timeTo[i], 0);
		}
		Arrays.fill(vis, false);
		stations = stationDao.findAll(Station.class);
		routines = routineDao.findAll(Bus.class);
		numOfBus = routines.size();

		for (Bus routine : routines) {
			Arrays.fill(hasStation, false);

			String[] idTo = routine.getIdTo().trim().split("\\$");
			String[] timeToStr = routine.getLenTo().trim().split("\\$");
			timeTo[routine.getId()][0] = 0;
			for (int i = 0; i < idTo.length; i++) {
				int id = Integer.valueOf(idTo[i]);
				if (!vis[id]) {
					numOfStations++;
					idOfStation[numOfStations] = id;
					vis[id] = true;
				}
				/* 计算当前线路中，过去方向上，起点站到其他站点的时间 */
				timeTo[routine.getId()][i + 1] = timeTo[routine.getId()][i] + Integer.valueOf(timeToStr[i]);

				if (!hasStation[id]) {
					hasStation[id] = true;
					addEdge(routine.getId(), id + numOfBus);
					addEdge(id + numOfBus, routine.getId());
				}
			}

			String from = routine.getIdFrom().trim();
			String[] idFrom = null;
			if (null != from && !from.equals("")) {
				idFrom = from.split("\\$");
				String[] timeFromStr = routine.getLenFrom().trim().split("\\$");
				timeFrom[routine.getId()][0] = 0;
				for (int i = 0; i < idFrom.length; i++) {
					int id = Integer.valueOf(idFrom[i]);
					if (!vis[id]) {
						numOfStations++;
						idOfStation[numOfStations] = id;
						vis[id] = true;
					}
					/* 计算当前线路中，回来方向上，终点站到其他站点的时间 */
					timeFrom[routine.getId()][i + 1] = timeFrom[routine.getId()][i] + Integer.valueOf(timeFromStr[i]);

					if (!hasStation[id]) {
						hasStation[id] = true;
						idOfStation[id] = numOfBus + id;
						addEdge(routine.getId(), id + numOfBus);
						addEdge(id + numOfBus, routine.getId());
					}
				}
			}
		}
	}

	private int getTimeTo(int routineId, int stationAId, int stationBId) {
		// Bus routine = routineDao.get(Bus.class, routineId);
		Bus routine = routines.get(routineId - 1);
		String[] idTo = routine.getIdTo().trim().split("\\$");
		int pos1 = -1, pos2 = -1;
		for (int i = 0; i < idTo.length; i++) {
			if (Integer.valueOf(idTo[i]) == stationAId) {
				pos1 = i;
			} else if (Integer.valueOf(idTo[i]) == stationBId) {
				pos2 = i;
			}
			if (pos1 != -1 && pos2 != -1)
				break;
		}
		if (pos1 == -1 || pos2 == -1)
			return -1;
		if (pos1 > pos2) {
			pos1 += pos2;
			pos2 = pos1 - pos2;
			pos1 -= pos2;
		}
		return timeTo[routineId][pos2] - timeTo[routineId][pos1];
	}

	private int getTimeFrom(int routineId, int stationAId, int stationBId) {
		// Bus routine = routineDao.get(Bus.class, routineId);
		Bus routine = routines.get(routineId - 1);
		String from = routine.getIdFrom().trim();
		String[] idFrom = null;
		if (null != from && !from.equals("")) {
			idFrom = from.split("\\$");

			int pos1 = -1, pos2 = -1;
			for (int i = 0; i < idFrom.length; i++) {
				if (Integer.valueOf(idFrom[i]) == stationAId) {
					pos1 = i;
				} else if (Integer.valueOf(idFrom[i]) == stationBId) {
					pos2 = i;
				}
				if (pos1 != -1 && pos2 != -1)
					break;
			}
			if (pos1 == -1 || pos2 == -1)
				return -1;
			if (pos1 > pos2) {
				pos1 += pos2;
				pos2 = pos1 - pos2;
				pos1 -= pos2;
			}
			return timeFrom[routineId][pos2] - timeFrom[routineId][pos1];
		} else
			return -1;
	}

	private void dijstra(int flag) {
		Arrays.fill(vis, false);
		Arrays.fill(dis, MAXN);
		for (int i = head[endId]; i != -1; i = edges[i].next) {
			int u = edges[i].to;
			for (int j = head[u]; j != -1; j = edges[j].next) {
				int v = edges[j].to;
				int time = getTimeTo(u, endId - numOfBus, v - numOfBus);
				if (time != -1) {
					if (flag != 2)
						dis[v - numOfBus] = time;
					else
						dis[v - numOfBus] = 0;
				} else {
					time = getTimeFrom(u, endId - numOfBus, v - numOfBus);
					if (time != -1) {
						if (flag != 2)
							dis[v - numOfBus] = time;
						else
							dis[v - numOfBus] = 0;
					}
				}
			}
		}
		vis[endId - numOfBus] = true;
		dis[endId - numOfBus] = 0;
		for (int i = 2; i <= numOfStations; i++) {
			int minTime = MAXN;
			int minId = 0;
			for (int j = 1; j <= numOfStations; j++) {
				int id = idOfStation[j];
				if (!vis[id] && dis[id] < minTime) {
					minTime = dis[id];
					minId = id;
				}
			}
			if (minTime < MAXN) {
				vis[minId] = true;
				for (int j = head[minId + numOfBus]; j != -1; j = edges[j].next) {
					int t = edges[j].to;
					for (int k = head[t]; k != -1; k = edges[k].next) {
						int v = edges[k].to;
						int time = getTimeTo(t, minId, v - numOfBus);
						if (time == -1)
							time = getTimeFrom(t, minId, v - numOfBus);
						if (flag != 2) {
							if (time != -1 && !vis[v - numOfBus] && dis[v - numOfBus] > dis[minId] + time) {
								dis[v - numOfBus] = dis[minId] + time;
							}
						} else {
							if (time != -1 && !vis[v - numOfBus] && dis[v - numOfBus] > dis[minId] + 1) {
								dis[v - numOfBus] = dis[minId] + 1;
							}
						}
					}
				}
			}
		}
	}

	private void A_star(int flag) {
		if(dis[startId-numOfBus]==MAXN) return ;
		int cnt = 0;
		Comparator<Node> cmp = new Comparator<Node>() {
			public int compare(Node o1, Node o2) {
				// TODO Auto-generated method stub
				if (o2.f < o1.f)
					return 1;
				if (o2.f > o1.f)
					return -1;
				return 0;
			}
		};
		PriorityQueue<Node> que = new PriorityQueue<Node>(11, cmp);
		Node u = new Node();
		u.g = 0;
		u.f = dis[startId - numOfBus];
		u.vertex = startId;
		u.path = new Path();
		u.path.path = new ArrayList<String>();
		u.path.path.add(stations.get(startId - numOfBus - 1).getName());
		u.path.busTime = new ArrayList<Integer>();
		u.path.time = 0;
		u.path.transfer = 0;
//		u.vis= new boolean [STATION_NUM+ROUTINE_NUM];
//		u.vis[u.vertex]=true;
//		Arrays.fill(u.vis, false);
		que.offer(u);
		boolean check;
		while (!que.isEmpty()) {
			check=false;
			u = que.poll();
			for(int i=0;i<u.path.path.size();i++){
				for(int j=0;j<u.path.path.size();j++){
					if(i==j) continue;
					if(u.path.path.get(i).equals(u.path.path.get(j))){
						check=true;
						break;
					}
				}
				if(check) break;
			}
			if(check) continue;
			System.out.println(u.vertex);
			if (u.vertex == endId) {
				cnt++;
				ret.add(u.path);
				if (cnt == 8) {
					return;
				}
				continue;
			}
			for (int i = head[u.vertex]; i != -1; i = edges[i].next) {
				int t = edges[i].to;
				
//				if(u.path.path.size()>1 && routines.get(t-1).getName().equals( u.path.path.get(u.path.path.size()-2) )) continue;
//				if(u.vis[t]) continue;
//				u.vis[t]=true;
				for (int j = head[t]; j != -1; j = edges[j].next) {
					int tv = edges[j].to;
//					if(u.path.path.size()>=1 && stations.get(tv-numOfBus-1).getName().equals( u.path.path.get(u.path.path.size()-1) )) continue;
//					if(u.vis[tv]) continue;
//					u.vis[tv]=true;
					int time = getTimeFrom(t, u.vertex - numOfBus, tv - numOfBus);
					if (time == -1)
						time = getTimeTo(t, u.vertex - numOfBus, tv - numOfBus);
					if (time != -1) {
						Node v = new Node();
						v.vertex = tv;
						if (flag != 2)
							v.g = u.g + time;
						else
							v.g = u.g + 1;
						v.f = v.g + dis[tv - numOfBus];
						ArrayList<String> tmp = new ArrayList<String>();
						ArrayList<Integer> tmp2 = new ArrayList<Integer>();
						for (String val : u.path.path) {
							tmp.add(val);
						}
						for (Integer val : u.path.busTime) {
							tmp2.add(val);
						}
//						v.vis=new boolean[STATION_NUM+ROUTINE_NUM];
//						System.arraycopy(u.vis, 0, v.vis, 0, STATION_NUM+ROUTINE_NUM);
						v.path = new Path();
						v.path.path = tmp;
						v.path.path.add(routines.get(t - 1).getName());
						v.path.path.add(stations.get(tv - numOfBus - 1).getName());
						v.path.busTime = tmp2;
						v.path.busTime.add(time);
						v.path.time = u.path.time + time;
						v.path.transfer = u.path.transfer + 1;
						que.offer(v);
					}
				}
			}
		}
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charSet=utf-8");
		String startName = request.getParameter("start");
		String endName = request.getParameter("end");
		String sort = request.getParameter("sort");
		if (sort == null) {
			sort = "1";
			request.setAttribute("sort", "1");
		}
		request.setAttribute("flag", "1");
		stationDao = new StationDao();
		routineDao = new RoutineDao();

		System.out.println(startName + "fuck!");
		System.out.println(endName + "kick!");
		System.out.println(sort + "suck!");
		startStation = stationDao.findByName(startName);
		endStation = stationDao.findByName(endName);

		if (null == startStation || null == endStation || startName.equals(endName)) {
			System.out.println("NO Station!!");
			request.setAttribute("PathRET", null);
			request.getRequestDispatcher("path.jsp").forward(request, response);
		} else {
			ret = new ArrayList<Path>();
			constructGraph();
			startId = startStation.getId() + numOfBus;
			endId = endStation.getId() + numOfBus;
			if (!sort.equals("2")) {
				dijstra(1);
				System.out.println("dijstra！");
				A_star(1);
			} else {
				dijstra(2);
				System.out.println("dijstra！");
				A_star(2);
			}
			System.out.println("搜索完成！");
			if (0 != ret.size())
				request.setAttribute("PathRET", ret);
			else
				request.setAttribute("PathRET", null);
			request.getRequestDispatcher("path.jsp").forward(request, response);
		}
	}
}