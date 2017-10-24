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

public class PersonInfo extends HttpServlet {

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
		
		String s_no = (String) session.getAttribute("s_no");
		
		ResultSet rs = null;
		
		String sql = "select * from student where student.s_no = "+ s_no ;
		
		rs = db.executeQuery(sql);
		try {
			if(rs.next()){
				session.setAttribute("s_name", rs.getString("s_name"));
				session.setAttribute("s_sex", rs.getString("s_sex"));
				if(rs.getString("s_sex").equals("ÄÐ")){
					session.setAttribute("o_sex", "Å®");
				}else{
					session.setAttribute("o_sex", "ÄÐ");
				}
				session.setAttribute("s_year", rs.getString("s_year"));
				session.setAttribute("s_dept", rs.getString("s_department"));
				session.setAttribute("s_major", rs.getString("s_major"));
				session.setAttribute("s_class", rs.getString("s_class"));
				rs.close();
				db.close();
				response.sendRedirect("personInfo.jsp");
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
