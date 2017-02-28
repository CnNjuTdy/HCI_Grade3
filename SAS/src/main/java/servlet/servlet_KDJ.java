package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import analysis.analysis;
import entity.Condition;
import entity.KDJ;

/**
 * Servlet implementation class candlestick
 */
public class servlet_KDJ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet_KDJ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if (id == null) {
			id = "sh600050";		
		}
		System.out.println("servlet_JDK id = "+id);
		analysis a= new analysis();
		List<KDJ> list = a.getKDJ(id);
		Condition condition = a.judgeKDJ(list, id);
		ArrayList<String> result = condition.getResult();
		request.setAttribute("analyseResult", result);
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/KDJ.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
