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

@WebFilter(filterName = "GeneralFilte", urlPatterns = { "/*" })
// this two module need administrator authority
public class GeneralFilter implements Filter {
	private FilterConfig config = null;
	HttpServletRequest req = null;
	HttpServletResponse res = null;
	HttpSession session = null;
	String url=null;

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("ssssssssssssssssssssssssssss");
		config = filterConfig;
	}

	public void destroy() {
		this.config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("开始拦截");
		long before = System.currentTimeMillis();
		req = (HttpServletRequest) request;
		res = (HttpServletResponse) response;
		session = req.getSession();
		url=req.getRequestURL().toString();
		System.out.println(url);
		if(url.contains("routine") || url.contains("station") || url.contains("path")||url.contains("company")){
			authorityJudge(chain);
		}else if(url.equals("http://localhost:8080/transportation/") || url.contains("login") ||url.contains("regist")){
			loginStateJudge(chain);
		}else if(url.contains("logout"))
			logoutStateJudge(chain);
		else{
			chain.doFilter(request, response);
		}
	}
	
	private void authorityJudge(FilterChain chain) throws ServletException, IOException{
		if (null == session.getAttribute("authority") || ((Integer) session.getAttribute("authority")) < 1) {
			res.sendRedirect("balala.jsp");
		}
		chain.doFilter(req, res);
	}
	
	private void logoutStateJudge(FilterChain chain) throws ServletException, IOException{
		if (null == session.getAttribute("authority")) {
			res.sendRedirect("login.jsp");
			return ;
		}
		chain.doFilter(req, res);
		return ;
	}
	
	private void loginStateJudge(FilterChain chain) throws ServletException, IOException{
		if (!(null == session.getAttribute("authority"))) {
			res.sendRedirect("path.jsp");
			return ;
		}
		else{
				chain.doFilter(req, res);
				return ;
		}
	}
	
}
