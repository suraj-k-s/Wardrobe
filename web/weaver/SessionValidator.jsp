<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("wid") == null)
        {
            response.sendRedirect("../");
        }
%>