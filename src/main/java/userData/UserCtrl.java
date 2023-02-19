package userData;

 

import java.io.IOException;
import java.sql.SQLException;

 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 

@WebServlet("/userCtrl")
public class UserCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

 

    public UserCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

 
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	
        String action = request.getParameter("action");
        String loginid = request.getParameter("userID");
        String loginpw = request.getParameter("pw");
        UserDAO dao = new UserDAO();
        System.out.println("action: " + action);



        if(action.equals("join")) {
            String name = request.getParameter("name");
            int grade = Integer.parseInt(request.getParameter("grade"));

            int permission = 0;
            UserDO p = new UserDO(loginid, name, grade, loginpw, permission);
            
            System.out.println(loginid + loginpw +  name + grade);
            try {
                dao.insert(p);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(action.equals("login")) {
        	
            System.out.println("userID: " + loginid);
            System.out.println("pw: " + loginpw);
            UserDO p = dao.findById(loginid);
            System.out.println("p.pw: "+ p.pw);
            if(p.pw.equals(loginpw)) {
                if(p.permission == 1) {
                    response.sendRedirect("Main.jsp?userID="+loginid);
                } else {
                    response.sendRedirect("userPage/userLogin.jsp");
                }
            } else {
                response.sendRedirect("userPage/userLogin.jsp");
            }
        }
    }

 

}