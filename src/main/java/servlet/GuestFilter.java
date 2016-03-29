package servlet;

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

@WebFilter(filterName = "GuestFilter", urlPatterns = { "/station.jsp", "/routine.jsp" })
public class GuestFilter implements Filter {
	private FilterConfig config;

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("老子初始化了");
		config = filterConfig;
	}

	public void destroy() {
		System.out.println("老子去死了");
		this.config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("开始拦截");
		long before=System.currentTimeMillis();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		chain.doFilter(request, response);
	}

}
