package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import analysis.forecast;
import dao.StockDAO;
import entity.Stock;
import entity.Tendency;

/**
 * Servlet implementation class StockServlet
 */
public class stockInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stockInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if (id == null) {
			id = "sh600050";		
		}
		StockDAO dao = new StockDAO();
		List<Stock> list = dao.getDefaultList(id);
		Stock stock = list.get(list.size()-1);
		String jsonList = dao.getDefaultJsonList(id);
//		System.out.println(list.size());
		forecast f = new forecast();
		Tendency tendency = f.getTomorrow(id);
		System.out.println(tendency.getPriceone()+" "+tendency.getPricetwo()+" "+tendency.getPricethree()+" "+tendency.getPricetoday());
		String analysis = tendency.getAnalysis(); 
		request.setAttribute("id", id);
		request.setAttribute("stock", stock);
		request.setAttribute("list", list);
		request.setAttribute("jsonList", jsonList);
		request.setAttribute("analysis", analysis);
		System.out.println("预测："+analysis);
		request.getRequestDispatcher("jsp/singleStock.jsp").forward(request, response);
//		request.getRequestDispatcher("jsp/lineChart.jsp").forward(request, response);
		//response.sendRedirect("jsp/aboutOurs.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
