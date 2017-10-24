package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import bean.DBBean;

public class Password extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		DBBean db = (DBBean) session.getAttribute("db");
		
		String oldpassword = request.getParameter("oldpassword");
		
		System.out.println(oldpassword);
		
		
		String password = request.getParameter("password");
		
		String s_no = (String) session.getAttribute("s_no");
		
		String sql = null;
		
		sql = "select student.s_password from student where s_no = '"+ s_no+"'";
		
		ResultSet rs  = null;
		
		rs = db.executeQuery(sql);
		
		try {
			if(rs.next()){
				if(rs.getString("s_password").equals(oldpassword)){
					
					sql = "update student set s_password = '"+password+"' where s_no='"+ s_no +"'";
					db.executeUpdate(sql);
					rs.close();
					db.close();
					response.sendRedirect("login.jsp");
					
				}else{
					response.sendRedirect("error.jsp");
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
