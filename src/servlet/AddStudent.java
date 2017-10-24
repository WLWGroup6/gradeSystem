package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DBBean;

public class AddStudent extends HttpServlet {	//注册用户

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
		DBBean db = new DBBean();
		
		db.setConnStr("jdbc:mysql://localhost:3306/grade_systems?user=root&password=root");
		
		req.setCharacterEncoding("UTF-8");
		
		String username = "";
		String password = "";
		String name = "";
		String sex = "";
		String year = "";
		String dept = "";
		String major = "";
		String s_class = "";
		
		if(req.getParameter("username")!=null)
			username = req.getParameter("username");
		if(req.getParameter("password")!=null)
			password = req.getParameter("password");
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
		
		ResultSet rs = null;
		String sql1 = "select * from student where s_no='"+username+"'";	
		System.out.println(sql1);	
		rs = db.executeQuery(sql1);	
		try {
			if(rs.next()){
				rs.close();
				db.close();
				resp.sendRedirect("registerFail.jsp");
			}else{

				String sql = "insert into student(s_no,s_password,s_name,s_sex,s_year,s_department,s_major,s_class) values('"+username+"','"+password+"','"+name+"','"+sex+"','"+year+"','"+dept+"','"+major+"','"+s_class+"')";
				
				db.executeUpdate(sql);
				
				db.close();
				
				resp.sendRedirect("registerSuccess.jsp");
				
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
