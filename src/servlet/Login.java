package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DBBean;

public class Login extends HttpServlet {	//用户登陆

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		DBBean db = new DBBean(); 

		db.setConnStr("jdbc:mysql://localhost:3306/grade_systems?user=root&password=root");

		String username = request.getParameter("username");

		String password = request.getParameter("password");

		String role = request.getParameter("role");

		HttpSession session = request.getSession(true);

		session.setAttribute("db", db);	//把数据库连接好的通信放在会话中，以便后续操作
		session.setMaxInactiveInterval(-1);	//设置的值为负数，则表示会话将永远不会超时。常用于设置当前会话时间。
		ResultSet rs = null;

		if (role.equals("1")) {	//1代表的是学生

			String sql = "select * from student where s_no='" + username + "' and s_password ='" + password + "'";
			rs = db.executeQuery(sql);
			try {
				if (rs.next()) {
					session.setAttribute("s_no", rs.getString("s_no"));
					session.setAttribute("name", rs.getString("s_name"));
					rs.close();
					db.close();
					response.sendRedirect("s_home.jsp");
				} else {
					rs.close();
					db.close();
					response.sendRedirect("loginFail.jsp");

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {	//其他的代表的是老师
			String sql = "select * from teacher where t_no='" + username + "' and t_password ='" + password + "'";
			rs = db.executeQuery(sql);
			try {
				if (rs.next()) {
					session.setAttribute("t_no", rs.getString("t_no"));
					session.setAttribute("name", rs.getString("t_name"));
					rs.close();
					db.close();
					response.sendRedirect("t_home.jsp");
				} else {
					rs.close();
					db.close();
					response.sendRedirect("loginFail.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		this.doGet(request, response);
	}

}
