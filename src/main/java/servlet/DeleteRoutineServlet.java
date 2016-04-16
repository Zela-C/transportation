package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RoutineDao;
import entity.Routine;

@WebServlet(name = "DeleteRoutineServlet", urlPatterns = { "/deleteroutine" })
public class DeleteRoutineServlet extends HttpServlet {

	private static final long serialVersionUID = -359341749196809639L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Integer pos = Integer.valueOf(req.getParameter("pos"));
		RoutineDao routineDao = new RoutineDao();

		Routine routineDelete = routineDao.findByPos(pos);
			routineDao.delete(Routine.class, routineDelete.getId());
			List<Routine> list = routineDao.find("from Routine where pos>" + pos);
			if (!list.isEmpty()) {
				for (Routine routine : list) {
					routine.setPos(routine.getPos() - 1);
					routineDao.update(routine);
				}
			}
	}
}
