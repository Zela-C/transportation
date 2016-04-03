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

import org.hibernate.Session;

@WebFilter(filterName = "LoginFilter", urlPatterns = { "/index.jsp", "/login" })
public class LoginFilter implements Filter {
	private FilterConfig config;

	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
		System.out.println("娘子，");
	}

	public void destroy() {
		this.config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("啊哈！");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		if (!(null == session.getAttribute("authority"))) {
			request.getRequestDispatcher("/path.jsp").forward(request, response);
		}
		chain.doFilter(request, response);
	}

}
