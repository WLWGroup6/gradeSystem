package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DBBean;

public class Update extends HttpServlet {

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
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		DBBean db = (DBBean) session.getAttribute("db");
		
		String s_no = (String) session.getAttribute("s_no");
		
		String name = "";
		String sex = "";
		String year = "";
		String dept = "";
		String major = "";
		String s_class = "";
		
		if(req.getParameter("realname")!=null)
			name = req.getParameter("realname");
		if(req.getParameter("sex")!=null)
			sex = req.getParameter("sex");
		if(req.getParameter("dept")!=null)
			dept = req.getParameter("dept");
		if(req.getParameter("major")!=null)
			major = req.getParameter("major");
		if(req.getParameter("year")!=null)
			year = req.getParameter("year");
		if(req.getParameter("class")!=null)
			s_class = req.getParameter("class");
		
		String sql = "update student set s_name = '"+ name +"',s_sex = '"+ sex +"',s_year = '"+year+"',s_department ='"+dept+"',s_major = '"+major+"',s_class = '"+s_class+"' where s_no ='"+s_no+"'";
		
		db.executeUpdate(sql);
		
		db.close();
		
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
