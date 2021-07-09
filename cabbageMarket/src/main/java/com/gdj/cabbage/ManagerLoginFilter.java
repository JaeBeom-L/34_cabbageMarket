package com.gdj.cabbage;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/ManagerLoginFilter")
public class ManagerLoginFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/* log.debug(Debuging.DEBUG+" filter 적용 전");
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
			session = ((HttpServletRequest)request).getSession();
		}
		
		if(session.getAttribute("managerSession") == null) {
			if(response instanceof HttpServletResponse) {
				((HttpServletResponse)response).sendRedirect("/cabbageMarket/manager/login"); // home.jsp
			}			
			return;
		}
		*/
		
		chain.doFilter(request, response);
		
		
		// log.debug(Debuging.DEBUG+" filter 적용 후");
	}

}