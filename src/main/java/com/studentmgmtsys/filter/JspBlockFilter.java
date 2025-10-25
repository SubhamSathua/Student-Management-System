package com.studentmgmtsys.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/admin/*")
public class JspBlockFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        // Get the requested JSP path
        String path = req.getRequestURI();

        // Allow only internal forwards (not direct browser access)
        boolean isForwarded = req.getAttribute("javax.servlet.forward.request_uri") != null;

        if (!isForwarded) {
            // User is trying to access JSP directly — block it
            resp.sendRedirect(req.getContextPath() + "/DashboardServlet");
            return;
        }

        // If it's an internal forward (from servlet), allow
        chain.doFilter(request, response);
    }
}