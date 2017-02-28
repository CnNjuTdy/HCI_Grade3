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
import entity.RSI;
import entity.RSICondition;

/**
 * Servlet implementation class servlet_RSI
 */
public class servlet_RSI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet_RSI() {
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
		System.out.println("servlet_rsi id = "+id);
		analysis a= new analysis();
		List<RSI> list1 = a.getRSI(id,6);
		List<RSI> list2 = a.getRSI(id,9);
		List<RSI> list3 = a.getRSI(id,12);
		RSICondition condition = a.judgeRSI(id);
		ArrayList<String> result = condition.getResult(); 
		System.out.println(list1.size()+"abxa");
		System.out.println(list1.size()+"abxa");
		System.out.println(list1.size()+"abxa");
		request.setAttribute("id", id);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("result", result);
		request.getRequestDispatcher("jsp/RSI.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
