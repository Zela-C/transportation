package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "AdminFilter", urlPatterns = { "/routine.jsp", "/station.jsp" })
// this two module need administrator authority
public class AdminFilter implements Filter {
	private FilterConfig config;

	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
	}

	public void destroy() {
		this.config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("开始拦截");
		long before = System.currentTimeMillis();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		if (null == session.getAttribute("authority") || ((Integer) session.getAttribute("authority")) < 1) {
			req.getRequestDispatcher("/balala.jsp").forward(req, res);
		}
		chain.doFilter(request, response);

	}

}
