package web.AAS;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class memberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public memberLoginServlet() {
        super();
    }

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
        String password_ = request.getParameter("password_");
        
        MemberController memberCtrl = new MemberController();
        
        try {
            Member member = memberCtrl.checkLogin(userName, password_);
            String destPage = "login.jsp";
             
            if (member != null) {
                HttpSession session = request.getSession();
                session.setAttribute("member", member);
                session.setAttribute("userName", member.getuserName());
                session.setAttribute("privelege", member.getPrivelege());
                destPage = "home.jsp";
            } else {
                String message = "Invalid userName/password_";
                request.setAttribute("message", message);
            }
             
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
             
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
	}
}
