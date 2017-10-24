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

public class Query_s extends HttpServlet {

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
		
		String year = request.getParameter("year");
		
		String term = request.getParameter("term");
		
		String course = request.getParameter("course");
		
		String sql = "SELECT"+
				"	course.c_no as r_1,"+
				"	course.c_name as r_2,"+
				"	FriRelShip.grade as r_3,"+
				"	teacher.t_name as r_4,"+
				"	course.c_credit as r_5,"+
				"	FriRelShip.pgrade AS r_6,"+
				"	(0.7*FriRelShip.grade+0.3*FriRelShip.pgrade) AS r_7"+
				"	FROM"+
				"	student"+
				"	INNER JOIN FriRelShip ON FriRelShip.s_no = student.s_no"+
				"	INNER JOIN teacourse ON FriRelShip.t_c_id = teacourse.t_c_id"+
				"	INNER JOIN course ON teacourse.c_no = course.c_no"+
				"	INNER JOIN teacher ON teacourse.t_no = teacher.t_no"+
				"	WHERE"+
				"	student.s_no = '" +s_no+"'";
		
		if(!year.equals("")){
			sql+=" and `year` = '"+ year +"'";
		}
		if(!term.equals("")){
			sql+=" and term like '"+ term +"'";
		}
		if(!course.equals("")){
			sql+=" and c_name like '"+ course +"'";
		}
		
		System.out.println(sql);
		
		ResultSet rs = null;
		rs = db.executeQuery(sql);
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		try {
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("r_1", rs.getString("r_1"));
				map.put("r_2", rs.getString("r_2"));
				map.put("r_3", rs.getString("r_3"));
				map.put("r_4", rs.getString("r_4"));
				map.put("r_5", rs.getString("r_5"));
				map.put("r_6", rs.getString("r_6"));
				map.put("r_7", rs.getString("r_7"));
				list.add(map);
			}
			session.setAttribute("list", list);
			rs.close();
			db.close();
			response.sendRedirect("s_home.jsp");
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
