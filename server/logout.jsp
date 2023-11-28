<%
    if( session != null){
        session.invalidate() ;
        response.sendRedirect("../pages/login.jsp") ;
    }

%>