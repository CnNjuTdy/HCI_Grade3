package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StockDAO;
import entity.Stock;

/**
 * Servlet implementation class compare
 */
public class compare extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public compare() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String name1 = request.getParameter("name1");
		String name2 = request.getParameter("name2");
		StockDAO dao = new StockDAO();
		name1 = dao.checkInput(name1);
		name2 = dao.checkInput(name2);
//		response.sendRedirect("stockInfo?id=sh600050");
		if (name1.equals("error") || name2.equals("error"))
			out.print("error");
		else {
			String avg1 = dao.getAverageValue(name1);
			String avg2 = dao.getAverageValue(name2);
			out.print("[" + avg1 + "," + avg2 + "]");
		}
		out.flush();
		out.close();
	}
}
