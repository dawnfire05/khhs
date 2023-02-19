/*
	�Խñ� ��Ʈ�ѷ�
	2022.12.10 ����
	������ ������
	-���� �������� ���� ���-
 */
package contentData;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userData.UserDAO;

/**
 * Servlet implementation class ContentsCtrl
 */
@WebServlet("/ContentsCtrl")
public class ContentsCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentsCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentsDAO dao = new ContentsDAO();
		int postID = dao.findRecentID() + 1;
		String action = request.getParameter("action");
		
		if(action==null) {
			RequestDispatcher dispacher = request.getRequestDispatcher(contentsList(request));
			dispacher.forward(request,response);
		}
		
		if(action.equals("write")) {
			String title = request.getParameter("title");
			String content= request.getParameter("content");
			String name = request.getParameter("name");
			UserDAO user = new UserDAO();
			int permission = user.findById(name).getPermission();
			if(permission == 0) {
				request.setAttribute("error" , "�������� ���� ������Դϴ�.");
				RequestDispatcher dispacher = request.getRequestDispatcher("contentList.jsp");
				dispacher.forward(request,response);
			} else {
				ContentsDO c = new ContentsDO(postID, title, content);
				try {
					dao.insert(c);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				RequestDispatcher dispacher = request.getRequestDispatcher("contentList.jsp");
				dispacher.forward(request,response);
			}
		}
	}
	
	public String contentsList(HttpServletRequest request) {
		ContentsDAO dao = new ContentsDAO();
		
		String[] list = new String[dao.findRecentID()];
		for(int i=dao.findRecentID(); i>0; i++) {
			list[i] = dao.findByID(i+1).title;
		}
		request.setAttribute("contentsList", list);
		return "contentPage/contentList.jsp";
	}

}
