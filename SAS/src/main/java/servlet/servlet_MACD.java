package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import analysis.analysis;
import entity.MACD;
import entity.MACDCondition;

/**
 * Servlet implementation class candlestick
 */
public class servlet_MACD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet_MACD() {
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
		System.out.println("servlet_macd id = "+id);
		analysis a= new analysis();
		List<MACD> list = a.getMACD(id);
		MACDCondition macdCondition = a.judgeMACD(list, id);
		ArrayList<String> result = macdCondition.getResult();
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("result", result);
		request.getRequestDispatcher("jsp/MACD.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
