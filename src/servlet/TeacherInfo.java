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

public class TeacherInfo extends HttpServlet {

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
		
		String t_no = (String) session.getAttribute("t_no");
		
		ResultSet rs = null;
		
		String sql = "select * from teacher where teacher.t_no = "+ t_no ;
		
		rs = db.executeQuery(sql);
		try {
			if(rs.next()){
				session.setAttribute("t_name", rs.getString("t_name"));
				session.setAttribute("t_sex", rs.getString("t_sex"));
				if(rs.getString("t_sex").equals("ÄÐ")){
					session.setAttribute("o_sex", "Å®");
				}else{
					session.setAttribute("o_sex", "ÄÐ");
				}
				session.setAttribute("t_dept", rs.getString("t_department"));
				rs.close();
				db.close();
				response.sendRedirect("teacherInfo.jsp");
			}
			else
			{
				rs.close();
				db.close();
		
				response.sendRedirect("error.jsp");
				
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
