package web.AAS;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin")
public class AdminPanelServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    
    public AdminPanelServlet() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String destPage="";
    	if(session.getAttribute("privelege").equals("1")){
    		destPage = "admin1.jsp";
    	}else if(session.getAttribute("privelege").equals("2")){
    		destPage = "admin2.jsp";
    	}
    	RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
    	dispatcher.forward(request, response);
	}

	
}
