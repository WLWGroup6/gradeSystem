package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DBBean;

public class UpdateGrade extends HttpServlet {

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

		String scids[] = (String[]) request.getParameterValues("s_c_id");
		String grades[] = (String[]) request.getParameterValues("grade");
		String pgrades[] = (String[]) request.getParameterValues("pgrade");
		HttpSession session = request.getSession();
		
		DBBean db = (DBBean) session.getAttribute("db");
		
		
		
		for(int i = 0;i<scids.length;i++){
			System.out.println(scids[i]+grades[i]);
			System.out.println("update FriRelShip set grade = "+ grades[i]+" where id = '"+scids[i]+"'");
			db.executeUpdate("update FriRelShip set grade = "+ grades[i]+" where id = '"+scids[i]+"'");
		}
		for(int i = 0;i<scids.length;i++){
			System.out.println(scids[i]+pgrades[i]);
			System.out.println("update FriRelShip set pgrade = "+ pgrades[i]+" where id = '"+scids[i]+"'");
			db.executeUpdate("update FriRelShip set pgrade = "+ pgrades[i]+" where id = '"+scids[i]+"'");
		}
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
