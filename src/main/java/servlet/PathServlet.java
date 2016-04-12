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
import entity.Routine;
import entity.Station;
import helper.Edge;
import helper.Path;
import helper.Node;

@WebServlet(name = "pathFind", urlPatterns = { "/findPath" })
public class PathServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7648841775297584279L;
	private final int MAXN = (int) 2e9;
	private final int ROUTINE_NUM = 18000;
	private final int STATION_NUM = 600000;
	private final int TRANS_TIME = 8;
	private StationDao stationDao;
	private RoutineDao routineDao;
	private Station startStation;
	private Station endStation;
	private List<Routine> routines;
	private List<Station> stations;

	private int numOfEdges;
	private int head[] = new int[ROUTINE_NUM + STATION_NUM];
	private int numOfRouines;
	private int numOfStations;
	private int startPos, endPos;
	private int posOfStation[] = new int[STATION_NUM];
	private int dis[] = new int[ROUTINE_NUM + STATION_NUM];
	private int timeFrom[][] = new int[ROUTINE_NUM][200];
	private int timeTo[][] = new int[ROUTINE_NUM][200];
	private int count[] = new int[ROUTINE_NUM + STATION_NUM];
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
		Arrays.fill(head, -1);
		Arrays.fill(posOfStation, -1);
		for (int i = 0; i < ROUTINE_NUM; i++) {
			Arrays.fill(timeFrom[i], 0);
			Arrays.fill(timeTo[i], 0);
		}
		Arrays.fill(vis, false);
		stations = stationDao.findAll(Station.class);
		routines = routineDao.findAll(Routine.class);
		numOfRouines = routines.size();
		// System.out.println("开始构图！");
		// System.out.println("线路条数："+routines.size());
		for (Routine routine : routines) {
			Arrays.fill(hasStation, false);

			String[] posTo = routine.getPosTo().trim().split("\\$");
			String[] timeToStr = routine.getLenTo().trim().split("\\$");
			timeTo[routine.getPos()][0] = 0;
			for (int i = 0; i < posTo.length; i++) {
				int pos = Integer.valueOf(posTo[i]);
				if (!vis[pos]) {
					numOfStations++;
					posOfStation[numOfStations] = pos;
					vis[pos] = true;
				}
				/* 计算当前线路中，过去方向上，起点站到其他站点的时间 */
				if (i > 0)
					timeTo[routine.getPos()][i] = timeTo[routine.getPos()][i - 1] + Integer.valueOf(timeToStr[i - 1]);

				if (!hasStation[pos]) {
					hasStation[pos] = true;
					addEdge(routine.getPos(), pos + numOfRouines);
					addEdge(pos + numOfRouines, routine.getPos());
				}
			}

			String from = routine.getPosFrom().trim();
			String[] posFrom = null;
			if (null != from && !from.equals("")) {
				posFrom = from.split("\\$");
				String[] timeFromStr = routine.getLenFrom().trim().split("\\$");
				timeFrom[routine.getPos()][0] = 0;
				for (int i = 0; i < posFrom.length; i++) {
					int pos = Integer.valueOf(posFrom[i]);
					if (!vis[pos]) {
						numOfStations++;
						posOfStation[numOfStations] = pos;
						vis[pos] = true;
					}
					/* 计算当前线路中，回来方向上，终点站到其他站点的时间 */
					if (i > 0)
						timeFrom[routine.getPos()][i] = timeFrom[routine.getPos()][i - 1]
								+ Integer.valueOf(timeFromStr[i - 1]);

					if (!hasStation[pos]) {
						hasStation[pos] = true;
						addEdge(routine.getPos(), pos + numOfRouines);
						addEdge(pos + numOfRouines, routine.getPos());
					}
				}
			}
		}
	}

	private int getTimeTo(int routinePos, int stationAPos, int stationBPos) {
		// Bus routine = routineDao.get(Bus.class, routineId);
		Routine routine = routines.get(routinePos - 1);
		String[] posTo = routine.getPosTo().trim().split("\\$");
		int pos1 = -1, pos2 = -1;
		for (int i = 0; i < posTo.length; i++) {
			if (Integer.valueOf(posTo[i]) == stationAPos) {
				pos1 = i;
			} else if (Integer.valueOf(posTo[i]) == stationBPos) {
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
		return timeTo[routinePos][pos2] - timeTo[routinePos][pos1];
	}

	private int getTimeFrom(int routinePos, int stationAPos, int stationBPos) {
		// Bus routine = routineDao.get(Bus.class, routineId);
		Routine routine = routines.get(routinePos - 1);
		String from = routine.getPosFrom().trim();
		String[] posFrom = null;
		if (null != from && !from.equals("")) {
			posFrom = from.split("\\$");

			int pos1 = -1, pos2 = -1;
			for (int i = 0; i < posFrom.length; i++) {
				if (Integer.valueOf(posFrom[i]) == stationAPos) {
					pos1 = i;
				} else if (Integer.valueOf(posFrom[i]) == stationBPos) {
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
			return timeFrom[routinePos][pos2] - timeFrom[routinePos][pos1];
		} else
			return -1;
	}

	private void dijstra(int flag) {
		Arrays.fill(vis, false);
		Arrays.fill(dis, MAXN);
		for (int i = head[endPos]; i != -1; i = edges[i].next) {
			int u = edges[i].to;
			for (int j = head[u]; j != -1; j = edges[j].next) {
				int v = edges[j].to;
				int time = getTimeTo(u, endPos - numOfRouines, v - numOfRouines);
				if (time != -1) {
					if (flag != 2)
						dis[v - numOfRouines] = time;
					else
						dis[v - numOfRouines] = 0;
				} else {
					time = getTimeFrom(u, endPos - numOfRouines, v - numOfRouines);
					if (time != -1) {
						if (flag != 2)
							dis[v - numOfRouines] = time;
						else
							dis[v - numOfRouines] = 0;
					}
				}
			}
		}
		vis[endPos - numOfRouines] = true;
		dis[endPos - numOfRouines] = 0;
		for (int i = 2; i <= numOfStations; i++) {
			int minTime = MAXN;
			int minPos = 0;
			for (int j = 1; j <= numOfStations; j++) {
				int pos = posOfStation[j];
				if (!vis[pos] && dis[pos] < minTime) {
					minTime = dis[pos];
					minPos = pos;
				}
			}
			if (minTime < MAXN) {
				vis[minPos] = true;
				for (int j = head[minPos + numOfRouines]; j != -1; j = edges[j].next) {
					int t = edges[j].to;
					for (int k = head[t]; k != -1; k = edges[k].next) {
						int v = edges[k].to;
						int time = getTimeTo(t, minPos, v - numOfRouines);
						if (time == -1)
							time = getTimeFrom(t, minPos, v - numOfRouines);
						if (flag != 2) {
							if (time != -1 && !vis[v - numOfRouines]
									&& dis[v - numOfRouines] > dis[minPos] + time + TRANS_TIME) {
								dis[v - numOfRouines] = dis[minPos] + time + TRANS_TIME;
							}
						} else {
							if (time != -1 && !vis[v - numOfRouines] && dis[v - numOfRouines] > dis[minPos] + 1) {
								dis[v - numOfRouines] = dis[minPos] + 1;
							}
						}
					}
				}
			}
		}
	}

	private void A_star(int flag) {
		Arrays.fill(count, 0);
		// System.out.println(startId+" "+dis[startId-numOfBus]);
		if (dis[startPos - numOfRouines] == MAXN)
			return;
		int cnt = 0;
		Comparator<Node> cmp = new Comparator<Node>() {
			public int compare(Node o1, Node o2) {
				// TODO Auto-generated method stub
				if (o2.f < o1.f)
					return 1;
				else if (o2.f > o1.f)
					return -1;
				else {
					if (2 != o1.flag) {
						if (o2.path.transfer < o1.path.transfer)
							return 1;
						else if (o2.path.transfer > o1.path.transfer)
							return -1;
						else
							return 0;
					} else {
						if (o2.path.time < o1.path.time)
							return 1;
						else if (o2.path.time > o1.path.time)
							return -1;
						else
							return 0;
					}
				}
			}
		};
		PriorityQueue<Node> que = new PriorityQueue<Node>(11, cmp);
		Node u = new Node();
		u.flag = flag;
		u.g = 0;
		u.f = dis[startPos - numOfRouines];
		u.vertex = startPos;
		u.path = new Path();
		u.path.path = new ArrayList<String>();
		u.path.path.add(stations.get(startPos - numOfRouines - 1).getName());
		u.path.busTime = new ArrayList<Integer>();
		u.path.time = 0;
		u.path.transfer = 0;
		que.offer(u);
		boolean check;
		while (!que.isEmpty()) {
			check = false;
			u = que.poll();
			for (int i = 0; i < u.path.path.size(); i++) {
				for (int j = 0; j < u.path.path.size(); j++) {
					if (i == j)
						continue;
					if (u.path.path.get(i).equals(u.path.path.get(j))) {
						check = true;
						break;
					}
				}
				if (check)
					break;
			}
			if (check)
				continue;
			// System.out.println(u.vertex);
			if (!check && u.vertex == endPos) {
				cnt++;
				ret.add(u.path);
				if (cnt == 8) {
					return;
				}
				continue;
			}
			count[u.vertex]++;
//			 if(count[u.vertex]>Math.max(120,(numOfStations+numOfRouines))) return;
			for (int i = head[u.vertex]; i != -1; i = edges[i].next) {
				int t = edges[i].to;
				for (int j = head[t]; j != -1; j = edges[j].next) {
					int tv = edges[j].to;
					if (dis[tv - numOfRouines] == MAXN)
						continue;
					int time = getTimeFrom(t, u.vertex - numOfRouines, tv - numOfRouines);
					if (time == -1)
						time = getTimeTo(t, u.vertex - numOfRouines, tv - numOfRouines);
					if (time != -1) {
						Node v = new Node();
						v.vertex = tv;
						v.flag = u.flag;
						if (flag != 2) {
							v.g = u.g + time;
							if (v.vertex != endPos)
								v.g += TRANS_TIME;
						} else
							v.g = u.g + 1;
						v.f = v.g + dis[tv - numOfRouines];
						ArrayList<String> tmp = new ArrayList<String>();
						ArrayList<Integer> tmp2 = new ArrayList<Integer>();
						for (String val : u.path.path) {
							tmp.add(val);
						}
						for (Integer val : u.path.busTime) {
							tmp2.add(val);
						}
						v.path = new Path();
						v.path.path = tmp;
						v.path.path.add(routines.get(t - 1).getName());
						v.path.path.add(stations.get(tv - numOfRouines - 1).getName());
						v.path.busTime = tmp2;
						v.path.busTime.add(time);
						v.path.time = u.path.time + time;
						if (v.vertex != endPos)
							v.path.time += TRANS_TIME;
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
			startPos = startStation.getPos() + numOfRouines;
			endPos = endStation.getPos() + numOfRouines;
			if (!sort.equals("2")) {
				dijstra(1);
				System.out.println("dijstra！");
				System.out.println(startName + " " + startPos + " " + dis[startPos - numOfRouines]);
				System.out.println(endName + " " + endPos + " " + dis[endPos - numOfRouines]);
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
