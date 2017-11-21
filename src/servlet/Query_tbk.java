package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DBBean;

public class Query_tbk extends HttpServlet {

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
		
		String year = request.getParameter("year");
		
		String term = request.getParameter("term");
		
		String course = request.getParameter("course");
		
		String major = request.getParameter("major");
		
		String s_class = request.getParameter("s_class");
		
		String sql = "SELECT"+
				"	FriRelShip.id AS r_0,"+
				"	course.c_no AS r_1,"+
				"	course.c_name AS r_2,"+
				"	course.c_credit AS r_3,"+
				"	student.s_no AS r_4,"+
				"	student.s_name AS r_5,"+
				"	FriRelShip.grade AS r_6,"+
				"	FriRelShip.pgrade AS r_7,"+
				"	(0.7*FriRelShip.grade+0.3*FriRelShip.pgrade) AS r_8"+
				"	FROM"+
				"	student"+
				"	INNER JOIN FriRelShip ON FriRelShip.s_no = student.s_no"+
				"	INNER JOIN teacourse ON FriRelShip.t_c_id = teacourse.t_c_id"+
				"	INNER JOIN course ON teacourse.c_no = course.c_no"+
				"	WHERE"+
				"	FriRelShip.grade=0 and"+
				"	t_no = '" +t_no+"'";
							
		
		if(!year.equals("")){
			sql+=" and `year` = '"+ year +"'";
		}
		if(!term.equals("")){
			sql+=" and term like '"+ term +"'";
		}
		if(!course.equals("")){
			sql+=" and c_name like '"+ course +"'";
		}
		if(!major.equals("")){
			sql+=" and s_major like '"+ major +"'";
		}
		if(!s_class.equals("")){
			sql+=" and s_class like '"+ s_class +"'";
		}
		
		System.out.println(sql);
		
		ResultSet rs = null;
		rs = db.executeQuery(sql);
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		try {
			while(rs.next()){
				Map<String, String> map1 = new HashMap<String, String>();
				map1.put("r_0", rs.getString("r_0"));
				map1.put("r_1", rs.getString("r_1"));
				map1.put("r_2", rs.getString("r_2"));
				map1.put("r_3", rs.getString("r_3"));
				map1.put("r_4", rs.getString("r_4"));
				map1.put("r_5", rs.getString("r_5"));
				map1.put("r_6", rs.getString("r_6"));
				map1.put("r_7", rs.getString("r_7"));
				map1.put("r_8", rs.getString("r_8"));
				list.add(map1);
			}
			session.setAttribute("list", list);
			rs.close();
			db.close();
			response.sendRedirect("bukao.jsp");
		} catch (SQLException e) {
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
