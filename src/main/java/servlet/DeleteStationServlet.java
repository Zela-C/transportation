﻿package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StationDao;
import entity.Station;

@WebServlet(name = "DeleteStationServlet", urlPatterns = { "/deletestation" })
public class DeleteStationServlet extends HttpServlet {
	private static final long serialVersionUID = -4366693297024664604L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Integer pos = Integer.valueOf(req.getParameter("pos"));
		StationDao stationDao = new StationDao();
		PrintWriter out = resp.getWriter();
		Station stationDelete = stationDao.findByPos(pos);
		if (stationDelete.getUnreferenced()) {//the station isn't referred by any routine ,can be deleted safely
			stationDao.delete(Station.class, stationDelete.getId());
			List<Station> list = stationDao.find("from Station where pos>" + pos);
			if (!list.isEmpty()) {
				for (Station station : list) {
					station.setPos(station.getPos() - 1);
					stationDao.update(station);
				}
			}
			out.print("suc");
			return ;
		} else {//the station is being referred by some routine , can not be deleted
			//TODO
			out.print("err");
			return ;
		}
	}
}
